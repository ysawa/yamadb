yamadb =
  form:
    disable_submission_by_enter: ->
     text_fields = $('input:text')
     if $.browser.mozilla
       $(text_fields).keypress(this.false_if_entering)
     else
       $(text_fields).keydown(this.false_if_entering)
    false_if_entering: (event) ->
      if event.keyCode == 13
        event.preventDefault
        return false
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
  notice:
    past: localStorage['notice'] ? ''
    show_if_necessary: ->
      html = $('#notice').html()
      if html and (html != this.past)
        this.now = localStorage['notice'] = html
      if this.now
        $('#notice').show().fadeOut(5000)
    now: ''
$(->
  if $("#google_map").size() and typeof(google) != 'undefined'
    yamadb.google_map.initialize()
  $(".truncate").truncate()
  yamadb.notice.show_if_necessary()
)

