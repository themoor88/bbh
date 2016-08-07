$(function () {
  if ($('body.favorites').length) {
    // Add countdown for every campaign
    $('[data-countdown]').each(function() {
      var $this = $(this), finalDate = $(this).data('countdown');
      $this.countdown(finalDate, function(event) {
        $this.html(event.strftime('%Ddays %Hhrs %Mmins %Sseconds'));
      });
    });

    $('.campaign-panel .panel-body').on('click', function(e) {
      if (!$(e.target).is('i')) {
        window.location.href = '/campaigns/' + $(this).data('campaign-id');
      }
    });
  }
});
