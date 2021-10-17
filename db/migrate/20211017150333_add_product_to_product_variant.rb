class AddProductToProductVariant < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_variants, :product, null: false, index: true
  end
end
