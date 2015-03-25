window.Mosa.Models.Restaurant = Backbone.Model.extend({
	urlRoot: "api/restaurants",

	reviews: function() {
		this._reviews = this._reviews ||
			new Mosa.Collections.RestaurantReviews([], { restaurant: this });
		return this._reviews;
	},

	parse_time: function() {
		if (this.get("open_hour") >= 12) {
			var open_time_of_day = "PM";
		} else {
			var open_time_of_day = "AM";
		}

		if (this.get("close_hour") > 12) {
			var close_hour = (this.get("close_hour") - 12).toString();
		} else {
			var close_hour = (this.get("close_hour")).toString();
		}

		if (this.get("open_min") === 0) {
			var open_min = "00";
		} else {
			var open_min = (this.get("open_min")).toString();
		}

		if (this.get("close_min") === 0) {
			var close_min = "00";
		} else {
			var close_min = (this.get("close_min")).toString();
		}

		return this.get("open_hour") + ":" + open_min + " " + open_time_of_day
			+ " - " + close_hour + ":" + close_min + " PM"
	},

	display_address: function() {
		var rawAddressArr = this.attributes.display_address.slice(2, -2)
			.split(",");

		rawAddressArr = rawAddressArr.map(function(el) {
			var myRe = /[\w]+.+[^"]/;
			var myReArr = myRe.exec(el);

			return myReArr[0];
		});

		return rawAddressArr.join(", ");
	},

	parse: function(response) {
		if(response.reviews) {
			this.reviews().set(response.reviews, { parse: true });
		}

		return response;
	},

	distance: function(){
		if(window.latLng) {
			currLoc = new google.maps.LatLng(window.latLng[0],
				window.latLng[1]);
			restLoc = new google.maps.LatLng(this.get("lat"),
				this.get("lng"));


			dist = google.maps.geometry.spherical.computeDistanceBetween(
				currLoc, restLoc
			);

			return dist;
		} else {
			return 0;
		}
	},
})
