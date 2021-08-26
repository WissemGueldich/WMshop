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
            product.quantity 6
        end
    end

    after_create do 
        product = Stripe::Product.create(name: title)
        price = Stripe::Price.create(product: product, unit_amount: self.price.to_i*100, currency: "usd")


        update(stripe_product_id: product.id)
    end

    
end
