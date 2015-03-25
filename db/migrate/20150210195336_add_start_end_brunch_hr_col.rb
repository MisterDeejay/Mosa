class AddStartEndBrunchHrCol < ActiveRecord::Migration
  def change
    remove_column :restaurants, :brunch_hours
    add_column :restaurants, :brunch_hours_start, :string
    add_column :restaurants, :brunch_hours_end, :string
  end
end
