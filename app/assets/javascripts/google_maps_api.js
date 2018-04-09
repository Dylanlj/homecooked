

let geocoder;
      let map;
      let yourMarker
      let postingMarkers = []
      function initialize(address) {
        geocoder = new google.maps.Geocoder();
        let latlng = new google.maps.LatLng(43.646517, -79.395197);
        let mapOptions = {
          zoom: 15,
          center: latlng
        }
        // this should be uncommented but we're trying not to go over the geocoder request limit
        // mealPostingMarkers()
        map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);

      }

// may need to do something about regenerating this when they switch categories and such
      function mealPostingMarkers() {
        postingMarkers.length = 0
        for (let element of document.getElementsByClassName("meal-div")) {
          let address = element.dataset.address

          codeAddress(address, function (geoObject) {
            var marker = new google.maps.Marker({
              map: map,
              position: geoObject[0].geometry.location
            });
            postingMarkers.push(marker)
          })
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
