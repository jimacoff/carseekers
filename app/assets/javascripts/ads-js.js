// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  var collection = new app.collections.AdList();
  collection.fetch({ success: function(ads) {
    var view = new app.views.AdsView({ collection: ads });
    var map = view.render();
    $(".map-canvas").html(map.el);
  }});

  $("#map-trigger").on("click", function(){
    var make_id = $("#search_make_id").val();
    var model_id = $("#search_model_id").val();
    var postcode = $("#search_postcode").val();
    collection.url = "/search";

    collection.fetch({
      data: {
        search: {
          postcode: postcode, make_id: make_id, model_id: model_id, fuel_type: "", engine: "", age: "", hp: "", style: "", color: ""
        }
      },
      success: function(ads) {
        var view = new app.views.AdsView({ collection: ads });
        var map = view.render();
        $(".map-canvas").html(map.el);
      }
    });
  });
});