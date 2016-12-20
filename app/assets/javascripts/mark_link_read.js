$(document).ready(function(){
  $(".mark-read").on('click', markRead);
});

function markRead(event) {
  event.preventDefault();

  var id = $(this).closest(".link").data("id");
  var params = {link: {read: true}};

  $.ajax({
    url: `/api/v1/links/${id}`,
    method: "PUT",
    data: params
  });
}
