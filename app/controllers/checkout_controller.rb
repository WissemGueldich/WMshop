class CheckoutController < ApplicationController

    def create
        @cart=[]
        current_cart.order.items.each do |item|
            @cart.push(item.product)
        end
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: @cart.collect { |item| item.to_builder.attributes! },
            mode: 'payment',
            success_url: root_url ,
            cancel_url: root_url ,
        })
        respond_to do |format|
            format.js
        end
    end


end
