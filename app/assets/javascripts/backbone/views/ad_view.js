app.views.AdsView = Backbone.View.extend({

  tagName: 'div',
  className: 'canvas-holder',
  events: {},

  // initialize: function(){
  //   this.listenTo(this.collection, "reset", this.render);
  // },

  render: function(){
    var ads = this.collection.models;
    var _this = this;
    this.$el.html(this.gMap(ads));
    return this;
  },

  gMap: function(ads){

    var mapOptions = {
      center: new google.maps.LatLng(51.511214, -0.119824),
      zoom: 0,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    this.loadMarkers(ads);
  },

  loadMarkers: function(ads){

    var bounds = new google.maps.LatLngBounds();
    var _this = this;
    _(ads).each(function(ad) {
      _this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city);
      bounds.extend(new google.maps.LatLng(ad.attributes.latitude, ad.attributes.longitude));
    });

     map.fitBounds(bounds);
  },

  addMarker: function(lat, lng, title) {
    var iconBase = '/assets/';
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map,
      title: title,
      icon: iconBase + 'car.ico'
    });
  },

  zoomToMarker: function(lat, lng, title) {
    var bounds = new google.maps.LatLngBounds();
    this.addMarker(lat, lng, title);
    bounds.extend(new google.maps.LatLng(lat, lng));
    map.fitBounds(bounds);
  }


});