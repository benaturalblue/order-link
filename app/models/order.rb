class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sending_user, class_name: 'User', foreign_key: 'sending_user_id'
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true
  
  validates :delivery_day, presence: true
end
