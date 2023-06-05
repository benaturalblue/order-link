class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :company_name,    presence: true
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kana_last_name,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number,    presence: true, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
  has_many :orders
  has_many :comments
end
