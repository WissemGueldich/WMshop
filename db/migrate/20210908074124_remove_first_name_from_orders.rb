class RemoveFirstNameFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :first_name
    remove_column :orders, :last_name

  end
end
