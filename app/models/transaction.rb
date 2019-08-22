class Transaction < ApplicationRecord
  belongs_to :ski
  belongs_to :customer, class_name: 'User'

  validates :customer, presence: true
  validates :ski, presence: true
  validates :rental_date, presence: true, uniqueness: { scope: :ski }

  scope :past, -> { where("rental_date < ?", Date.today) }

  def self.current
    where("rental_date = ?", Date.today)
  end

  def self.future
    where("rental_date > ?", Date.today)
  end
end
