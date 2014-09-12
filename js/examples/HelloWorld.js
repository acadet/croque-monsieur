miam('examples/HelloWorld', ['jquery'], (function(_this) {
  return function() {
    var HelloWorld;
    return HelloWorld = (function() {
      function HelloWorld() {
        $('body').append('<h2>If you can read this message, then everything is working :)</h2>');
      }

      return HelloWorld;

    })();
  };
})(this));
