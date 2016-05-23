(function() {

});

function errorDialog(data) {
  bootbox.dialog({
    title: 'Error submitting ' + data,
    message: 'Sorry, there was an error submitting your ' + data + '. Please try again later.',
    buttons: {
      success: {
        label: 'Ok',
        className: 'btn btn-info',
        callback: function() {}
      }
    }
  });
}