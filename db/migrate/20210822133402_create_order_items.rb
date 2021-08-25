class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order
      t.belongs_to :product, null: false
      t.integer :quantity, null: false
      t.decimal :price, precision: 15, scale: 2, null: false

      t.timestamps
    end


  end
end
