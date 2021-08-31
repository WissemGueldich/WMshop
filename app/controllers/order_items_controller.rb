class OrderItemsController < ApplicationController

    def index
        @items = current_cart.order.items
    end
    
    def create
        if current_cart.items_count+ params[:quantity].to_i < 100
            product = Product.find( params[:product_id])
            @items=[]
            current_cart.order.items.each do |item|
                @items.push(item)
            end
            
            if @items.include? product
                order_item=OrderItem.find_by(product_id: product.id)
                order_item.quantity = order_item.quantity + params[:quantity].to_i
                order_item.save
            else
                current_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])
            end

            UpdateCartJob.perform_later(@items,current_cart.items_count)
            #redirect_to request.referrer, notice: "#{view_context.pluralize(params[:quantity].to_i, product.title)}  has been added to your cart"
        else
            redirect_to root_path, alert: "You can't add more than 99 items to your cart at once !"
        end
    end
    
    def destroy
        order_item = OrderItem.find(params[:id])
        product = Product.find( order_item.product_id )

        current_cart.remove_item(id: params[:id])
        redirect_to request.referrer, notice: "#{view_context.pluralize(order_item.quantity,product.title)} has been removed from your cart"
    end
end