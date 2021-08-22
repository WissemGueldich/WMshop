class AddProductToProductVariants < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_variants, :product, foreign_key: true, null: false
  end
end
