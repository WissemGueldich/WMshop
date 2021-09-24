class OverCategory < ApplicationRecord
  has_many :subcategories, class_name: 'CategoryGroup', dependent: :destroy
end
