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

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:city, :size, :model],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  scope :available_at, -> (date) do
    where("id NOT IN (SELECT ski_id FROM transactions WHERE transactions.rental_date = ?)", date)
  end

  def dates_booked
    transactions.pluck(:rental_date).to_json
  end

  def past_transactions
    transactions.where("rental_date < #{Date.today}")
  end

  def current_transactions
    transactions.where("rental_date == #{Date.today}")
  end

  def future_transactions
    transactions.where("rental_date > #{Date.today}")
  end
end
