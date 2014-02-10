$ ->
  markers = []

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.SATELLITE
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)

  for strike in gon.strike_locs
    markers.push new google.maps.Marker
      position: new google.maps.LatLng(strike["lat"], strike["lon"])
      map: map
      draggable: false

  setBounds = ->
    map_bounds = new google.maps.LatLngBounds(null)
    for marker in markers
      map_bounds.extend marker.getPosition()
    map.fitBounds map_bounds
    map.panToBounds map_bounds
    map.setZoom map.getZoom() - 1

  setBounds()
