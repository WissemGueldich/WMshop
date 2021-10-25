class TransactionsController < ApplicationController
    def index
        @pagy, @transactions = pagy(Transaction.where(user_id: current_user.id).order("created_at DESC"),items: 10)
    end

    def admin_index
        @pagy, @transactions = pagy(Transaction.all.order("created_at DESC"),items: 10)
    end

    def invoice 
        @transaction = Transaction.find(params[:id])
    end

    def create
        current_cart.order.street = params[:street]
        current_cart.order.city = params[:city]
        current_cart.order.country = params[:country]
        current_cart.order.zip = params[:zip]
        current_cart.order.method = params[:p_method]
        current_cart.order.save
        if current_cart.order.items.count > 0
            @transaction = Transaction.new(user_id: current_user.id, sub_total: current_cart.order.sub_total, status: "Processing", method: current_cart.order.method, street: current_cart.order.street, city: current_cart.order.city, country: current_cart.order.country, zip: current_cart.order.zip)
            @transaction.save
            current_cart.order.items.each do |item|
                transactionItem = TransactionItem.new(transaction_id: @transaction.id , product_id: item.product_id , quantity: item.quantity , price: item.price)
                transactionItem.save 
            end
            current_cart.order.destroy
            current_cart.remove_items
            redirect_to transaction_items_path(@transaction), notice: "Your order has been placed successfully!"
        end
    end
end
