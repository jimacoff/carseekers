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
//= require underscore
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {

  var make_id = "";
  var target_id = "";

  // Homepage
  $('#search_make_id').on('change', function(e) {
    make_id = $("#search_make_id option:selected").first().attr('value');
    target_id = $("#search_model_id");
    loadModels(make_id, target_id);
  });

  // Inside Ad
  $('#ad_car_attributes_make_id').on('change', function(e) {
    make_id = $("#ad_car_attributes_make_id option:selected").first().attr('value');
    target_id = $("#ad_car_attributes_model_id");
    loadModels(make_id, target_id);
  });

  // Ajax to load models
  function loadModels(make_id, target_id) {
    $.ajax({
      type: "POST",
      url: '/ads/model_selector',
      dataType: 'json',
      data: { make : { id: make_id } },
      success: function(json) {
        createModels(json, target_id);
      }
    });
  }

  // Create Models depending on target
  function createModels(json, target_id) {
    target_id.empty();
    _(json.models).each(function(model, pos) {
      console.log(model);
        target_id.append($("<option>").attr('value',model.id).text(model.name));
    });
  }

  //Ajax delete feature
  $('.delete-message').on('click', function(e) {
    e.preventDefault();
    var message_id = $(this).attr("data");
    deleteMessage(message_id);
  });

  function deleteMessage(message_id) {
    $.ajax({
      type: "DELETE",
      url: '/messages',
      dataType: 'json',
      data: { message : { id: message_id } },
      success: function(json) {
        removeMessage(json);
      }
    });
  }

  function removeMessage(json) {
    $("#"+json.message.id).html("");
  }

});