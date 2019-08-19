class Transaction < ApplicationRecord
  belongs_to :ski
  belongs_to :customer, class_name: 'User'
end
