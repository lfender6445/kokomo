(function() {
   var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
   po.src = 'https://apis.google.com/js/platform.js?onload=renderButtons';
   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();

window.renderButtons = function(){
  gapi.hangout.render('hangout-div', {
    'render': 'createhangout',
  });
  $('#hangout-div iframe')[0].contentWindow.document.body.onclick = function(){
    alert('i was clicked');
    $('#room_1').find('.avatar').css({padding: '10px', background: 'red'});
  };

  $('#hangout-div').click(function(){
      console.log('clicked');
      $('#room_1').find('.avatar').css({padding: '10px', background: 'red'});
  });
};

