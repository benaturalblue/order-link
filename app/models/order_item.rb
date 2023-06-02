class OrderItem < ApplicationRecord
  belongs_to :order
  
  validates :item_name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }

end
