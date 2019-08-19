class Transaction < ApplicationRecord
  belongs_to :ski
  belongs_to :customer, class_name: 'User'

  validates :customer, presence: true
  validates :ski, presence: true
  validates :rentalDate, presence: true, uniqueness: { scope: :ski }
end
