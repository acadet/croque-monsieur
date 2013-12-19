/*
 # @file boot.coffee
 # @author Adrien Cadet <acadet@live.fr>
 # @brief Wraps initialization of Croque Monsieur
*/


(function() {
  var _this = this;

  (function() {
    if (typeof JSFOLDER === "undefined" || JSFOLDER === null) {
      throw new Error('You must set JSFOLDER var');
    }
    if (typeof CROQUECLASS === "undefined" || CROQUECLASS === null) {
      throw new Error('You must set CROQUECLASS var');
    }
  })();

  require([JSFOLDER + 'system/default/Module.js', JSFOLDER + 'system/default/StackElement.js', JSFOLDER + 'system/default/Stack.js'], function() {
    /*
     # @class Croque
     # @brief Loads needed class and all its dependencies. Set default config
    */

    var Croque;
    Croque = (function() {
      function Croque(folder, c) {
        var _this = this;
        this.folder = folder;
        this.classPath = c;
        this.className = this.extractClass(c);
        this.loaded = 0;
        this.total = 0;
        this.stack = new Stack;
        this.fixConsole();
        require.config({
          baseUrl: this.folder,
          paths: {
            jquery: 'vendor/jquery.1.10.2',
            jqueryCookie: 'vendor/jquery-cookie.1.4.0',
            modernizr: 'vendor/modernizr.2.7.1',
            jqueryUI: 'vendor/jquery-ui.1.10.3'
          },
          shim: {
            jquery: {
              exports: '$'
            },
            quoJS: {
              exports: '$$'
            }
          },
          urlArgs: "bust=" + (new Date()).getTime()
        });
        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
          define('quoJS', []);
        } else {
          define('quoJS', ['vendor/quo.2.3.6']);
        }
        require(['jquery', 'modernizr', 'system/default/Environment', 'system/default/Log'], function() {
          return require([_this.classPath], function() {
            return _this.whenReady(function() {
              var e, m;
              while (!_this.stack.isEmpty()) {
                m = _this.stack.pop().getContent();
                window[m.getName()] = (m.getDeclaration())();
              }
              try {
                return eval("new " + _this.className + "()");
              } catch (_error) {
                e = _error;
                Log.w("CroqueMonsieur: error when constructing main class: " + e.message);
                return Log.w(e.stack);
              }
            });
          });
        });
      }

      /*
       # Avoid console errors in browsers that lack a console.
       # Replace each function by an empty one
      */


      Croque.prototype.fixConsole = function() {
        var console, length, method, methods, noop,
          _this = this;
        noop = function() {
          return {};
        };
        methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error', 'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log', 'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd', 'timeStamp', 'trace', 'warn'];
        length = methods.length;
        console = window.console === window.console || {};
        while (length--) {
          method = methods[length];
          if (!console[method]) {
            console[method] = noop;
          }
        }
        return true;
      };

      /*
       # Extract class from given path
      */


      Croque.prototype.extractClass = function(s) {
        var c, i, tmp, _i, _ref;
        if (s == null) {
          throw new Error('extractClass needs a non empty string');
        }
        tmp = "";
        i = s.length - 1;
        c = "";
        while (i >= 0) {
          if (s[i] === "/") {
            i = -1;
          } else {
            tmp += s[i];
          }
          i--;
        }
        for (i = _i = _ref = tmp.length - 1; _ref <= 0 ? _i <= 0 : _i >= 0; i = _ref <= 0 ? ++_i : --_i) {
          c += tmp[i];
        }
        return c;
      };

      /*
       # VI Function. Used to define each module of the app
       # @param name{String} Name of module
       # @param deps{Array} Array of dependencies' name
       # @param declaration{Function} Declaration of class
      */


      Croque.prototype.miam = function(name, deps, declaration) {
        var _this = this;
        if (name == null) {
          throw new Error('Your module needs a name');
        }
        if (deps == null) {
          throw new Error('Your module needs at least an empty array of dependencies');
        }
        if (declaration == null) {
          throw new Error('Your module needs a declaration');
        }
        this.total++;
        define(name, deps);
        return require([name], function() {
          var s;
          _this.loaded++;
          s = _this.extractClass(name);
          return _this.stack.push(new StackElement(new Module(s, declaration)));
        });
      };

      /*
       # Execute a function when init is done
       # (deps are all loaded)
      */


      Croque.prototype.whenReady = function(f) {
        var _this = this;
        if (this.loaded >= this.total) {
          return f();
        } else {
          return setTimeout(function() {
            return _this.whenReady(f);
          }, 250);
        }
      };

      return Croque;

    })();
    window.Croque = new Croque(JSFOLDER, CROQUECLASS);
    return window.miam = function(name, deps, declaration) {
      return window.Croque.miam(name, deps, declaration);
    };
  });

}).call(this);
