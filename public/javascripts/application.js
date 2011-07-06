/* DO NOT MODIFY. This file was compiled Wed, 06 Jul 2011 14:38:55 GMT from
 * /home/ysawa/ruby/yamadb/app/coffeescripts/application.coffee
 */

var yamadb;
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
    locate_peak: function(name, latitude, longitude) {
      var position;
      position = new google.maps.LatLng(latitude, longitude);
      return new google.maps.Marker({
        position: position,
        map: this.base,
        title: name
      });
    }
  }
};
$(function() {
  if ($("#google_map").size()) {
    yamadb.google_map.initialize();
    $("#google_map").height($(document).height() - 110);
  }
  return $(".truncate").truncate();
});