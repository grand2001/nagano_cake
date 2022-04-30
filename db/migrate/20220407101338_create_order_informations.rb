class CreateOrderInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :order_informations do |t|

      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :purchase_price
      t.timestamps null: false
    end
  end
end
