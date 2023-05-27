class Order < ApplicationRecord
  belongs_to :user
  has_one :sending_user
  
end
