window.Mosa.Views.RestaurantListItem = Backbone.View.extend({
	template: JST["restaurants/list_item"],
	tagName: 'li',

	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
	},

	render: function() {
		var content = this.template({ restaurant: this.model });
		this.$el.html(content);

		return this;
	}
})
