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

$(function () {
  Drip.stats.toggle_active('#clinic');

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