$ ->
  markers = []

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.SATELLITE
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
  infoWindow = new google.maps.InfoWindow

  for strike in gon.strike_locs
    marker = new google.maps.Marker
      position: new google.maps.LatLng(strike["lat"], strike["lon"])
      map: map
      draggable: false
    markers.push marker
    marker.info = "#{strike["number"]}"
    listenMarker = (marker) ->
      google.maps.event.addListener marker, 'click', ->
        openInfoWindow marker
    listenMarker marker
  
  openInfoWindow = (marker) ->
    infoWindow.close()
    infoWindow.setContent marker.info
    infoWindow.open(map, marker)


  setBounds = ->
    map_bounds = new google.maps.LatLngBounds(null)
    for marker in markers
      map_bounds.extend marker.getPosition()
    map.fitBounds map_bounds
    map.panToBounds map_bounds
    # map.setZoom map.getZoom() - 1

  setBounds()
