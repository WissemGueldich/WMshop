class AddOverCategoryIdToCategoryGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :category_groups, :over_categories, foreign_key: true

  end
end
