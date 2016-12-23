class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :item_number
      t.text :description
      t.integer :quantity
      t.float :price
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
