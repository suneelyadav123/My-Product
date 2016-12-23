var map = ""
var marker;
var markersArray=[]
var geocoder = new google.maps.Geocoder();
var infowindow = new google.maps.InfoWindow();

function setMap() {

        var mapCanvas = document.getElementById("map");
        var mapOptions = {
              center: new google.maps.LatLng(0,0),
              zoom: 5
            };
         map = new google.maps.Map(mapCanvas, mapOptions);
           google.maps.event.addListener(map, 'click', function(event) {
            var lat = event.latLng.lat()
            alert(lat);
            var lng = event.latLng.lng()
            console.log(event.latLng);
            console.log(event)
            alert(event);
            marker.setMap(null);
               clearOverlays();


            placeMarker(lat, lng);
  });
}  

        
         
function myMap(lat , lng){
  if (lat == "0.0" && lng =="0.0") {
    return null
  }
    marker = new google.maps.Marker({
                      position: {lat: lat, lng: lng},
                      map: map,
                      title: "Some Text", 
                      draggable: true
                      });
var southWest = new google.maps.LatLng(lat,lng);
var bounds = new google.maps.LatLngBounds(southWest);
map.fitBounds(bounds);

      
} 
  

function clearOverlays() {
for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].setMap(null);
    }
    markersArray = [];
  } 
