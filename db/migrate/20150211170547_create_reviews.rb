class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
