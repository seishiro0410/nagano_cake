class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum is_production: { impossible: 0, waiting: 1, can: 2, complete: 3 }
end
