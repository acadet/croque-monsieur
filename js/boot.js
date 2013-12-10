(function() {
  var extractClass,
    _this = this;

  (function() {
    var console, length, method, methods, noop, _results;
    noop = function() {};
    methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error', 'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log', 'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd', 'timeStamp', 'trace', 'warn'];
    length = methods.length;
    console = window.console = window.console || {};
    _results = [];
    while (length--) {
      method = methods[length];
      if (!console[method]) {
        _results.push(console[method] = noop);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  })();

  extractClass = function(s) {
    var a, r;
    r = new RegExp('[.][a-zA-Z0-9\-_]+');
    a = (r.exec(s))[0];
    return a.substring(1);
  };

  require.config({
    baseUrl: JSFOLDER,
    paths: {
      jquery: 'vendor/jquery.1.10.2',
      jqueryCookie: 'vendor/jquery-cookie.1.4.0',
      modernizr: 'vendor/modernizr.2.7.1',
      dependencies: 'dependencies'
    },
    shim: {
      jquery: {
        exports: '$'
      }
    },
    urlArgs: "bust=" + (new Date()).getTime()
  });

  define('CroqueBase', ['jquery', 'dependencies'], function(dependencies) {
    return require([CROQUECLASS], function() {
      return eval("new " + (extractClass(CROQUECLASS)) + "()");
    });
  });

  require(['CroqueBase']);

}).call(this);
