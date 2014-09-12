miam('tests/TestCroqueTrigger', ['quoJS', 'system/CroqueTrigger'], (function(_this) {
  return function() {
    var TestCroqueTrigger;
    return TestCroqueTrigger = (function() {
      function TestCroqueTrigger() {
        CroqueTrigger.run();
      }

      TestCroqueTrigger.prototype.click = function(e) {
        return Log.i("Click");
      };

      TestCroqueTrigger.prototype.mouseEnter = function(e) {
        return Log.i("Mouse enter");
      };

      TestCroqueTrigger.prototype.keyPress = function(e, event) {
        return Log.i(event.which);
      };

      return TestCroqueTrigger;

    })();
  };
})(this));
