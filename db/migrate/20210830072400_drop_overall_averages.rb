class DropOverallAverages < ActiveRecord::Migration[6.1]
  def change
    drop_table :overall_averages
  end
end
