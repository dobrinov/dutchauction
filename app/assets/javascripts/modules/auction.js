module('auction', function(auction){

  // Subscribe to broadcasts
  var faye = new Faye.Client('http://localhost:9292/faye');

  faye.subscribe("/auction/" + $(auction).data('id'), function(data) {
    $.ajax({
      url:      $(auction).data('url'),
      type:     'GET',
      dataType: 'script'
    });
  });

});