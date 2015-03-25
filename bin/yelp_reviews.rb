Restaurant.all.each do |r|
  yelp_r = Yelp.client.business("#{r.yelp_id}")
  if (r.reviews.create(user_id: [1,2].sample, body: yelp_r.reviews[0].excerpt,
    rating: yelp_r.reviews[0].rating))
    puts "#{r.name} review successfully saved!"
  end
end
