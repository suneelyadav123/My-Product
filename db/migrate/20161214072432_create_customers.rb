class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name 
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
