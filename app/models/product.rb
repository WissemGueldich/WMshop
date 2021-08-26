class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :description, presence: true

    belongs_to :category
    has_many_attached :images

    def to_s
        title
    end

    def to_builder
        Jbuilder.new do |product|
            product.price price.to_i
            product.quantity 
        end
    end

    
end
