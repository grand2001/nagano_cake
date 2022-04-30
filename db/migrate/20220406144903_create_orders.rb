class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

     t.integer :customer_id
     t.string :postal_code
     t.string :address
     t.integer :cartage
     t.integer :price
     t.timestamps null: false
    end
  end
end
