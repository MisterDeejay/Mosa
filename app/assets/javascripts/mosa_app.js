window.Mosa = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	 new Mosa.Routers.MosaRouter({
     $rootEl: $('main')
   });
	 Backbone.history.start();
  }
};

Backbone.CompositeView = Backbone.View.extend({
  addSubview: function(selector, subview) {
    if(this.subviews(selector).length === 20 ||
      (selector === "#map-canvas" && this.subviews(selector).length === 1)) {
      this._subviews[selector] = [];
    }
    this.subviews(selector).push(subview);
    this.attachSubview(selector, subview.render());
  },

  attachSubview: function(selector, subview) {
    $subviewEl = this.$(selector)
    if(($subviewEl).children().length === 20 ||
      (selector === "#map-canvas" && $subviewEl.children().length === 1)) {
      $subviewEl.empty();
    }
    this.$(selector).append(subview.$el);
    subview.delegateEvents();
  },

  attachSubviews: function() {
    var view = this;
    _(this.subviews()).each(function(subviews, selector) {
      view.$(selector).empty();
      _(subviews).each(function(subview) {
        view.attachSubview(selector, subview);
      });
    });
  },

  subviews: function(selector) {
    this._subviews = this._subviews || {};

    if(!selector) {
      return this._subviews;
    } else {
      this._subviews[selector] = this._subviews[selector] || [];
      return this._subviews[selector];
    }
  },

  remove: function() {
    Backbone.View.prototype.remove.call(this);
    _(this.subviews()).each(function(subviews, selector) {
      _(subviews).each(function(subview) {
        subview.remove();
      });
    });
  }
});

// $(document).ready(function(){
//   Mosa.initialize();
// });
