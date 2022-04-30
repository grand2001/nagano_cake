class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.integer :cutomer_id
      t.string :postal_cade
      t.string :address
      t.timestamps  null: false
    end
  end
end