window.Mosa.Collections.Restaurants = Backbone.Collection.extend({
	url: "api/restaurants",
	model: Mosa.Models.Restaurant,

	comparator: function(restaurant) {
		return restaurant.distance();
	},

	getOrFetch: function(id) {
		var model = this.get(id)	,
			collection = this;

		if(!model) {
			model = new Mosa.Models.Restaurant({ id: id });
			model.fetch({
				success: function() {
					collection.add(model);
				}
			});
		} else {
			model.fetch();
		}

		return model;
	}
})

window.Mosa.Collections.restaurants =
	new window.Mosa.Collections.Restaurants
