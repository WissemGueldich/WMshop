class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sub_total
      t.string :status
      t.string :method

      t.timestamps
    end
  end
end
