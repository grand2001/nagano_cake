class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_informations

  enum payment_method: { credit_card: 0, transfer: 1 }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  validates :payment_method, inclusion:{in: [0, 1]}
  

  validates :address_option, inclusion:{in: [0, 1, 2]}
end
