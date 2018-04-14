

let geocoder;
let map;
let yourMarker
let postingMarkers = []
let labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let labelIndex = 0
let userAddresses = []



////////////////
//GEOCODE CALL//
////////////////

function codeAddress(address, callback) {

  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      callback(results)
    } else {
      console.log('Geocode was not successful for the following reason: ' + status);
      invalidAddress()
    }
  });
}


//////////////////////////
//USER REGISTRATION CALL//
//////////////////////////
function invalidAddress(){
  $("#geocode-address-error").text("Could not find address, please try again")

}

function giveProperAddress (geoObject) {
  alert(geoObject)
  console.log(geoObject[0])
  // console.log(geoObject[0].formattedAddress)
  if (geoObject[0]){
    $("#user_address").val(geoObject[0].formatted_address)
    $("#latitude").val(geoObject[0].geometry.location.lat())
    $("#longitude").val(geoObject[0].geometry.location.lng())
    alert($("#user_address").val())
    $(".new-user-submit").trigger("click")
  }
}

$(document).ready(function(){
    $("#register-form").submit(function(event){
      // alert(event)
      event.preventDefault()
      let enteredAddress
      enteredAddress = $("#user_address").val()
      geocoder = new google.maps.Geocoder()
      codeAddress(enteredAddress, giveProperAddress)
    });
});



///////////////////
//INDEX HOME PAGE//
///////////////////

function initialize() {
labelIndex = 0

  geocoder = new google.maps.Geocoder();

  function setUpMap (geoObject) {
    let userLocation = geoObject[0].geometry.location
    let latlng = new google.maps.LatLng(userLocation.lat(), userLocation.lng());
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
  }
  codeAddress(document.getElementById('googleMap').dataset.userLocation, setUpMap)
}


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

function mealMarkerCallback (addressData) {
  let latitude = parseFloat(addressData.latitude)
  let longitude = parseFloat(addressData.longitude)
  let marker = new google.maps.Marker({
    map: map,
    position: {lat: latitude , lng: longitude},
    label: labels[labelIndex++ % labels.length],
    formattedAddress: addressData.address
  })

  postingMarkers.push(marker)

  orderMarkerByProximity(yourMarker)
}

function mealPostingMarkers() {

  for (let marker of postingMarkers){
    marker.setMap(null)
  }
  postingMarkers.length = 0
  userAddresses.length = 0
  for (let element of document.getElementsByClassName("meal-div")) {

    let addressData = element.dataset
    if (!userAddresses.includes(addressData.address)){
      userAddresses.push(addressData.address)
// console.log(addressData.latitude)

      mealMarkerCallback(addressData)

    }
  }

}


