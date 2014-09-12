miam('system/CroqueTrigger', ['jquery', 'system/Utils'], (function(_this) {
  return function() {

    /*
    		  * @class CroqueTrigger
    		  * @brief Sets triggers to specified HTML elements. See official doc for more details
    		  * @description
    		  * Specify events on your HTML elements and bind js callbacks to them.
    		  * The trigger will automatically generate JS listeners.
     */
    var CroqueTrigger;
    return CroqueTrigger = (function() {
      function CroqueTrigger() {}


      /*
      			  * From specified event and HTML element, returns
      			  * callback to apply
      			  * @param trigger Event
      			  * @param element JS object
       */

      CroqueTrigger._getMethod = function(trigger, element) {
        if (trigger.length < 2) {
          throw new Error('Specified event is not supported');
        }
        return $(element).attr('data-on' + Utils.capitalize(trigger));
      };

      CroqueTrigger._bindTriggers = function(events) {
        var e, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = events.length; _i < _len; _i++) {
          e = events[_i];
          _results.push($('*[data-on' + Utils.capitalize(e)).each((function(_this) {
            return function(index, element) {
              var method;
              method = CroqueTrigger._getMethod(e, element);
              if (method == null) {
                return;
              }
              return $(element).on(e.toLowerCase(), function(event) {
                var error;
                try {
                  return eval('window.Croque.getMainClass().' + method + '(element, event)');
                } catch (_error) {
                  error = _error;
                  Log.w('An error has occurend when trying to apply method');
                  return console.error(error);
                }
              });
            };
          })(this)));
        }
        return _results;
      };


      /*
      			  * Sets mouse listeners
       */

      CroqueTrigger._setMouseEvents = function() {
        var events;
        events = ['click', 'dbClick', 'mouseEnter', 'mouseLeave', 'mouseMove', 'mouseOut', 'mouseOver', 'mouseUp', 'mouseDown'];
        return CroqueTrigger._bindTriggers(events);
      };


      /*
      			  * Sets keyboard listeners
       */

      CroqueTrigger._setKeyboardEvents = function() {
        var events;
        events = ['keyPress', 'keyDown', 'keyUp'];
        return CroqueTrigger._bindTriggers(events);
      };


      /*
      			  * Runs croqueTrigger
       */

      CroqueTrigger.run = function() {
        CroqueTrigger._setMouseEvents();
        return CroqueTrigger._setKeyboardEvents();
      };

      return CroqueTrigger;

    })();
  };
})(this));
