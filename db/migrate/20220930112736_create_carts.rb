class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :subtotal
      t.belongs_to :users

      t.timestamps
    end
  end
end
