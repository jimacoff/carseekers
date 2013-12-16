app.views.AdsView = Backbone.View.extend({

  tagName: 'div',
  className: 'ads-list',
  template: JST['templates/ads_list'],
  events: {},

  initialize: function(){
    this.listenTo(this.collection, "reset", this.render);
  },

  render: function(){
    var _this = this;
    this.$el.html(this.template({ ads: this.collection.models }));
    return this;
  }

});