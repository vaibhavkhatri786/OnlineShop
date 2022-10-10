class AddColumnToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :unit_price, :decimal
    add_column :cart_items, :total, :decimal
  end
end
