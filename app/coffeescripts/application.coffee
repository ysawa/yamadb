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
    locate_peak: (name, args...) ->
      latitude = args[0]
      longitude = args[1]
      href = args[2]
      position = new google.maps.LatLng(latitude, longitude)
      marker = new google.maps.Marker(
        icon: '/images/common/bullet.png'
        map: this.base
        position: position
        title: name
      )
      google.maps.event.addListener(
        marker,
        'click',
         -> location.href = href
      ) if href

$(->
  if $("#google_map").size()
    yamadb.google_map.initialize()
    $("#google_map").height($(window).height() - 110)
  $(".truncate").truncate()
)

