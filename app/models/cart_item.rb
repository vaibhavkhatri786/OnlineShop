class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  before_save :set_unit_price
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price.to_i
    end
  end

  def total
    unit_price.to_i * quantity
  end
  
  private
  
  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total*quantity
  end
end
