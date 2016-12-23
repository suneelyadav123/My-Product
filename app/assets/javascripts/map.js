var map = ""
var marker;
var markersArray=[]
var geocoder = new google.maps.Geocoder();
var infowindow = new google.maps.InfoWindow();

function setMap() {

        var mapCanvas = document.getElementById("map");
        var mapOptions = {
              center: new google.maps.LatLng(0,0),
              zoom: 2
            };
         map = new google.maps.Map(mapCanvas, mapOptions);
           
}  

        
         
function myMap(lat , lng){
  if (lat == "0.0" && lng =="0.0") {
    return null
  }
    marker = new google.maps.Marker({
                      position: {lat: lat, lng: lng},
                      map: map,
                      zoom: 10,
                      title: "Some Text", 
                      draggable: true
                      });
    google.maps.event.addListener(marker, 'dragend', function(event)
     { 
       console.log(event);
      var lat = event.latLng.lat();
      var lng = event.latLng.lng();
      placeMarker(lat, lng);
      alert(lat);
       } 
    );
var southWest = new google.maps.LatLng(lat,lng);
var bounds = new google.maps.LatLngBounds(southWest);
map.fitBounds(bounds);

      
} 

function displayMultipleMarkers(markers){
  var i;
   var markers = markers;

    for (i = 0; i < markers.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(markers[i][0], markers[i][1]),
      map: map
    });
}
}
  

function clearOverlays() {
for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].setMap(null);
    }
    markersArray = [];
  } 
