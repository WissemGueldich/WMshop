class CategoryGroup < ApplicationRecord
    has_many :categories, dependent: :destroy
    belongs_to :over_category
end
