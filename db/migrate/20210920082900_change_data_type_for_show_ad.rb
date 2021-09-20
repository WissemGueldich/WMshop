class ChangeDataTypeForShowAd < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :show_ad, :string
  end
end
