$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  // $('a#sign-out').on("click", function (e) {
  //   e.preventDefault();
  //   var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
  //   request.done(function () { window.location = "/"; });
  // });


  $('#create_event').on('submit', function(e){
    e.preventDefault();
    $.post('/events/create', { date: $('#date').val(), title: $('#title').val(), name: $('#name').val()})
     .done(function(response){
      console.log(response.date)
      if (response.date){
        $('#date_title').append(response.date[0]).css('color', 'red');
      }
       if(response.name){
        $('#event_title').append(response.name[0]).css('color', 'red');
      }
        if(response.title){
        $('#name_title').append(response.title[0]).css('color', 'red');
      }
    });
  });
});
