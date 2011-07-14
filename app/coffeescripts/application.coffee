yamadb =
  google_map:
    map: null
    initialize: ->
      position = this.position(37.3420133, 137.6477358)
      options =
        zoom: 5
        center: position
        mapTypeControl: false
        streetViewControl: false
        mapTypeId: google.maps.MapTypeId.TERRAIN
      this.map = new google.maps.Map(document.getElementById("google_map"), options)
    locate_peak: (name, args...) ->
      latitude = args[0]
      longitude = args[1]
      href = args[2]
      position = this.position(latitude, longitude)
      if position
        marker = new google.maps.Marker(
          icon: '/images/common/bullet.png'
          map: this.map
          position: position
          title: name
        )
        google.maps.event.addListener(
          marker,
          'click',
           -> location.href = href
        ) if href
        this.markers.push marker
    markers: []
    position: (latitude, longitude) ->
      latitude = parseFloat latitude
      longitude = parseFloat longitude
      if latitude and longitude
        new google.maps.LatLng latitude, longitude
      else
        null
$(->
  if $("#google_map").size() and typeof(google) != 'undefined'
    yamadb.google_map.initialize()
  $(".truncate").truncate()
)

