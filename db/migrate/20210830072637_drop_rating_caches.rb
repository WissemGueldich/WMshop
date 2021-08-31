class DropRatingCaches < ActiveRecord::Migration[6.1]
  def change
    drop_table :rating_caches
  end
end
