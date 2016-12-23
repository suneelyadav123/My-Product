class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_num
      t.datetime :date
      t.text :description
      t.float :lat
      t.float :lng
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
