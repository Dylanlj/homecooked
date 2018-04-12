// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  for (let form of $('form')){
    $("."+form.className).on("ajax:success", function(event, xhr){
      if(event.detail[0].status === "failed" && event.detail[0].id === form.className){
        $(".messages-"+form.className).empty();
        console.log(event.detail[0])
        // for (let errorMessage of event.detail[0]["message"]){
        //   $(".messages-"+form.className).append("<p>" + errorMessage + "</p>");
        // }

      }
      else if(event.detail[0].status === "ok" && event.detail[0].id === form.className){
        $(".messages-"+form.className).empty();
        $(".messages-"+form.className).css("text-align", "right").append("<div>" + event.detail[0].message + "</div>");
      }
    })
  }
})
