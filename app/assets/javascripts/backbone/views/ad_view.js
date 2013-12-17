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
    function contentString(ad) { return '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1>'+ ad.attributes.title +'</h1>'+
      '<div id="bodyContent">'+
      '<p>This car is located in <b>'+ ad.attributes.city +'</b>, near to '+ ad.attributes.postcode +
      '</br>with a starting price of £<strong>' + ad.attributes.starting_price +
      '</br><a href="/users/'+ ad.attributes.user_id +'/ads/'+ ad.attributes.id +'">Visit this Auction!</a>' +
      '</strong></div>'+
      '</div>';
    }

    _(ads).each(function(ad) {
      // _this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city);
      bounds.extend(new google.maps.LatLng(ad.attributes.latitude, ad.attributes.longitude));
      google.maps.event.addListener(_this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city), 'click', function() {
        var infowindow = new google.maps.InfoWindow();
        infowindow.setContent(contentString(ad));
        infowindow.open(map, _this.addMarker(ad.attributes.latitude, ad.attributes.longitude, ad.attributes.city));
      });
    });
     map.fitBounds(bounds);
     // return markers;
  },

  infoWindow: function(title){
    new google.maps.InfoWindow({
      content: title
    });
  },


  addMarker: function(lat, lng, title) {
    var iconBase = '/assets/';
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map,
      title: title,
      icon: iconBase + 'car.ico'
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