(function($) {
  $(function() {
  var lexington = new google.maps.LatLng(38.06, -84.497631);

  var options = { zoom: 12,
                  center: lexington,
                  mapTypeId: google.maps.MapTypeId.ROADMAP,
                  scrollwheel: false
                }

  var map = new google.maps.Map(document.getElementById("map-wrap"), options);
  var info_window = new google.maps.InfoWindow;

  $.getJSON("/horses.json", function(horses) {
    $.each(horses, function(index, horse) {
      var geolocation = new google.maps.LatLng(horse.latitude, horse.longitude);
      var map_marker = new google.maps.Marker({ position: geolocation,
                                                icon: "/images/horseicon.png"})

      google.maps.event.addListener(map_marker, "click", function(event) {
        info_window.content =
          "<div class=\"map-info\">" +
          "<h2>" + horse.title + "<a href=\"" + horse.url + "\" " + "class=\"photos-count\">" + " (" + horse.photos_count + " Photos)" + "</a>" + "</h2>" +
          "<img src=\"" + horse.photo + "\" alt=\"" + horse.title + "\" />" +
          "<p><a href=\"" + horse.url + "\">More information on " + horse.title + "</a></p>" +
          "</div>";

        info_window.open(map, map_marker);
      });

      google.maps.event.addListener(map, "click", function(event) {
        info_window.close();
      });

      map_marker.setMap(map);
    });
  });
});
})(jQuery)
