app.collections.AdList = Backbone.Collection.extend({

  model: app.models.Ad,
  url: function(){
    return '/ads/map';
  }

});