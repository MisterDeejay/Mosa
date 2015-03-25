json.array!(@reviews) do |rvw|
	json.partial!("reviews/review", review: rvw)
end