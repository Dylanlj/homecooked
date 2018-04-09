

let geocoder;
let map;
let yourMarker
let postingMarkers = []
let labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let labelIndex = 0

function initialize(address) {
  geocoder = new google.maps.Geocoder();
  let latlng = new google.maps.LatLng(43.646517, -79.395197);
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




function mealPostingMarkers() {
  postingMarkers.length = 0
  labelIndex = 0
  let markerCount = 0
  for (let element of document.getElementsByClassName("meal-div")) {

    let address = element.dataset.address

    codeAddress(address, (geoObject) => {
      function checkLocation(postings) {
        if (markerCount === 0) { return false }
        return (geoObject[0].formatted_address === postings.address)
      }

      if(!postingMarkers.find(checkLocation)){
        let marker = new google.maps.Marker({
          map: map,
          position: geoObject[0].geometry.location,
          label: labels[labelIndex++ % labels.length],
          address: geoObject[0].formatted_address
        })
        postingMarkers.push(marker)
      }
    })
      markerCount++
      console.log(markerCount)
      if (markerCount > 10) {
       return false
      }
  }

}

function codeAddress(address, callback) {
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      callback(results)
    } else {
      console.log('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function moveYourLocation() {
  let address = document.getElementById('address').value;
  codeAddress(address, function(geoObject){
    map.setCenter(geoObject[0].geometry.location)
  })
  codeAddress(address, function (geoObject) {
    if (yourMarker){
     yourMarker.setMap(null)
    }
    yourMarker = new google.maps.Marker({
      map: map,
      title: "Your Location!",
      position: geoObject[0].geometry.location
    });

  })

}

