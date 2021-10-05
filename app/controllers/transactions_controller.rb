class TransactionsController < ApplicationController
    def index
        @pagy, @transactions = pagy(Transaction.where(user_id: current_user.id).order("created_at DESC"),items: 10)
    end

    def invoice 
        @transaction = Transaction.find(params[:id])
    end
end
