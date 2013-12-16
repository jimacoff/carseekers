app.models.Ad = Backbone.Model.extend({

  urlRoot: '/search',

  initialize: function() {
    this.ads = this.getAds;
  },

  getAds: function(){
    var _this = this;
    this.ads.fetch({
      success: function(ads){

      }});
  }

});