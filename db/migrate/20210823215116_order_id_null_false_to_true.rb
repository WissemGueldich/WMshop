class OrderIdNullFalseToTrue < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :order_id, :integer, null: true
  end

  def down
    change_column :orders, :order_id, :integer, null: false
  end
  
end
