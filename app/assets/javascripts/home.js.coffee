$ ->
  markers = []

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
  infoWindow = new google.maps.InfoWindow
  oms = new OverlappingMarkerSpiderfier map

  oms.addListener "click", (marker, event) ->
    openInfoWindow marker

  oms.addListener "spiderfy", (markers) ->
    infoWindow.close()

  for strike in gon.strikes
    marker = new google.maps.Marker
      position: new google.maps.LatLng(strike["lat"], strike["lon"])
      draggable: false
    marker.info = strike
    markers.push marker
    oms.addMarker marker
    # listenMarker = (marker) ->
    #   google.maps.event.addListener marker, 'click', ->
    #     openInfoWindow marker
    # listenMarker marker
  
  openInfoWindow = (marker) ->
    infoWindow.close()
    info = { strike: marker.info }
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
