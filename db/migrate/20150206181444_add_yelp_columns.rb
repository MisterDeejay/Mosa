class AddYelpColumns < ActiveRecord::Migration
  def change
    remove_column :restaurants, :restaurant_url
    add_column :restaurants, :url, :string, default: "unavailable", null: false
    add_column :restaurants, :mobile_url, :string, default: "unavailable", null: false
    remove_column :restaurants, :telephone
    add_column :restaurants, :display_phone, :string, default: "unavailable", null: false
    add_column :restaurants, :categories, :string, default: "unavailable", null: false

    remove_column :restaurants, :name
    add_column :restaurants, :name, :string, default: "unavailable", null: false

    remove_column :restaurants, :address
    add_column :restaurants, :display_address, :string, default: "unavailable", null: false

    remove_column :restaurants, :image_url
    add_column :restaurants, :image_url, :string, default: "unavailable", null: false

    remove_column :restaurants, :city
    remove_column :restaurants, :state_code
    remove_column :restaurants, :postal_code

    remove_column :restaurants, :lat
    add_column :restaurants, :lat, :float, default: 0, null: false

    remove_column :restaurants, :lng
    add_column :restaurants, :lng, :float, default: 0, null: false

    remove_column :restaurants, :rating
    add_column :restaurants, :rating, :float, default: 0, null: false

    add_column :restaurants, :neighborhoods, :string, default: "unavailable", null: false
    add_column :restaurants, :yelp_id, :string, default: "unavailable", null: false

    remove_column :restaurants, :brunch_days
    add_column :restaurants, :brunch_days, :string, default: "unavailable", null: false

    remove_column :restaurants, :brunch_hours
    add_column :restaurants, :brunch_hours, :string, default: "unavailable", null: false
  end
end
