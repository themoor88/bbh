$(function () {
  if ($('body.rails_admin').length) {
    $('#campaign_state').on('change', function(e){
      if (e.target.value === "active") {
        alert('Hey Lady, careful! You are about to set this campaign to fully active! Doing so will send emails to multiple users. Please make sure you really want this campaign to be active.')
      }
    });
  }
});
