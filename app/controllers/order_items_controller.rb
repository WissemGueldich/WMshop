class OrderItemsController < ApplicationController
    respond_to :html, :json, :js
    def index
        @items = current_cart.order.items
    end
    
    def create
        if current_cart.items_count+ params[:quantity].to_i < 100
            product = Product.find( params[:product_id])
            @products=[]
            current_cart.order.items.each do |item|
                @products.push(item)
            end

            if @products.include? product
                order_item=OrderItem.find_by(product_id: product.id)
                order_item.quantity = order_item.quantity + params[:quantity].to_i
                order_item.save
            else
                current_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])
            end
            @items = []
            current_cart.order.items.each do |item|
                @items.push(item)
            end

            UpdateCartJob.perform_later(@items,current_cart.items_count)

        end

    end
    
    def destroy
        order_item = OrderItem.find(params[:id])
        product = Product.find( order_item.product_id )
        current_cart.remove_item(id: params[:id])
        @items = []
        current_cart.order.items.each do |item|
            @items.push(item)
        end
        UpdateCartJob.perform_later(@items,current_cart.items_count)
    end
end

