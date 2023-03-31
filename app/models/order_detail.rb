class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: { waiting: 0, waiting_for_constraction: 1, under_constraction: 2, completed: 3}

end
