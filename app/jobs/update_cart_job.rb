class UpdateCartJob < ApplicationJob
    queue_as :default
    def perform(items,count)
        product = ApplicationController.render(partial: 'shared/product', locals: { items: items} )
        ActionCable.server.broadcast("cart_channel", {product: product, count: count})
    end
  end
  