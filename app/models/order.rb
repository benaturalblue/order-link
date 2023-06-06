class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sending_user, class_name: 'User', foreign_key: 'sending_user_id'
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true
  has_many :comments
  
  validates :delivery_day, presence: true
  validate :delivery_day_must_be_future
  validates :sending_user, presence: true
  
  private

  def delivery_day_must_be_future
    errors.add(:delivery_day, 'must be a future date') if delivery_day.present? && delivery_day < Date.tomorrow
  end
end
