$(function () {
  if ($('body.home.index').length) {
    $('body.home.index').on('shown.bs.modal', '#learn-more-modal', function () {
      $('video.learn-more-video').trigger('play');
    });

    $('body.home.index').on('hidden.bs.modal', '#learn-more-modal', function () {
      $('video.learn-more-video').trigger('pause');
    });
  }
});
