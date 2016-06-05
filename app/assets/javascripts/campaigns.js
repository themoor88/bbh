$(function () {
  if ($('body.campaigns').length) {
    // Initiate the slider
    var swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      nextButton: '.swiper-button-next',
      prevButton: '.swiper-button-prev',
      paginationClickable: true,
      spaceBetween: 30,
      centeredSlides: true,
      speed: 1000,
      autoplay: 2500,
      loop: true,
      autoplayDisableOnInteraction: true
    });

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
            $('.campaign-grid').html("<div class='spinner-container text-center'><i class='fa fa-spinner fa-pulse fa-fw fa-5x'></i></div>");
          }
        })
        .done(function(data) {
          if (data.success) {
          } else {
          }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
          ajaxToastrError(jqXHR);
        })
        .always(function() {
          sendingData = false;
        });
      }
    });
  }
});