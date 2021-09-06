class UpdateCartJob < ApplicationJob
    queue_as :default
    def perform(items,count,quantity,prod,user_id)
        product = ApplicationController.render(partial: 'shared/cart', locals: { items: items} )
        ActionCable.server.broadcast("cart_channel", {product: product, count: count, quantity: quantity, prod: prod, user_id: user_id})
    end
end