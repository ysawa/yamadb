/* DO NOT MODIFY. This file was compiled Tue, 12 Jul 2011 14:33:14 GMT from
 * /home/ysawa/ruby/yamadb/app/coffeescripts/application.coffee
 */

var yamadb;
var __slice = Array.prototype.slice;
yamadb = {
  google_map: {
    base: null,
    initialize: function() {
      var options, position;
      position = new google.maps.LatLng(37.3420133, 137.6477358);
      options = {
        zoom: 5,
        center: position,
        mapTypeId: google.maps.MapTypeId.TERRAIN
      };
      return this.base = new google.maps.Map(document.getElementById("google_map"), options);
    },
    locate_peak: function() {
      var args, href, latitude, longitude, marker, name, position;
      name = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      latitude = args[0];
      longitude = args[1];
      href = args[2];
      position = new google.maps.LatLng(latitude, longitude);
      marker = new google.maps.Marker({
        icon: '/images/common/bullet.png',
        map: this.base,
        position: position,
        title: name
      });
      if (href) {
        return google.maps.event.addListener(marker, 'click', function() {
          return location.href = href;
        });
      }
    }
  }
};
$(function() {
  if ($("#google_map").size()) {
    yamadb.google_map.initialize();
    $("#google_map").height($(window).height() - 110);
  }
  return $(".truncate").truncate();
});