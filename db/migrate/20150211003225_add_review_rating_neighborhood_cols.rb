class AddReviewRatingNeighborhoodCols < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating_image_url, :string, default: "unavailable"
    add_column :restaurants, :rating_image_url_large, :string, default: "unavailable"
    add_column :restaurants, :rating_image_url_small, :string, default: "unavailable"
    remove_column :restaurants, :brunch_hours_start
    remove_column :restaurants, :brunch_hours_end
    add_column :restaurants, :btm_start_time, :time
    add_column :restaurants, :btm_end_time, :time
  end
end
