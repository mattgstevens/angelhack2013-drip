//= require ./map/leaflet-src
//= require ./map/leaflet.hash
//= require ./map/L.Control.Locate

var Drip = Drip || {}

Drip.stats = {
  toggle_active: function(active) {
    if($('.active_stat_icon')) {
      $('.active_stat_icon').removeClass('active_stat_icon');
      $('.active_stat_set').removeClass('active_stat_set');
    }
    $(active).addClass('active_stat_icon');
    $(active + '_stats').addClass('active_stat_set');
  }
}

Drip.map = {
  load_map: function() {
    var map = L.map('map');

    // add an OpenStreetMap tile layer
    open_street_map_tiles_layer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      maxZoom: 18
    });

    open_street_map_tiles_layer.addTo(map);

    base_maps = {
        "OpenStreetMap": open_street_map_tiles_layer
    };
    overlay_maps = {
        "All stations": all_stations_layer
    };
    L.control.layers(base_maps, overlay_maps).addTo(map);

    var url = '/stations.json?latitude=' + latitude + '&longitude=' + longitude;
      $.ajax(url, {
        success: DTB.home.getStations
      });
    }
}

$(function () {
  Drip.stats.toggle_active('#clinic');
  Drip.map.load_map();

  $('#clinic').click(function() {
    Drip.stats.toggle_active('#clinic');
  });
  $('#city').click(function() {
    Drip.stats.toggle_active('#city');
  });
  $('#country').click(function() {
    Drip.stats.toggle_active('#country');
  });
});