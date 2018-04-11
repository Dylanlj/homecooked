

let geocoder;
let map;
let yourMarker
let postingMarkers = []
let labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let labelIndex = 0


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

  }
  const setMapAndYourMarker = new Promise((resolve, reject) => {
    codeAddress(document.getElementById('googleMap').dataset.userLocation, setUpMap)
    resolve(mealPostingMarkers)
  })
  setMapAndYourMarker.then((callback) => {
    callback()
  })


}


function orderMarkerByProximity(geoObject) {

  labelIndex = 0

    postingMarkers.sort(function(a, b){
      console.log(`inside the sort function${yourMarker}`)
      let aLat = a.position.lat()
      let aLng = a.position.lng()
      let bLat = b.position.lat()
      let bLng = b.position.lng()
      let mLat = geoObject[0].geometry.location.lat()
      let mLng = geoObject[0].geometry.location.lng()

      let aDistance = Math.sqrt(Math.pow((aLat - mLat), 2) + Math.pow((aLng - mLng), 2))
      let bDistance = Math.sqrt(Math.pow((bLat - mLat), 2) + Math.pow((bLng - mLng), 2))
      return (aDistance - bDistance)
    })
  for (let marker of postingMarkers) {

    marker.label = labels[labelIndex++ % labels.length]
    marker.setMap(map)
  }
}

function mealPostingMarkers() {

  function mealMarkerCallback (geoObject) {

    let marker = new google.maps.Marker({
      map: map,
      position: geoObject[0].geometry.location,
      label: labels[labelIndex++ % labels.length],
      address: geoObject[0].formatted_address
    })
    postingMarkers.push(marker)
    codeAddress(document.getElementById('googleMap').dataset.userLocation, orderMarkerByProximity)
  }
  for (let marker of postingMarkers){
    marker.setMap(null)
  }
  postingMarkers.length = 0

  let userAddresses = []
  for (let element of document.getElementsByClassName("meal-div")) {
    let address = element.dataset.address
    if (!userAddresses.includes(address)){
      userAddresses.push(address)
      if (userAddresses.length === 10) {
        setTimeout(function() {codeAddress(address, mealMarkerCallback)}, 1300);
      } else {
        codeAddress(address, mealMarkerCallback)

      }
    }
  }

}


