class DropProductCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :product_categories
  end
end
