var map = ""
var marker;
var markersArray=[]



function setMap() {

        var mapCanvas = document.getElementById("map");
        var mapOptions = {
              center: new google.maps.LatLng(0,0),
              zoom: 3
            };
         map = new google.maps.Map(mapCanvas, mapOptions);
           
}  

        
         
function myMap(lat , lng ){
  
  if (lat == "0.0" && lng =="0.0" ) {
    return null
  }
    
    marker = new google.maps.Marker({
                      position: {lat: lat, lng: lng},
                      map: map,
                      zoom: 10,
                      title: '',
                      draggable: true
                      });
    
    google.maps.event.addListener(marker, 'dragend', function(event)
     { 
      var lat = event.latLng.lat();
      var lng = event.latLng.lng();
      placeMarker(lat, lng);
       } 
    );
    

var southWest = new google.maps.LatLng(lat,lng);
var bounds = new google.maps.LatLngBounds(southWest);
map.fitBounds(bounds);

      
} 

function displayMultipleMarkers(markers , order_num){
  var i,n;
  setMap(null);
   var markers = markers;
   var order_num = order_num;

    for (i = 0; i < markers.length; i++) {
      for(n = 0 ; n < order_num.length; n++) {

      
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(markers[i][0], markers[i][1]),
      map: map,
      title: order_num[i]
    });
  }
}
}
  

function clearOverlays() {
for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].setMap(null);
    }
    markersArray = [];
  } 
function showinfoWindow(message)
  {
            var infowindow = new google.maps.InfoWindow({
          content: message
        });
            marker.addListener('mouseover', function() {
                infowindow.open(map, this);
            });

    // assuming you also want to hide the infowindow when user mouses-out
    marker.addListener('mouseout', function() {
      infowindow.close();
    });


  }
  
