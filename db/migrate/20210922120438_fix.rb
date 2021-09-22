class Fix < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :category_groups_id, :category_group_id
  end
end
