/* DO NOT MODIFY. This file was compiled Thu, 14 Jul 2011 06:17:00 GMT from
 * /home/ysawa/ruby/yamadb/app/coffeescripts/application.coffee
 */

var yamadb;
var __slice = Array.prototype.slice;
yamadb = {
  google_map: {
    map: null,
    initialize: function() {
      var options, position;
      position = this.position(37.3420133, 137.6477358);
      options = {
        zoom: 5,
        center: position,
        mapTypeControl: false,
        streetViewControl: false,
        mapTypeId: google.maps.MapTypeId.TERRAIN
      };
      return this.map = new google.maps.Map(document.getElementById("google_map"), options);
    },
    locate_peak: function() {
      var args, href, latitude, longitude, marker, name, position;
      name = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      latitude = args[0];
      longitude = args[1];
      href = args[2];
      position = this.position(latitude, longitude);
      if (position) {
        marker = new google.maps.Marker({
          icon: '/images/common/bullet.png',
          map: this.map,
          position: position,
          title: name
        });
        if (href) {
          google.maps.event.addListener(marker, 'click', function() {
            return location.href = href;
          });
        }
        return this.markers.push(marker);
      }
    },
    markers: [],
    position: function(latitude, longitude) {
      latitude = parseFloat(latitude);
      longitude = parseFloat(longitude);
      if (latitude && longitude) {
        return new google.maps.LatLng(latitude, longitude);
      } else {
        return null;
      }
    }
  }
};
$(function() {
  if ($("#google_map").size() && typeof google !== 'undefined') {
    yamadb.google_map.initialize();
  }
  return $(".truncate").truncate();
});