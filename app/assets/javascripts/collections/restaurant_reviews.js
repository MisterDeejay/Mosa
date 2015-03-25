window.Mosa.Collections.RestaurantReviews = Backbone.Collection.extend({
  model: Mosa.Models.Review,
  url: "/api/reviews",

  initialize: function(models, options) {
    this.restaurant = options.restaurant;
  }
})
