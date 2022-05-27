class Item < ApplicationRecord
 has_one_attached :image, dependent: :destroy
 belongs_to :genre
 has_many :cart_items
 has_many :order_informations
 enum payment_method: { sale:0, stop_sale:1}

 validates :genre_id, presence: true
 validates :price, presence: true
 validates :introduction, presence: true
 validates :name, presence: true
end
