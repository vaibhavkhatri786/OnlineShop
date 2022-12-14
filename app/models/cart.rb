class Cart < ApplicationRecord
  # belongs_to :user
  has_many :cart_items
  before_save :set_subtotal

  def subtotal
    cart_items.collect{|cart_item| cart_item.valid? ? cart_item.unit_price.to_i * cart_item.quantity : 0 }.sum
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
