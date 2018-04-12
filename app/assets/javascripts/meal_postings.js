// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//form.className grabs the class name from each form, which corresponds to the meal id ("5", or "8")

$(document).ready(function(){
  for (let form of $('form')){
    $("."+form.className).on("ajax:success", function(event, xhr){
      if(event.detail[0].status === "failed" && event.detail[0].id === form.className){
        $(".messages-"+form.className).empty();
        let errorMessages = event.detail[0].message;
        for (let errorkey in errorMessages){
          $(".messages-"+form.className).append("<p> Error: " + errorkey + " " + errorMessages[errorkey] + "</p>");
        }
      }
      else if(event.detail[0].status === "ok" && event.detail[0].id === form.className){
        $(".messages-"+form.className).empty();
        $(".messages-"+form.className).css("text-align", "right").append("<div>" + event.detail[0].message + "</div>");
      }
    })
    $(".close-"+form.className).on('click', function(event){
      $(".messages-"+form.className).empty();
    })
  }
})
