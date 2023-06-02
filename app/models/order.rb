class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true
  
  validates :delivery_day, presence: true
end
