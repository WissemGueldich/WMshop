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
            line_items:[{ name: product.title, quantity:1, currency:"usd", amount:product.price.to_i*100 }] ,
            mode: 'payment',
            success_url: root_url ,
            cancel_url: root_url ,
        })
        respond_to do |format|
            format.js
        end
    end
#@cart.collect { |item| item.to_builder.attributes! }

end
