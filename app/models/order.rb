class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_informations

  enum payment_method: { credit_card: 0, transfer: 1 }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
