class Transaction < ApplicationRecord
  belongs_to :user
  has_many :transaction_items, dependent: :destroy
end
