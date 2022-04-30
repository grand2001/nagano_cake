class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.integer :price
      t.text :introduction
      t.timestamps null: false
    end
  end
end
