window.Mosa.Views.RestaurantShow = Backbone.View.extend({
	template: JST["restaurants/show"],
	className: 'container-fluid',

	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
		// this.listenTo(this.model.comments(), "sync add remove", this.render);
	},

	render: function() {
		var content = this.template({ restaurant: this.model });
		this.$el.html(content);

		return this;
	}
})
