miam('tests/TestQuoJs', ['quoJS'], (function(_this) {
  return function() {
    var TestQuoJs;
    return TestQuoJs = (function() {
      function TestQuoJs() {
        $$(document).on('touch', (function(_this) {
          return function() {
            return alert('hello!');
          };
        })(this));
      }

      return TestQuoJs;

    })();
  };
})(this));
