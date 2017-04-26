$(function() {
  function buildHTML(message){
    var html = $('<li class="content-right__chatsholder--chatspace--onechat">').append(
           `<div class="username">
              ${message.name}
            </div>
            <div class="chatdate">
              ${message.created_at}
            </div>
            <div class="chattext">
              ${message.text}
            </div>`
          );
    return html;
  };

  $('#new_message').on("submit", function(e) {
    e.preventDefault();
    var text = $('.content-right__bottom-bar--textplace').val();

    $.ajax({
      url: './messages',
      type: 'POST',
      data: {
        message: {
          text: text
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      $('.content-right__chatsholder--chatspace').append(buildHTML(data));
      })
    .fail (function(data){
      alert('メッセージを入力してください。');
    });
    this.reset();
    return false;
  });
});
