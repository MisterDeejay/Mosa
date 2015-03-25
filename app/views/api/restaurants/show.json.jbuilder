json.merge! @restaurant.attributes

json.open_str @restaurant.btm_start_time_before_type_cast
json.close_str @restaurant.btm_end_time_before_type_cast
json.open_hour @restaurant.btm_start_time.hour
json.open_min @restaurant.btm_start_time.min
json.close_hour @restaurant.btm_end_time.hour
json.close_min @restaurant.btm_end_time.min

json.reviews @restaurant.reviews do |review|
  json.extract! review, :id, :body, :user_id, :rating, :created_at, :updated_at
end
