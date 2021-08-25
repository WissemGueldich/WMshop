class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :description, presence: true

    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many_attached :image
end
