class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirmation: 1, production: 2, preparation: 3, sending: 4 }

end
