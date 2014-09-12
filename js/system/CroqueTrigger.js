miam('system/CroqueTrigger', ['system/Utils', 'system/ExceptionHandler'], (function(_this) {
  return function() {

    /*
    		  * @class CroqueTrigger
    		  * @brief Sets trigger to specified HTML elements. See official doc for more details
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

      CroqueTrigger.getMethod = function(trigger, element) {
        var error, f;
        if (trigger.length < 2) {
          throw new Error('Specified event is not supported');
        }
        trigger = Utils.capitalize(trigger);
        try {
          f = $(element).attr('data-on' + trigger);
          return f;
        } catch (_error) {
          error = _error;
          Log.w('An error has occured when trying fixing triggers');
          ExceptionHandler.handle(error);
        }
        return null;
      };

      CroqueTrigger.bindTriggers = function(events) {
        var e, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = events.length; _i < _len; _i++) {
          e = events[_i];
          _results.push($('*[data-on' + Utils.capitalize(e)).each((function(_this) {
            return function(index, element) {
              var method;
              method = CroqueTrigger.getMethod(e, element);
              if (method == null) {
                return;
              }
              return $(element).on(e.toLowerCase(), function(event) {
                var error;
                try {
                  return eval('window.Croque.getMainClass().' + method + '(element, event)');
                } catch (_error) {
                  error = _error;
                  Log.w('An error has occurend when trying applying method');
                  return ExceptionHandler.handle(error);
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

      CroqueTrigger.setMouseEvents = function() {
        var events;
        events = ['click', 'dbClick', 'mouseEnter', 'mouseLeave', 'mouseMove', 'mouseOut', 'mouseOver', 'mouseUp', 'mouseDown'];
        return CroqueTrigger.bindTriggers(events);
      };


      /*
      			  * Sets keyboard listeners
       */

      CroqueTrigger.setKeyboardEvents = function() {
        var events;
        events = ['keyPress', 'keyDown', 'keyUp'];
        return CroqueTrigger.bindTriggers(events);
      };


      /*
      			  * Sets touch listeners
       */

      CroqueTrigger.setTouchEvents = function() {
        var e, events, f, quoJS, _i, _len, _results;
        events = ['singleTap', 'doubleTap', 'hold', 'swipeUp', 'swipeDown', 'swipeLeft', 'swipeRight'];
        quoJS = false;
        f = (function(_this) {
          return function(e, element) {
            var method;
            method = CroqueTrigger.getMethod(e, element);
            if (method == null) {
              return;
            }
            return $$(element).on(e, function() {
              var error;
              try {
                return eval('window.Croque.getMainClass().' + method + '(element)');
              } catch (_error) {
                error = _error;
                Log.w('An error has occurend when trying applying method');
                return ExceptionHandler.handle(error);
              }
            });
          };
        })(this);
        _results = [];
        for (_i = 0, _len = events.length; _i < _len; _i++) {
          e = events[_i];
          _results.push($('*[data-on' + Utils.capitalize(e)).each((function(_this) {
            return function(index, element) {
              var s;
              s = e;
              if (quoJS) {
                return f(s, element);
              } else {
                return require(['quoJS'], function() {
                  quoJS = true;
                  return f(s, element);
                });
              }
            };
          })(this)));
        }
        return _results;
      };


      /*
      			  * Runs croqueTrigger
       */

      CroqueTrigger.run = function() {
        CroqueTrigger.setMouseEvents();
        CroqueTrigger.setKeyboardEvents();
        return CroqueTrigger.setTouchEvents();
      };

      return CroqueTrigger;

    })();
  };
})(this));
