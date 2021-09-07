class UpdateCartJob < ApplicationJob
    queue_as :default
    def perform(items,count,quantity,prod,user_id)
        if  count > 0
            product = ApplicationController.render(partial: 'shared/cart', locals: { items: items} )
        else
            product = '<p>Your cart is empty</p>'
        end
        ActionCable.server.broadcast("cart_channel", {product: product, count: count, quantity: quantity, prod: prod, user_id: user_id})
    end
end