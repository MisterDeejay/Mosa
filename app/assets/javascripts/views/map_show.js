window.Mosa.Views.MapShow = Backbone.CompositeView.extend({
  template: JST["restaurants/list_item"],
  id: "map",
  className: "invisible",

  initialize: function (location_arr) {
    this._markers = {};
    this.listenTo(this.collection, 'add sync', this.addMarker);
    this.listenTo(this.collection, 'remove', this.removeMarker);
  },

  render: function() {
    var mapOptions = {
      center: { lat: window.latLng[0], lng: window.latLng[1] },
      zoom: 12
    };

    this._map = new google.maps.Map(this.el, mapOptions);
    var view = this;
    google.maps.event.addListenerOnce(this._map, 'idle', function() {
      google.maps.event.trigger(view._map, 'resize');
      view._map.setCenter({ lat: window.latLng[0], lng: window.latLng[1] });
      setTimeout(
        function(){ $("#map").removeClass('invisible') }.bind(this), 0
      );
    });

    this.collection.each(this.addMarker.bind(this));

    return this;
  },

  addMarker: function(restaurant) {
    if(this._markers[restaurant.id]) { return };
    var view = this;

    var latLng = new google.maps.LatLng(
      restaurant.get('lat'),
      restaurant.get('lng')
    );

    var marker = new google.maps.Marker({
      animation: google.maps.Animation.DROP,
      position: latLng,
      map: this._map,
      title: restaurant.get('name')
    });
    var restListItem = document.getElementById(restaurant.get('id'));

    google.maps.event.addDomListener(restListItem, 'mouseenter', function() {
      marker.setAnimation(google.maps.Animation.BOUNCE);
    });

    google.maps.event.addDomListener(restListItem, 'mouseleave', function() {
      if (marker.getAnimation() != null) { marker.setAnimation(null); }
    });

    google.maps.event.addListener(marker, 'click', function(event) {
      view.showMarkerInfo(event, marker, restaurant);
      $('html, body').animate({
        scrollTop: $("#" + restaurant.get('id')).offset().top
      }, 1000);
    });

    this._markers[restaurant.id] = marker;
  },

  removeMarker: function(restaurant) {
    var marker = this._markers[listing.id];
    marker.setMap(null);
    delete this._markers[listing.id];
  },

  showMarkerInfo: function(event, marker, restaurant) {
    if(this.infoWindow) {
      this.infoWindow.close();
    }
    var restaurantContent = this.template({ restaurant: restaurant });
    this.infoWindow = new google.maps.InfoWindow({
      content: restaurantContent
    });

    this.infoWindow.open(this._map, marker);
  }
})
