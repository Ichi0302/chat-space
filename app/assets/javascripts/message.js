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
    console.log(html);
    return html;
  };

  $('.content-right__bottom-bar--sendbuttom').click(function(e) {
    e.preventDefault();
    var text = $('.content-right__bottom-bar--textplace').val();
    if(text != ""){
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
        var html = buildHTML(data);
        $('.content-right__chatsholder--chatspace').prepend(html);
        $('.content-right__bottom-bar--textplace').val('');
      });
    } else {
      alert('メッセージを入力してください。');
    };
    return false;
  });
});
