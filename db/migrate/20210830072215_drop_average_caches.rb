class DropAverageCaches < ActiveRecord::Migration[6.1]
  def change
    drop_table :average_caches
  end
end
