class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :telephone, null: false
      t.string :brunch_days, null: false
      t.string :brunch_hours, null:false
      t.string :restaurant_url

      t.timestamps null: false
    end
  end
end
