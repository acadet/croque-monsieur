/*
 # @file boot.coffee
 # @author Adrien Cadet <acadet@live.fr>
 # @brief Wraps initialization of Croque Monsieur
*/


(function() {
  var _this = this,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  (function() {
    if (typeof JSFOLDER === "undefined" || JSFOLDER === null) {
      throw new Error('You must set JSFOLDER var');
    }
    if (typeof CROQUECLASS === "undefined" || CROQUECLASS === null) {
      throw new Error('You must set CROQUECLASS var');
    }
  })();

  require([JSFOLDER + 'system/default/Module', JSFOLDER + 'system/default/Vertice', JSFOLDER + 'system/default/OrientedGraph', JSFOLDER + 'config'], function() {
    /*
     # @class Croque
     # @brief Loads needed class and all its dependencies. Sets default config
    */

    var Croque;
    Croque = (function() {
      function Croque(folder, c) {
        var key, value, _ref, _ref1, _ref2,
          _this = this;
        this.folder = folder;
        this.classPath = c;
        this.className = this.extractClass(c);
        this.loaded = 0;
        this.total = 0;
        this.graph = new OrientedGraph();
        this.rootVertice = new Vertice(new Module(this.className));
        this.graph.addVertice(this.rootVertice);
        this.fixConsole();
        this.requireConfig = {
          baseUrl: this.folder
        };
        if (!CROQUE_CONFIG.cache) {
          this.requireConfig.urlArgs = "bust=" + (new Date()).getTime();
        }
        _ref = CROQUE_CONFIG.libs;
        for (key in _ref) {
          value = _ref[key];
          if (__indexOf.call(CROQUE_CONFIG.IESupport, key) >= 0) {
            if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
              define(key, []);
            } else {
              define(key, [value]);
            }
          } else {
            if (this.requireConfig.paths == null) {
              this.requireConfig.paths = {};
            }
            this.requireConfig.paths[key] = value;
          }
        }
        _ref1 = CROQUE_CONFIG.exports;
        for (key in _ref1) {
          value = _ref1[key];
          if (!this.requireConfig.shim) {
            this.requireConfig.shim = {};
          }
          this.requireConfig.shim[key] = {
            exports: value
          };
        }
        _ref2 = CROQUE_CONFIG.extras;
        for (key in _ref2) {
          value = _ref2[key];
          this.requireConfig[key] = value;
        }
        require.config(this.requireConfig);
        require(CROQUE_CONFIG["default"], function() {
          return require([_this.classPath], function() {
            return _this.whenReady(function() {
              var browser, e;
              browser = function(v) {
                var m;
                if (v.isWhite()) {
                  v.setGrey();
                  _this.graph.mapNeighborhood(v, browser);
                  v.setBlack();
                  m = v.getContent();
                  return window[m.getName()] = (m.getDeclaration())();
                }
              };
              browser(_this.rootVertice);
              try {
                return _this.mainClass = eval("new " + _this.className + "()");
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
       # Gets current main class
      */


      Croque.prototype.getMainClass = function() {
        return this.mainClass;
      };

      /*
       # Extracts class from given path
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
        var d, root, s, v, _i, _len, _results,
          _this = this;
        if (name == null) {
          throw new Error('Your module needs a name');
        }
        if (deps == null) {
          throw new Error('Your module needs at least an empty array of dependencies');
        }
        if (declaration == null) {
          throw new Error('Your module needs a declaration');
        }
        s = this.extractClass(name);
        root = this.graph.find(s);
        if (root == null) {
          throw new Error('Module should have already been in graph');
        }
        if (root.getContent().getDeclaration() == null) {
          root.getContent().setDeclaration(declaration);
        }
        _results = [];
        for (_i = 0, _len = deps.length; _i < _len; _i++) {
          d = deps[_i];
          if ((this.requireConfig.paths[d] != null) || d === 'quoJS') {
            _results.push(require([d]));
          } else {
            v = this.graph.find(this.extractClass(d));
            if (v == null) {
              v = new Vertice(new Module(this.extractClass(d)));
              this.total++;
              this.graph.addVertice(v);
              require([d], function() {
                return _this.loaded++;
              });
            }
            _results.push(this.graph.bindVertices(root, v));
          }
        }
        return _results;
      };

      /*
       # Executes a function when init is done
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
