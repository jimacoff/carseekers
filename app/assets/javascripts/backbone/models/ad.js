app.models.Ad = Backbone.Model.extend({

  urlRoot: '/ads/map',

  initialize: function() {
    this.ads = this.ads || new app.collections.AdList();
  }

});