/* DO NOT MODIFY. This file was compiled Wed, 24 Aug 2011 08:53:29 GMT from
 * /home/ysawa/ruby/yamadb/app/coffeescripts/application.coffee
 */

var yamadb, _ref;
var __slice = Array.prototype.slice;
yamadb = {
  form: {
    disable_submission_by_enter: function() {
      var text_fields;
      text_fields = $('input:text');
      if ($.browser.mozilla) {
        return $(text_fields).keypress(this.false_if_entering);
      } else {
        return $(text_fields).keydown(this.false_if_entering);
      }
    },
    false_if_entering: function(event) {
      if (event.keyCode === 13) {
        event.preventDefault;
        return false;
      }
    }
  },
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
  },
  notice: {
    past: (_ref = localStorage['notice']) != null ? _ref : '',
    show_if_necessary: function() {
      var html;
      html = $('#notice').html();
      if (html && (html !== this.past)) {
        this.now = localStorage['notice'] = html;
      }
      if (this.now) {
        return $('#notice').show().fadeOut(5000);
      }
    },
    now: ''
  }
};
$(function() {
  if ($("#google_map").size() && typeof google !== 'undefined') {
    yamadb.google_map.initialize();
  }
  $(".truncate").truncate();
  yamadb.notice.show_if_necessary();
  $('input.datetime').datetimepicker();
  return $('#peaks').autocomplete({
    source: function(request, response) {
      return $.getJSON('/peaks.json', {
        name: request.term
      }, response);
    },
    minLength: 1,
    select: function(event, ui) {
      $('div#record_peaks').append("<div class=\"record_peak\">" + ui.item.name + "<a href=\"#\" class=\"ui-dialog-titlebar-close ui-corner-all\" role=\"button\"><span class=\"ui-icon ui-icon-closethick\">close</span></a><input id=\"record_peak_ids_\" name=\"record[peak_ids][]\" type=\"hidden\" value=\"" + ui.item._id + "\"></div>");
      return $('div.record_peak').button();
    }
  }).data('autocomplete')._renderItem = function(ul, item) {
    return $('<li></li>').data('item.autocomplete', item).append("<a>" + item.name + "</a>").appendTo(ul);
  };
});