class AddAddressToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :street, :string
    add_column :transactions, :city, :string
    add_column :transactions, :country, :string
    add_column :transactions, :zip, :string
  end
end
