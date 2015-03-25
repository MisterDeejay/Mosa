json.array! @restaurants do |r|
  json.merge! r.attributes
  json.open_str r.btm_start_time_before_type_cast
  json.close_str r.btm_end_time_before_type_cast
  if r.btm_start_time
    json.open_hour r.btm_start_time.hour
    json.open_min r.btm_start_time.min
  end

  if r.btm_end_time
    json.close_hour r.btm_end_time.hour
    json.close_min r.btm_end_time.min
  end

  json.review do
    json.id r.reviews.first.id
    json.body r.reviews.first.body
    json.user_id r.reviews.first.user_id
    json.rating r.reviews.first.rating
    json.created_at r.reviews.first.created_at
    json.updated_at r.reviews.first.updated_at
  end
end
