app.views.AdsView = Backbone.View.extend({

  tagName: 'div',
  className: 'canvas-holder',
  events: {},

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
    var markers = [];
    var bubble = _.template('<div id="siteNotice"></div><h1> <%= title %> </h1><div id="bodyContent"><p>This car is located in <b> <%= city %> </b>, near to  <%= postcode %></br>with a starting price of £<strong><%= starting_price %></br><a href="/users/<%= user_id %>/ads/<%= id %>">Visit this Auction!</a></strong></div></div>');

    _(ads).each(function(ad) {
      bounds.extend(new google.maps.LatLng(ad.attributes.latitude, ad.attributes.longitude));
      google.maps.event.addListener(_this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city), 'click', function() {
        var infowindow = new google.maps.InfoWindow();
        infowindow.setContent(bubble({title: ad.attributes.title, city: ad.attributes.city, postcode: ad.attributes.postcode, starting_price: ad.attributes.starting_price, user_id: ad.attributes.user_id, id: ad.attributes.id}));
        infowindow.open(map, _this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city));
      });
    });
     map.fitBounds(bounds);
  },

  addMarker: function(lat, lng, title) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map,
      title: title,
      icon: "http://i42.tinypic.com/2uemao7.png"
    });
    return marker;
  },

  zoomToMarker: function(lat, lng, title) {
    var bounds = new google.maps.LatLngBounds();
    this.addMarker(lat, lng, title);
    bounds.extend(new google.maps.LatLng(lat, lng));
    map.fitBounds(bounds);
  },

});