(function() {
  var Croque, Dep, Stack, StackElement;

  StackElement = (function() {
    function StackElement(content) {
      this.content = content;
      this.prev = null;
    }

    StackElement.prototype.getContent = function() {
      return this.content;
    };

    StackElement.prototype.setContent = function(c) {
      return this.content = c;
    };

    StackElement.prototype.getPrev = function() {
      return this.prev;
    };

    StackElement.prototype.setPrev = function(prev) {
      return this.prev = prev;
    };

    return StackElement;

  })();

  Dep = (function() {
    function Dep(name, deps, declaration) {
      this.name = name;
      this.deps = deps;
      this.declaration = declaration;
    }

    Dep.prototype.getName = function() {
      return this.name;
    };

    Dep.prototype.setName = function(n) {
      return this.name = n;
    };

    Dep.prototype.getDeps = function() {
      return this.deps;
    };

    Dep.prototype.setDeps = function(d) {
      return this.deps = d;
    };

    Dep.prototype.getDeclaration = function() {
      return this.declaration;
    };

    Dep.prototype.setDeclaration = function(f) {
      return this.declaration = f;
    };

    return Dep;

  })();

  Stack = (function() {
    function Stack() {
      this.tail = null;
    }

    Stack.prototype.push = function(e) {
      e.setPrev(this.tail);
      return this.tail = e;
    };

    Stack.prototype.pop = function() {
      var tmp;
      tmp = this.tail;
      this.tail = this.tail.getPrev();
      return tmp;
    };

    Stack.prototype.isEmpty = function() {
      return this.tail === null;
    };

    return Stack;

  })();

  Croque = (function() {
    function Croque(folder, c) {
      var _this = this;
      if (folder == null) {
        throw new Error('You must set JSFOLDER var');
      }
      if (c == null) {
        throw new Error('You must set CROQUECLASS var');
      }
      this.folder = folder;
      this.classPath = c;
      this.className = this.extractClass(c);
      this.fixedConsole = false;
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
          domReady: 'vendor/domReady'
        },
        shim: {
          jquery: {
            exports: '$'
          }
        },
        urlArgs: "bust=" + (new Date()).getTime()
      });
      require(['jquery', 'domReady', 'modernizr', 'system/Environment'], function(domReady) {
        return require([_this.classPath], function() {
          return _this.whenReady(function() {
            var e, o;
            while (!_this.stack.isEmpty()) {
              o = _this.stack.pop().getContent();
              window[o.name] = o.declaration();
            }
            try {
              return eval("new " + _this.className + "()");
            } catch (_error) {
              e = _error;
              return console.log("CroqueMonsieur: error when constructing main class: " + e.message);
            }
          });
        });
      });
    }

    Croque.prototype.fixConsole = function() {
      var console, length, method, methods, noop,
        _this = this;
      if (this.fixedConsole) {
        return false;
      } else {
        this.fixedConsole = true;
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
      }
    };

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

    Croque.prototype.monsieur = function(name, deps, declaration) {
      var _this = this;
      this.total++;
      define(name, deps);
      return require([name], function() {
        var o, s;
        _this.loaded++;
        s = _this.extractClass(name);
        o = {
          name: s,
          declaration: declaration
        };
        return _this.stack.push(new StackElement(o));
      });
    };

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

    /*
    monsieur: (name, deps, declaration) ->
        define name, deps, declaration
        for i in deps
            require [i]
        require [name], (e) =>
            s = @extractClass name
            window[s] = e
            if s is @className
                a = eval "new " + @className + "()"
    */


    return Croque;

  })();

  window.Croque = new Croque(JSFOLDER, CROQUECLASS);

}).call(this);
