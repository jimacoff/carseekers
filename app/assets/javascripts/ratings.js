// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// just an url

// url with custom callbacks

// working on this.
rate = null;

$(document).ready(function() {

  var rateable_id;
  var rateable_type;
  var comment;

  $('#rating_rate').on('change', function(e) {
    rate = $(this.selectedOptions).first().attr('value');
  });

  var _this = this;

  $('#user-rate').on("click", function(e){
    e.preventDefault();
    rateable_id = $(this).attr("data-rateable-id");
    rateable_type = $(this).attr("data-rateable-type");
    comment = $("#rating_comment_" + rateable_id).val();
    createRate(rateable_id, rateable_type, rate, comment);
  });

});

$('#rate-modal').on("click", function(e){
  e.preventDefault();
  $('#myModal').foundation('reveal', 'open');
});

function createRate(rateable_id, rateable_type, rate, comment) {
  $.ajax({
    type: "POST",
    url: '/ratings/',
    dataType: 'json',
    data: { rating : { rateable_id: rateable_id, rateable_type: rateable_type, rate: rate, comment: comment } },
    success: function(json) {
      $('#container-'+rateable_id).html("<h3> Rating sent, Thank you. </h3></br><a class='close-reveal-modal'>&#215;</a>");
    }
  });
}