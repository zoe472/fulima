$(function(){
  function buildHTML(comment){
    var html = `<li class="main__showMain__contentRight__topContent__commentBox__commentlist__box left">
                  <div class="main__showMain__contentRight__topContent__commentBox__commentlist__mybody">
                    ${comment.sentence}
                  </div>
                  <div class="main__showMain__contentRight__topContent__commentBox__commentlist__user">
                    <img class="main__showMain__contentRight__topContent__commentBox__commentlist__picture" src="/assets/member_photo_noimage_thumb-3f5db95de8bc1582908f994329d16ed91cf4398c2e3e0cc7387e0f2f8f0c88a9.png">
                    <div class="main__showMain__contentRight__topContent__commentBox__commentlist__name">
                      ${comment.user_name}
                    </div>
                  </div>
                </li>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main__showMain__contentRight__topContent__commentBox__commentlist').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});