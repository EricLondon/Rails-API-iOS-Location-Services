(function($){
  "use strict";

  window.LocationMapper = new function() {
    this.locations = [];

    this.createMap = function() {
      var directionsService = new google.maps.DirectionsService;
      var directionsDisplay = new google.maps.DirectionsRenderer;
      var map = new google.maps.Map(document.getElementById('map'));
      directionsDisplay.setMap(map);

      var waypoints = [];
      for (var i = 0; i < this.locations.length; i++) {
        waypoints.push({
          location: new google.maps.LatLng(this.locations[i].latitude, this.locations[i].longitude),
          stopover: true
        });
      }
      var origin = waypoints.shift().location;
      var destination = waypoints.pop().location;

      directionsService.route({
        origin: origin,
        destination: destination,
        waypoints: waypoints,
        optimizeWaypoints: true,
        travelMode: 'DRIVING'
      }, function(response, status) {
        if (status === 'OK') {
          directionsDisplay.setDirections(response);

          // debug output
          var route = response.routes[0];
          for (var i = 0; i < route.legs.length; i++) {
            console.log(route.legs[i]);
          }

        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });

    }
  }

})();
