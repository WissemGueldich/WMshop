class CheckoutController < ApplicationController

    def create
        @cart=[]
        current_cart.order.items.each do |item|
            @cart.push(item.product)
        end
        product=Product.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items:[{ price: product.stripe_price_id, quantity: 6}] ,
            mode: 'payment',
            success_url: success_url ,
            cancel_url: cancel_url ,
        })
        respond_to do |format|
            format.js
        end
    end

    def success

    end

    def cancel

    end
#@cart.collect { |item| item.to_builder.attributes! }

end
