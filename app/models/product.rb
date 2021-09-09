class Product < ApplicationRecord

    validates :title, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :description, presence: true

    belongs_to :category
    has_one_attached :image, dependent: :destroy
    include Rails.application.routes.url_helpers

    def thumbnail 
        return self.image.variant(resize: '300x300!').processed
    end
    
    def image_url
        rails_blob_path(self.image, disposition: "attachment", only_path: true)
    end

    def show_thumbnail
        return self.image.variant(resize: '550x550!').processed 
    end

    def cart_thumbnail
        return self.image.variant(resize: '100x100!').processed   
    end


    def to_s
        title
    end
    
    after_create do 
        product = Stripe::Product.create(name: title)
        price = Stripe::Price.create(product: product, unit_amount: self.price.to_i*100, currency: "usd")
        update(stripe_product_id: product.id, stripe_price_id: price.id)
    end

    after_update :create_and_assign_new_stripe_price, if: :saved_change_to_price?
    def create_and_assign_new_stripe_price
        price = Stripe::Price.create(product: self.stripe_product_id, unit_amount: self.price.to_i*100, currency: "usd")
        update(stripe_price_id: price.id)
    end

    
end
