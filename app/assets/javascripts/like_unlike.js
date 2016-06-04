$(function () {
  if ($('body.campaigns, body.favorites').length) {
    var sendingData = false;

    // ------------------------------------------------------------------------------
    // Campaign Like
    $('body').on('click', '.add-to-favorites', function(e) {
      e.preventDefault();
      var btnLike = $(this);
      var btnUnlike = btnLike.closest('.like-unlike-container').find('.remove-from-favorites');
      like(btnLike, btnUnlike);
    });

    // ------------------------------------------------------------------------------
    // Campaign Unlike
    $('body').on('click', '.remove-from-favorites', function(e) {
      e.preventDefault();
      var btnUnlike = $(this);
      var btnLike = btnUnlike.closest('.like-unlike-container').find('.add-to-favorites');
      unlike(btnLike, btnUnlike) ;
    });

    // ------------------------------------------------------------------------------
    // Generic Functions
    function like(btnLike, btnUnlike) {
      var url = btnLike.data('url');
      var campaignId = btnLike.data('campaign-id');

      if (!sendingData && url.length) {
        sendingData = true;

        $.ajax({
          url: url,
          type: 'POST',
          data: { campaign_id: campaignId },
          dataType: 'JSON'
        })
        .done(function(data) {
          if (data.success) {
            btnLike.fadeOut('fast', function(){
              btnUnlike.fadeIn('fast', null);
            });
            toastrNotification('success', 'Added to favorites');
          } else {
            toastrNotification('error', 'There was an error processing your request');
          }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
          ajaxToastrError(jqXHR);
        })
        .always(function() {
          btnLike.attr('disabled', false);
          sendingData = false;
        });
      }
    }

    function unlike(btnLike, btnUnlike) {
      var url = btnUnlike.data('url');
      var campaignId = btnUnlike.data('campaign-id');

      if (!sendingData && url.length) {
        sendingData = true;

        $.ajax({
          url: url,
          type: 'DELETE',
          data: { campaign_id: campaignId },
          dataType: 'JSON'
        })
        .done(function(data) {
          if (data.success) {
            btnUnlike.fadeOut('fast', function(){
              btnLike.fadeIn('fast', null);
            });
            toastrNotification('success', 'Removed from favorites');
          } else {
            toastrNotification('error', 'There was an error processing your request');
          }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
          ajaxToastrError(jqXHR);
        })
        .always(function() {
          btnUnlike.attr('disabled', false);
          sendingData = false;
        });
      }
    }
  }
});