$(function() {
  function buildHTML(message){
    var messageImage = message.image ? `<img src="${message.image}" alt="hoge">` : ``;
    var html = $('<li class="content-right__chatsholder--chatspace--onechat">').append(
             `<div class="username">
                ${message.name}
              </div>
              <div class="chatdate">
                ${message.created_at}
              </div>
              <div class="chattext">
                ${message.text}
              </div>
               ${messageImage}
              `
            );
    return html;
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var text = $('.content-right__bottom-bar--textplace').val();
    var image = $('.content-right__bottom-bar--photoplace').val();

    if(text || image){
      var formData = new FormData($(this)[0]);
      $.ajax({
        url: './messages',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json'
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.content-right__chatsholder--chatspace').prepend(html);
        // $('.content-right__bottom-bar--textplace').val('');
      });
    } else {
      alert('メッセージを入力してください。');
    };
    var $form = this;
    $form.reset();
    return false;
  });
});
