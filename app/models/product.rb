class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :description, presence: true

    belongs_to :category
    has_one_attached :image

    def thumbnail 
        return self.image.variant(resize: '350x350!').processed
    end

end
