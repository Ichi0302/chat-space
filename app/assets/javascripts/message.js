$(function() {
  function buildHTML(message){
    var html = $('<li class="content-right__chatsholder--chatspace--onechat">');
    return html;
  };

  $('#new_message').on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData($(this)[0]);
    console.log(formData);
    if(formData != ""){
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
        $('.content-right__chatsholder--chatspace').prepend(html.append(
             `<div class="username">
                ${data.name}
              </div>
              <div class="chatdate">
                ${data.created_at}
              </div>
              <div class="chattext">
                ${data.text}
              </div>`
            ));
        $('.content-right__bottom-bar--textplace').val('');
      });
    } else {
      alert('メッセージを入力してください。');
    };
    return false;
  });
});
