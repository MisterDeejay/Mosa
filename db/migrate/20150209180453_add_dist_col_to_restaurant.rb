class AddDistColToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :distance, :float
  end
end
