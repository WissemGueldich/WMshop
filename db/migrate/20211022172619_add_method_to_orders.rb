class AddMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :method, :string
  end
end
