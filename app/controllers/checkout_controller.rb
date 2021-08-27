class CheckoutController < ApplicationController
    before_action :require_user_logged_in!

    def create
        @cart=[]
        current_cart.order.items.each do |item|
            @cart.push(item.product)
        end
        @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items:[@cart.collect { |item| item.to_builder.attributes! }] ,
            mode: 'payment',
            success_url: success_url ,
            cancel_url: cancel_url ,
        })
        respond_to do |format|
            format.js
        end
    end


    def success
        current_cart.remove_items
    end


    def cancel
    end

end
