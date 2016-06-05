$(function() {
  if ($('body.proposed-solutions').length) {
    $('.select2-ps').select2({
      theme: 'bootstrap',
      minimumResultsForSearch: Infinity,
      width: '5%'
    });

    $('.number-of-proposed-solutions').on('change', function() {
      var numberOfProposedSolutions = $(this).val();
      var url = $(this).data('url');
      window.location.href = url + '?number_of_proposed_solutions=' +numberOfProposedSolutions
    });
  }
});