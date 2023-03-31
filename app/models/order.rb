class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details
  enum payment:{ card: 0, bank: 1 }
  enum order_status: { waiting: 0, confirm: 1, under_constraction: 2, ready_to_ship: 3, shipped: 4}
end
