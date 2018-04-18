

let geocoder;
let map;
let yourMarker
let postingMarkers = []
let labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let labelIndex = 0
let userAddresses = []
let infoWindow





////////////////
//GEOCODE CALL//
////////////////

function codeAddress(address, callback) {

  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      callback(results)
    } else {
      callback(results)
      console.log('Geocode was not successful for the following reason: ' + status);
    }
  });
}


//////////////////////////
//USER REGISTRATION CALL//
//////////////////////////


function giveProperAddress (geoObject) {

  if (geoObject[0]){

    $("#user_address").val(geoObject[0].formatted_address)
    $("#latitude").val(geoObject[0].geometry.location.lat())
    let lng = $("#longitude").val(geoObject[0].geometry.location.lng())
      lng.promise().done(function() {
        $("#register-form").trigger("submit")
      })
  } else {
    $("#user_address").val("not_found")
    let lng = $("#longitude").val("not_found")
      lng.promise().done(function() {
        $("#register-form").trigger("submit")
      })
  }
}


function watchRegister () {

  $("#register-form").submit("submit", function(event){

   if ($("#longitude").val() === "") {
      event.preventDefault()
      let enteredAddress
      enteredAddress = $("#user_address").val()
      geocoder = new google.maps.Geocoder()
      codeAddress(enteredAddress, giveProperAddress)
   }

  });
}


///////////////////////
//SEARCH FOR LOCATION//
///////////////////////
function locationSearch() {

//when someone uses the search bar
  $("#google-search form").on("submit", function(event){
    if($('#latitude_change').val() === "false"){
      event.preventDefault()
      codeAddress(($(this).find("#location-form").val()), changeYourMarkerLocation)
    }
  })

//moving map center
  $(".marker-circle").on("click", function(){
    let findThis = $(this).siblings(".address").text()
    for(let marker of postingMarkers) {
      if (marker.formattedAddress === findThis) {
        console.log("marker")
        map.setCenter(marker.getPosition())
      }
    }
  })
}


function changeYourMarkerLocation (geoObject){
  let latitude
  let longitude

  if(geoObject[0]){
    latitude = geoObject[0].geometry.location.lat()
    longitude = geoObject[0].geometry.location.lng()
  } else {
    latitude = parseFloat($('#googleMap').data().userLatitude)
    longitude = parseFloat($('#googleMap').data().userLongitude)
  }
  $("#google-search form").find('#latitude_change').val(latitude)
  let lng = $("#google-search form").find('#longitude_change').val(longitude)
    lng.promise().done(function() {
      $("#google-search form").trigger("submit")
    })

}




// function reOrderMeals () {

//   for (let marker of postingMarkers){
//     $(".postings-list").append($(`.meal-div:contains(${marker.formattedAddress})`))
//   }
// }


function orderMarkerByProximity(myLocationMarker) {

  labelIndex = 0

  postingMarkers.sort(function(a, b){
    let aLat = a.position.lat()
    let aLng = a.position.lng()
    let bLat = b.position.lat()
    let bLng = b.position.lng()
    let mLat = myLocationMarker.position.lat()
    let mLng = myLocationMarker.position.lng()

    let aDistance = Math.sqrt(Math.pow((aLat - mLat), 2) + Math.pow((aLng - mLng), 2))
    let bDistance = Math.sqrt(Math.pow((bLat - mLat), 2) + Math.pow((bLng - mLng), 2))
    return (aDistance - bDistance)
  })
  for (let marker of postingMarkers) {
    marker.label = labels[labelIndex++ % labels.length]
    marker.setMap(map)
    addLabelsToDOM(marker, postingMarkers)
  }
}

function addLabelsToDOM (marker, allMarkers) {
  $( document ).ready(function() {
    let check = $('.meal-div[data-address="' + marker.formattedAddress + '"]').find(".marker-circle").text(marker.label)
  });

}


///////////////////
//INDEX HOME PAGE//
///////////////////

function initialize() {

  infoWindow = new google.maps.InfoWindow()

  labelIndex = 0

  geocoder = new google.maps.Geocoder();


  let latitude = 43.644866
  let longitude = -79.395176

  if (parseFloat($('#googleMap').data().userLatitude)) {
    latitude = parseFloat($('#googleMap').data().userLatitude)
    longitude = parseFloat($('#googleMap').data().userLongitude)
  }


  let latlng = {lat: latitude, lng: longitude }


  let mapOptions = {
    zoom: 15,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
  yourMarker = new google.maps.Marker({
    map: map,
    position: latlng
  });
  mealPostingMarkers()


  // codeAddress(document.getElementById('googleMap').dataset.userLocation, setUpMap)
}


function mealMarkerCallback (addressData) {
  let latitude = parseFloat(addressData.latitude)
  let longitude = parseFloat(addressData.longitude)

  let marker = new google.maps.Marker({
    map: map,
    position: {lat: latitude , lng: longitude},
    label: labels[labelIndex++ % labels.length],
    formattedAddress: addressData.address
  })

  let mealName = []
  $(`.media-container:contains(${marker.formattedAddress})`).find('.title').each(function(){
    mealName.push(`<br>${$(this).text()}`)
  })
//adds info window for map markers
  google.maps.event.addListener(marker,  'mouseover', function(){
    infoWindow.setContent(`<span>${marker.formattedAddress}</span>${mealName}`)
    infoWindow.open(map, marker)
  })
  google.maps.event.addListener(marker,  'click', function(){
    $(".postings-list").prepend($(`.meal-div:contains(${marker.formattedAddress})`))
  })

  postingMarkers.push(marker)
  orderMarkerByProximity(yourMarker)
}


function mealPostingMarkers(search) {

  for (let marker of postingMarkers){
    marker.setMap(null)
  }
  postingMarkers.length = 0
  userAddresses.length = 0
  for (let element of document.getElementsByClassName("meal-div")) {

    let addressData = element.dataset
    if (!userAddresses.includes(addressData.address)){
      userAddresses.push(addressData.address)
      mealMarkerCallback(addressData)

    }
  }


}




