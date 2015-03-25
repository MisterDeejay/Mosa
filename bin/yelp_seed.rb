#!/usr/bin/env ruby
def search
  neighborhoods = ["Alamo Square", "Anza Vista", "Ashbury Heights", "Balboa Terrace", "Bayview-Hunters Point", "Bernal Heights", "Castro", "Chinatown", "Civic Center", "Cole Valley", "Corona Heights", "Crocker-Amazon", "Diamond Heights", "Dogpatch", "Duboce Triangle", "Embarcadero", "Excelsior", "Fillmore", "Financial District", "Fisherman's Wharf", "Forest Hill", "Glen Park", "Hayes Valley", "Ingleside", "Ingleside Heights", "Ingleside Terraces", "Inner Richmond", "Inner Sunset", "Japantown", "Lakeshore", "Lakeside", "Laurel Heights", "Lower Haight", "Lower Nob Hill", "Lower Pacific Heights", "Marina/Cow Hollow", "Merced Heights", "Merced Manor", "Miraloma Park", "Mission", "Mission Bay", "Mission Terrace", "Monterey Heights", "Mount Davidson Manor", "NoPa", "Nob Hill", "Noe Valley", "North Beach/Telegraph Hill", "Oceanview", "Outer Mission", "Outer Richmond", "Outer Sunset", "Pacific Heights", "Parkmerced", "Parkside", "Portola", "Potrero Hill", "Presidio", "Presidio Heights", "Russian Hill", "Sea Cliff", "Sherwood Forest", "SoMa", "South Beach", "St Francis Wood", "Stonestown", "Sunnyside", "Tenderloin", "The Haight", "Twin Peaks", "Union Square", "Visitacion Valley", "West Portal", "Western Addition", "Westwood Highlands", "Westwood Park"]
  restaurants = []

  neighborhoods.each do |neighborhood|
    response = Yelp.client.search(
      "#{neighborhood}, San Francisco, CA", {term: 'bottomless mimosas'}
    )

    response.businesses.each do |business|
      hashified_biz = JSON.parse(business.to_json)
      restaurants << hashified_biz unless restaurants.include?(hashified_biz)
    end
  end

  restaurants.each do |restaurant|
    unless restaurant["is_closed"]
      r = Restaurant.new

      r.attributes.each do |attr, val|
        if ((restaurant["#{attr}"]) && (r["#{attr}"] == "unavailable" || r["#{attr}"] == 0))
          r["#{attr}"] = restaurant["#{attr}"]
        end
      end

      r.yelp_id = restaurant["id"]
      r.display_address = restaurant["location"]["display_address"]

      r.lat = restaurant["location"]["coordinate"]["latitude"]
      r.lng = restaurant["location"]["coordinate"]["longitude"]

      if r.save
        puts "Successfully saved: #{r}"
      end
    end
  end
end

p search
