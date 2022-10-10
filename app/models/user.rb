class User < ApplicationRecord
  has_one :cart
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  attr_writer :login
  after_create :make_cart
  
  def login
    @login || self.mobile || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(mobile) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:mobile].nil?
        where(conditions).first
      else
        where(mobile: conditions[:mobile]).first
      end
    end
  end
  
  private
  
  def make_cart
    @cart = self.create_cart()
    @cart.save
  end
  
end
