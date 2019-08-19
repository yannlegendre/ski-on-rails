class Ski < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :transactions

  validates :photo, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :owner, presence: true
  validates :size, presence: true, numericality: { only_integer: true }
end
