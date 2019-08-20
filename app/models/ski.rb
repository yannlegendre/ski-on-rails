class Ski < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: 'User'
  has_many :transactions, dependent: :destroy

  validates :photo, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :owner, presence: true
  validates :size, presence: true, numericality: { only_integer: true }
  validates :city, presence: true
end
