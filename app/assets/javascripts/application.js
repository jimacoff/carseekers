// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });



$( document ).ready(function() {

  var make_id = "";

  $('#ad_car_make').on('change', function() {
    make_id = this.selectedIndex;
    loadModels(make_id);
  });

  function loadModels(make_id) {
    $.ajax({
      type: "POST",
      url: '/ads/model_selector',
      dataType: 'json',
      data: { make : { id: make_id } },
      success: function(json) {
        createOption(json);
      }
    });
  }

  function createOption(json) {

    var model_select = $("#ad_car_model");

    model_select.empty();
    _(json.models).each(function(model, pos) {
      console.log(model);
        model_select.append($("<option>").attr('value',model.id).text(model.name));
    });
  }

});

