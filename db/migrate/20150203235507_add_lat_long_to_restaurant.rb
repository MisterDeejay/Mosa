class AddLatLongToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :image_url, :string
    add_column :restaurants, :city, :string, null: false
    add_column :restaurants, :state_code, :string, null: false
    add_column :restaurants, :postal_code, :string, null: false
    add_index :restaurants, :name
  end
end
