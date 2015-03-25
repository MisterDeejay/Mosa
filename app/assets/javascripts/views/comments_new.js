window.Mosa.Views.CommentsNew = Backbone.View.extend({
	template: JST["comments/new"],

	events: {
		"submit form": "submit"
	},

	render: function(){
		var content = this.template();
		this.$el.html(content);

		return this;
	},

	submit: function(event) {
		event.preventDefault();

		var commentParams = (event.currentTarget).serializeJSON()["comments"];
		var newComment = new Mosa.Models.Comment(commentParams);
		newComment.set("body", $("#restaurant_comment").val());
		newComment.save({}, {
			success: function() {
				Mosa.Collections.comments.add(newComment);
				// navigate back to root view
				Backbone.history.navigate("", { trigger: true })
			}
		});
	}
})
