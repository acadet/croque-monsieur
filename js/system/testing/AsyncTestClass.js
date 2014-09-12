var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('system/testing/AsyncTestClass', ['system/testing/TestClass'], (function(_this) {
  return function() {
    var AsyncTestClass;
    return AsyncTestClass = (function(_super) {
      __extends(AsyncTestClass, _super);

      function AsyncTestClass() {
        AsyncTestClass.__super__.constructor.call(this, true);
      }

      AsyncTestClass.prototype.success = function() {};

      AsyncTestClass.prototype.fail = function() {};

      return AsyncTestClass;

    })(TestClass);
  };
})(this));
