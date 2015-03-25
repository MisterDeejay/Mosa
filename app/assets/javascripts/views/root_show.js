window.Mosa.Views.RootShow = Backbone.CompositeView.extend({
  template: JST["root"],

  initialize: function(options) {
    this.listenTo(this.collection, "sync", this.render)
    this.router = options.router;
    this.latLng = [];
  },

  events: {
    "click button.current-location": "getLatLng",
    "submit": "getLatLng"
  },

  getLatLng: function(event) {
    if (event.type === "click") {
      var view = this;
      navigator.geolocation.getCurrentPosition(function(position) {
        window.latLng = [position.coords.latitude, position.coords.longitude];
        view.router.index();
      });
    } else {
      event.preventDefault();
      zipcode = $(".zipcode").val();
      geocoder = new google.maps.Geocoder();

      var view = this;
      geocoder.geocode({ "address": zipcode }, function(results) {
        window.latLng = [results[0].geometry.location.k, results[0].geometry.location.D]
        view.router.index();
      });
    }
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);

    return this;
  }
})
