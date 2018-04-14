

let geocoder;
let map;
let yourMarker
let postingMarkers = []
let labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let labelIndex = 0
// unformatted addresses
let userAddresses = []


function giveProperAddress (geoObject) {
  console.log(geoObject[0].formatted_address)
  // console.log(geoObject[0].formattedAddress)
  if (geoObject[0]){
    $("#user_address").val(geoObject[0].formatted_address)
    $("#latitude").val(geoObject[0].geometry.location.lat())
    $("#longitude").val(geoObject[0].geometry.location.lng())
    alert($("#user_address").val())
    $("#register-form").trigger("submit")
  } else {
    // tell them their submitted address isn't valid
  }
}

$(document).ready(function(){
    $(".new-user-submit").click(function(event){
      event.preventDefault()
      let enteredAddress
      enteredAddress = $("#user_address").val()
      geocoder = new google.maps.Geocoder()
      codeAddress(enteredAddress, giveProperAddress)
    });
});



function codeAddress(address, callback) {

  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      callback(results)
    } else {
      console.log('Geocode was not successful for the following reason: ' + status);
    }
  });
}

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
    let check = $('.meal-div[data-address="' + marker.originalAddress + '"]').find(".marker-circle").text(marker.label)
  });

}

function mealMarkerCallback (geoObject) {

  let marker = new google.maps.Marker({
    map: map,
    position: geoObject[0].geometry.location,
    originalAddress: userAddresses[labelIndex],
    label: labels[labelIndex++ % labels.length],
    formattedAddress: geoObject[0].formatted_address
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

    let address = element.dataset.address
    if (!userAddresses.includes(address)){
      userAddresses.push(address)
      if (userAddresses.length === 5) {
        setTimeout(function() {codeAddress(address, mealMarkerCallback)}, 1300);
      } else {

        codeAddress(address, mealMarkerCallback)

      }
    }
  }

}


