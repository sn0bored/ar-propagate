$(document).ready(function () {


  $('form.new-event').on('submit', function(event){
    event.preventDefault();

    var form = $(this);

    var request = $.ajax({
      type:     "POST",
      url:      form.attr('action'),
      data:     form.serialize(),
      dataType: 'json'
    });

    // success
    request.done(function(data, status, xhr){
       $('.errors').empty();
       $('.event_created').text("Event Created!");
      form[0].reset();
    });

    // failed

    request.fail(function(xhr, status, error) {
      $('.errors').empty();
      var errors = JSON.parse(xhr.responseText);
  
      Object.keys(errors).forEach(function(field){
        $('#' + field + '_errors').text(errors[field]);
      })
    });
  });

});
