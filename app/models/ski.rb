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

  def dates_booked
    transactions.pluck(:rental_date).to_json
  end

  # def dates_booked
  #   res = transactions.map do |transaction|
  #     transaction.rental_date
  #   end
  #   res.to_json

  #   transactions.map(rental_date).to_json
  # end
end
# array.map {|e| e.method }
# array.map(&:method)
