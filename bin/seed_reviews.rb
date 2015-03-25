arr = []

Restaurant.all.each do |r|
  if r.neighborhoods = "unavailable" 
    yelp_r = Yelp.client.business("#{r.yelp_id}")
    r.reviews.create(user_id: [1,2].sample, body: yelp_r.reviews[0].excerpt,
      rating: yelp_r.reviews[0].rating)

    if !!(yelp_r.location.to_json.match(/neighborhoods/))
      puts "#{r.name} neighborhoods found!"
      r.neighborhoods = yelp_r.location.neighborhoods
    else
      arr << r.name
    end

    r.rating_image_url = yelp_r.reviews[0].rating_image_url
    r.rating_image_url_large = yelp_r.reviews[0].rating_image_large_url
    r.rating_image_url_small = yelp_r.reviews[0].rating_image_small_url

    puts "#{r.name} successfully saved!" if r.save
  end
end

puts arr
