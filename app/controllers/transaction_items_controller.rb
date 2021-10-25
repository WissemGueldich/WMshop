class TransactionItemsController < ApplicationController
    def index
        @transaction_items = TransactionItem.where(transaction_id: params[:id])
        @transaction_id = params[:id]
    end
    def admin_index
        @transaction_items = TransactionItem.where(transaction_id: params[:id])
        @transaction_id = params[:id]
        @transaction = Transaction.find(params[:id])
    end

    def show
        render :index
    end
end
