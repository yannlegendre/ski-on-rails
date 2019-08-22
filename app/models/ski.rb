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

  def dates_booked
    transactions.pluck(:rental_date).to_json
  end
end
