class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :category_groups, :over_categories_id, :over_category_id
  end
end
