var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/CookieTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/Cookie'], (function(_this) {
  return function() {
    var CookieTest;
    return CookieTest = (function(_super) {
      __extends(CookieTest, _super);

      function CookieTest() {
        return CookieTest.__super__.constructor.apply(this, arguments);
      }

      CookieTest.prototype.setUp = function() {
        return this.cookie = new Cookie('foo');
      };

      CookieTest.prototype.tearDown = function() {
        this.cookie.remove();
        return this.cookie = null;
      };

      CookieTest.prototype.cookieConstructorTest = function() {
        var cookie;
        cookie = new Cookie('foobar', 'bar');
        Assert.isNotNull(cookie);
        Assert.areEqual('bar', Cookie.getValue('foobar'));
        return cookie.remove();
      };

      CookieTest.prototype.cookieConstructorNoKeyTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var cookie;
            return cookie = new Cookie;
          };
        })(this));
      };

      CookieTest.prototype.cookieConstructorAutoValueTest = function() {
        var cookie, origin;
        origin = new Cookie('barbar', 'foo');
        cookie = new Cookie('barbar');
        Assert.isNotNull(cookie);
        Assert.areEqual('foo', cookie.getValue());
        return cookie.remove();
      };

      CookieTest.prototype.cookieValueTest = function() {
        var outcome;
        this.cookie.setValue('bar');
        outcome = this.cookie.getValue();
        Assert.areEqual('bar', outcome);
        return Assert.areEqual('bar', Cookie.getValue('foo'));
      };

      CookieTest.prototype.cookieValueStaticTest = function() {
        var outcome;
        this.cookie.setValue('bar');
        outcome = Cookie.getValue('foo');
        Assert.areEqual('bar', outcome);
        return Assert.areEqual(this.cookie.getValue(), outcome);
      };

      CookieTest.prototype.cookieRemoveTest = function() {
        this.cookie.setValue('bar');
        this.cookie.remove();
        return Assert.areNotEqual('bar', Cookie.getValue('foo'));
      };

      CookieTest.prototype.cookieRemoveStaticTest = function() {
        this.cookie.setValue('bar');
        Cookie.remove('foo');
        return Assert.areNotEqual('bar', Cookie.getValue('foo'));
      };

      return CookieTest;

    })(TestClass);
  };
})(this));
