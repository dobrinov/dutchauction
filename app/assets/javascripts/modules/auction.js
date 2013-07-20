module('auction', function(auction){

  console.log($(auction).data('url'));
  var t = setInterval(function(){
    $.ajax({
      url:      $(auction).data('url'),
      type:     'GET',
      dataType: 'script'
    });
  }, 1000);

  // clearInterval(t);

});