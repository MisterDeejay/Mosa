class RemoveDistColumn < ActiveRecord::Migration
  def change
    remove_column :restaurants, :distance
  end
end
