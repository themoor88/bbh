$(function () {
  if ($('body.home.index').length) {
    $('body').on('click', '.member-network', function(e) {
      e.preventDefault();
      bootbox.dialog({
        title: 'Check Out These Companies',
        message: '<img class="img-responsive" src="/assets/member_network_modal.png" alt="Member Network">'
      });
    });

    $('body').on('click', '.learn-more', function(e) {
      e.preventDefault();
      bootbox.dialog({
        title: 'Let Us Explain',
        message: '<video autobuffer="autobuffer" autoplay="autoplay" width="100%" height="100%" src="/assets/learn_more_video.mp4"></video>'
      });
    });
  }
});
