$(function () {
  if ($('body.home.index').length) {
    $('body').on('click', '.member-network', function(e) {
      e.preventDefault();
      bootbox.dialog({
        title: 'Check Out These Companies',
        message: 'We have partnered with a number of companies',
        buttons: {
          success: {
            label: 'Ok',
            className: 'btn btn-info',
            callback: function() {}
          }
        }
      });
    });

    $('body').on('click', '.learn-more', function(e) {
      e.preventDefault();
      bootbox.dialog({
        title: 'Let Us Explain',
        message: 'Check out this awesome video',
        buttons: {
          success: {
            label: 'Ok',
            className: 'btn btn-info',
            callback: function() {}
          }
        }
      });
    });
  }
});
