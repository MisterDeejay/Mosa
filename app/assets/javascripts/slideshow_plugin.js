$.Slideshow = function(el) {
  timeOut: 3000;
  this.$el = $(el);
  this.$imgs = this.$el.children();
  this.activeIdx = 0;
  this.transitioning = false;

  this.$activeImg = this.$imgs.eq(this.activeIdx);
  this.$activeImg.addClass("active");

  setInterval(this.swapImg.bind(this), 10000);
}

$.Slideshow.prototype.swapImg = function() {
  if(this.transitioning) {
    return;
  }
  this.transitioning = true;

  // Fade out old image
  this.activeIdx = (this.activeIdx + 1 + this.$imgs.length) % this.$imgs.length;
  var $newImg = this.$imgs.eq(this.activeIdx);

  this.$activeImg.removeClass("active").addClass("transitioning");
  this.$activeImg.one("transitionend", (function() {
    this.$activeImg.removeClass("transitioning");

    this.$activeImg = $newImg;
    this.$activeImg.addClass("transitioning");
    setTimeout((function() {
      this.$activeImg.removeClass("transitioning").addClass("active");
      this.transitioning = false;
    }).bind(this), 0);
  }).bind(this));
};

$.fn.imgs = function() {
  return this.each(function() {
    new $.Slideshow(this);
  });
};

$(function () {
  $(".slideshow").imgs();
});
