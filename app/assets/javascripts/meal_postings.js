# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

  $("#resForm").on("ajax:success", function(e, data, status, xhr){


  })

  submit(function(event){
    event.preventDefault();
    console.log('blah');
    $.post("/reservations/create/")
  })
  window.location.href('...');
})