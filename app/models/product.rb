class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :images
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :category
end
