class CheckoutController < ApplicationController
    before_action :require_user_logged_in!

    def create
        @cart=[]
        current_cart.order.items.each do |item|
            @cart.push({"price"=>item.product.stripe_price_id, "quantity"=>item.quantity})
        end
        @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items:@cart ,
            mode: 'payment',
            success_url: success_url ,
            cancel_url: cancel_url ,
        })
        respond_to do |format|
            format.js
        end
    end

    def success
        current_cart.order.save
        if current_cart.order.items.count > 0
            @transaction = Transaction.new(user_id: current_user.id, sub_total: current_cart.order.sub_total, status: "Processing", method: "Credit Card")
            @transaction.save
            current_cart.order.items.each do |item|
                transactionItem = TransactionItem.new(transaction_id: @transaction.id , product_id: item.product_id , quantity: item.quantity , price: item.price)
                transactionItem.save 
            end
            current_cart.order.destroy
            current_cart.remove_items
        end
    end

    def cancel
    end

end
