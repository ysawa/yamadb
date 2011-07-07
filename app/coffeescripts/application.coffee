yamadb =
  google_map:
    base: null
    initialize: ->
      position = new google.maps.LatLng(37.3420133, 137.6477358)
      options =
        zoom: 5
        center: position
        mapTypeId: google.maps.MapTypeId.TERRAIN
      this.base = new google.maps.Map(document.getElementById("google_map"), options)
    locate_peak: (name, latitude, longitude) ->
      position = new google.maps.LatLng(latitude, longitude)
      new google.maps.Marker(
        position: position
        map: this.base
        title: name
      )

$(->
  if $("#google_map").size()
    yamadb.google_map.initialize()
    $("#google_map").height($(window).height() - 110)
  $(".truncate").truncate()
)

