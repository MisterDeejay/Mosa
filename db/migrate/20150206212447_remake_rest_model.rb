class RemakeRestModel < ActiveRecord::Migration
  def change
    remove_column :restaurants, :brunch_days
    add_column :restaurants, :brunch_days, :string, default: "unavailable", null: false

    remove_column :restaurants, :brunch_hours
    add_column :restaurants, :brunch_hours, :string, default: "unavailable", null: false
  end
end
