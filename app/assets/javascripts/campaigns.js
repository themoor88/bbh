$(function () {
  if ($('body.campaigns').length) {
    // Initiate the slider
    var swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      nextButton: '.swiper-button-next',
      prevButton: '.swiper-button-prev',
      paginationClickable: true,
      spaceBetween: 100,
      centeredSlides: true,
      speed: 2000,
      autoplay: 5000,
      loop: true,
      autoplayDisableOnInteraction: true
    });

    // Add ajax request for search
    $('.country-search, .order-search, .sector-search').on('change', function() {
      var sendingData = false;
      var url = $(this).data('url');
      var query = {
        country: $('.country-search').val(),
        order: $('.order-search').val(),
        sector: $('.sector-search').val()
      };

      if (!sendingData && url.length) {
        sendingData = true;

        $.ajax({
          url: url,
          type: 'GET',
          data: query,
          dataType: 'SCRIPT',

          beforeSend: function() {
            $('.spinner-container').hide();
            $('.campaign-grid').html("<div class='spinner-container text-center'><i class='fa fa-spinner fa-pulse fa-fw fa-5x'></i></div>");
          }
        })
        .done(function(data) {

        })
        .fail(function(jqXHR, textStatus, errorThrown) {
          ajaxToastrError(jqXHR);
        })
        .always(function() {
          sendingData = false;
          // Add countdown event again
          $('[data-countdown]').each(function() {
            var $this = $(this), finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function(event) {
              $this.html(event.strftime('%Ddays %Hhrs %Mmins %Sseconds'));
            });
          });
        });
      }
    });

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