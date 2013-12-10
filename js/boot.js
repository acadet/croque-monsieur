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
    var c, d, i, _i, _ref;
    c = "";
    i = s.length - 1;
    d = "";
    while (i >= 0) {
      if (s[i] === ".") {
        i = -1;
      } else {
        c += s[i];
      }
      i--;
    }
    for (i = _i = _ref = c.length - 1; _ref <= 0 ? _i <= 0 : _i >= 0; i = _ref <= 0 ? ++_i : --_i) {
      d += c[i];
    }
    return d;
  };

  if (typeof JSFOLDER === "undefined" || JSFOLDER === null) {
    throw new Error("You must set JSFOLDER var");
  }

  if (typeof CROQUECLASS === "undefined" || CROQUECLASS === null) {
    throw new Error("You must set CROQUECLASS var");
  }

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

  define('CroqueBase', ['jquery', 'dependencies'], function() {
    return require([CROQUECLASS], function() {
      var e;
      try {
        return eval("new " + (extractClass(CROQUECLASS)) + "()");
      } catch (_error) {
        e = _error;
        return console.log("You have tried to use a non existing class : " + e.message);
      }
    });
  });

  require(['CroqueBase']);

}).call(this);
