class AddProductToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :product, index: true
  end
end
