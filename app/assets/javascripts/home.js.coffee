$ ->
  markers = []

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
  infoWindow = new google.maps.InfoWindow

  for strike in gon.strikes
    marker = new google.maps.Marker
      position: new google.maps.LatLng(strike["lat"], strike["lon"])
      draggable: false
    markers.push marker
    marker.info = "#{strike["number"]}"
    listenMarker = (marker, strike) ->
      google.maps.event.addListener marker, 'click', ->
        openInfoWindow marker, strike
    listenMarker marker, strike
  
  openInfoWindow = (marker, strike) ->
    infoWindow.close()
    info = { strike: strike }
    console.log strike
    infoWindow.setContent JST['templates/drone'](info)
    infoWindow.open(map, marker)

  setBounds = ->
    map_bounds = new google.maps.LatLngBounds(null)
    for marker in markers
      map_bounds.extend marker.getPosition()
    map.fitBounds map_bounds
    map.panToBounds map_bounds
    # map.setZoom map.getZoom() - 1

  mcOptions =
    maxZoom: 15
  mc = new MarkerClusterer(map, markers, mcOptions)
  setBounds()
