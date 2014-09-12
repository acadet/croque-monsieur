var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/UtilsTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/Utils'], (function(_this) {
  return function() {
    var UtilsTest;
    return UtilsTest = (function(_super) {
      __extends(UtilsTest, _super);

      function UtilsTest() {
        return UtilsTest.__super__.constructor.apply(this, arguments);
      }

      UtilsTest.prototype.setUp = function() {};

      UtilsTest.prototype.tearDown = function() {};

      UtilsTest.prototype._compareJSON = function(a, b) {
        var key, value;
        for (key in a) {
          value = a[key];
          if (value !== b[key]) {
            return false;
          }
        }
        return true;
      };

      UtilsTest.prototype.utilsImplodeTest = function() {
        var a, outcome;
        a = new Array;
        a.push('foo');
        a.push('bar');
        a.push('foobar');
        outcome = Utils.implode(';', a);
        Assert.isNotNull(outcome);
        return Assert.areEqual('foo;bar;foobar', outcome);
      };

      UtilsTest.prototype.utilsImplodeSingleElementTest = function() {
        var a, outcome;
        a = new Array;
        a.push('foo');
        outcome = Utils.implode(';', a);
        Assert.isNotNull(outcome);
        return Assert.areEqual('foo', outcome);
      };

      UtilsTest.prototype.utilsImplodeNoGlueTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var outcome;
            return outcome = Utils.implode();
          };
        })(this));
      };

      UtilsTest.prototype.utilsImplodeNoPiecesTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var outcome;
            return outcome = Utils.implode(';');
          };
        })(this));
      };

      UtilsTest.prototype.utilsExplodeTest = function() {
        var outcome, s;
        s = 'foo;bar;foobar';
        outcome = Utils.explode(';', s);
        Assert.isNotNull(outcome);
        Assert.areEqual(3, outcome.length);
        Assert.areEqual('foo', outcome[0]);
        Assert.areEqual('bar', outcome[1]);
        return Assert.areEqual('foobar', outcome[2]);
      };

      UtilsTest.prototype.utilsExplodeSingleElementTest = function() {
        var outcome, s;
        s = 'foobar';
        outcome = Utils.explode('+', s);
        Assert.isNotNull(outcome);
        Assert.areEqual(1, outcome.length);
        return Assert.areEqual('foobar', outcome[0]);
      };

      UtilsTest.prototype.utilsExplodeDelimiterAndSourceAreSameTest = function() {
        var outcome, s;
        s = "$$";
        outcome = Utils.explode('$', s);
        Assert.isNotNull(outcome);
        Assert.areEqual(3, outcome.length);
        Assert.areEqual('', outcome[0]);
        Assert.areEqual('', outcome[1]);
        return Assert.areEqual('', outcome[2]);
      };

      UtilsTest.prototype.utilsExplodeNoDelimiterTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var outcome;
            return outcome = Utils.explode();
          };
        })(this));
      };

      UtilsTest.prototype.utilsExplodeNoSourceTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var outcome;
            return outcome = Utils.explode(';');
          };
        })(this));
      };

      UtilsTest.prototype.utilsConcatJSONTest = function() {
        var a, b, expected;
        a = {
          firstName: 'foo',
          city: 'San Francisco'
        };
        b = {
          lastName: 'bar',
          age: 18
        };
        expected = {
          firstName: 'foo',
          lastName: 'bar',
          age: 18,
          city: 'San Francisco'
        };
        Utils.concatJSON(a, b);
        return Assert.isTrue(this._compareJSON(expected, a));
      };

      UtilsTest.prototype.utilsConcatJSONSourceNullTest = function() {
        var a;
        a = {
          firstName: 'James',
          lastName: 'Bond'
        };
        return Assert.fail((function(_this) {
          return function() {
            return Utils.concatJSON(null, a);
          };
        })(this));
      };

      UtilsTest.prototype.utilsConcatJSONAppendedNullTest = function() {
        var a, expected;
        a = {
          firstName: 'James',
          lastName: 'Bond'
        };
        expected = {
          firstName: 'James',
          lastName: 'Bond'
        };
        Utils.concatJSON(a, null);
        return Assert.isTrue(this._compareJSON(expected, a));
      };

      UtilsTest.prototype.utilsCapitalizeTest = function() {
        var outcome, value;
        value = 'harvey';
        outcome = Utils.capitalize(value);
        return Assert.areEqual('Harvey', outcome);
      };

      UtilsTest.prototype.utilsCapitalizeNullTest = function() {
        var outcome;
        outcome = Utils.capitalize(null);
        return Assert.isNull(outcome);
      };

      UtilsTest.prototype.utilsCapitalizeTooShortTest = function() {
        return Assert.fail((function(_this) {
          return function() {
            var outcome;
            return outcome = Utils.capitalize('');
          };
        })(this));
      };

      return UtilsTest;

    })(TestClass);
  };
})(this));
