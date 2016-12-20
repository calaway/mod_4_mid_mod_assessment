$(document).ready(function(){
  $(".mark-read").on('click', markRead);
});

function markRead(event) {
  event.preventDefault();

  var id = $(this).closest(".link").data("id");
  var params1 = {read: true};

  $.ajax({
    url: `/api/v1/links/${id}`,
    method: "PUT",
    data: params1
  });

  var params2 = {read: {url: $(this).parent().siblings(".link-url").text()}};

  // $.ajax({
  //   // url: 'https://calawayhotreads.herokuapp.com/reads',
  //   url: 'http://0.0.0.0:3001//reads',
  //   method: "POST",
  //   data: params2
  // });
}
