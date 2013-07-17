function module(name, block){
  $(function() { $('.' + name).each(function(){ block(this); }); });
}