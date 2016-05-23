$(function() {
  if($('body.campaigns.show').length) {
    var sendingData = false;

    $('body').on('click', '.apply-now', function(e) {
      e.preventDefault();
      addProposedSolution($(this).data('campaign-id'));
    });

    function addProposedSolution(campaignId) {
      if (!sendingData) {
        $.ajax({
          url: '/dashboard/proposed_solutions/new',
          type: 'GET',
          dataType: 'HTML',
          data: { campaign_id: campaignId }
        })
        .done(function(data) {
          addProposedSolutionBootbox(data);
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
          errorDialog('proposed solution');
        })
        .always(function() {
          sendingData = false;
        });
      }
    }

    function addProposedSolutionBootbox(form) {
      bootbox.dialog({
        title: 'Interested?',
        message: form,
        className: 'proposed-solution-modal'
      });
    }
  }
});