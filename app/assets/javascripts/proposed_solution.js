$(function() {
  if ($('body.proposed-solutions').length) {
    $('.proposed-solution-button').on('click', function(e) {
      $('p.error').hide();
      $("input[name='proposed_solutions[][link]']").each(function(index, value) {
        if ($(value).val().length == 0) {
          e.preventDefault();
          $(value).after('<p class="error">This field is required</p>');
        }
      });

      $("textarea[name='proposed_solutions[][technology_description]']").each(function(index, value) {
        if ($(value).val().length == 0) {
          e.preventDefault();
          $(value).after('<p class="error">This field is required</p>');
        }
      });

      $("textarea[name='proposed_solutions[][technology_application]']").each(function(index, value) {
        if ($(value).val().length == 0) {
          e.preventDefault();
          $(value).after('<p class="error">This field is required</p>');
        }
      });

      $("select[name='proposed_solutions[][trl]']").each(function(index, value) {
        if ($(value).val().length == 0) {
          e.preventDefault();
          $(value).parent().find('.select2-container').after('<p class="error">This field is required</p>');
        }
      });
    });

    $('.select2-ps').select2({
      theme: 'bootstrap',
      minimumResultsForSearch: Infinity,
      width: '50px'
    });

    $('.number-of-proposed-solutions').on('change', function() {
      var numberOfProposedSolutions = $(this).val();
      var url = $(this).data('url');
      window.location.href = url + '?number_of_proposed_solutions=' +numberOfProposedSolutions
    });
  }
});