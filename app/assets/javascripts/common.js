$(function() {
  // Hide flash messages
  $('.alert').delay(1000).slideUp(750);

  // Common dropdown for select2
  $('.select2').select2({
    theme: 'bootstrap',
    minimumResultsForSearch: Infinity,
    width: '100%'
  });

  // Navigation dropdown toggle
  $('.my-profile').on('click', function() {
    $('.profile-dropdown').toggleClass('hidden');
  });

  // TODO window on click after drop down opens

  // Home info modal
  $('i.fa-info-circle').on('click', function(e) {
    e.preventDefault();
    bootbox.dialog({
      title: 'Contact Us',
      message: "Contact us by: " +
      "Email: info@baehl-innovation.com " +
      "Telephone: +33 (0)144.10.41.43 " +
      "Twitter " +
      "LinkedIn ",
      buttons: {
        success: {
          label: 'Ok',
          className: 'btn btn-info',
          callback: function() {}
        }
      }
    });
  });
});