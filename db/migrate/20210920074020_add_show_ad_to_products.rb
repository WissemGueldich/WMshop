class AddShowAdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :show_ad, :boolean
  end
end
