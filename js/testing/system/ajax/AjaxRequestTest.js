var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/ajax/AjaxRequestTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/ajax/AjaxRequest'], (function(_this) {
  return function() {
    var AjaxRequestTest;
    return AjaxRequestTest = (function(_super) {
      __extends(AjaxRequestTest, _super);

      function AjaxRequestTest() {
        return AjaxRequestTest.__super__.constructor.apply(this, arguments);
      }

      AjaxRequestTest.prototype.setUp = function() {
        return this.request = new AjaxRequest('http://google.fr');
      };

      AjaxRequestTest.prototype.tearDown = function() {
        return this.request = null;
      };

      AjaxRequestTest.prototype.ajaxRequestConstructorTest = function() {
        var request;
        request = new AjaxRequest('http://google.fr');
        Assert.isNotNull(request);
        Assert.areEqual('GET', request.getType());
        Assert.areEqual('json', request.getDataType());
        Assert.isNotNull(request.getSuccess());
        return Assert.isNotNull(request.getError());
      };

      AjaxRequestTest.prototype.ajaxRequestTypeTest = function() {
        var outcome;
        this.request.setType('foo');
        outcome = this.request.getType();
        return Assert.areEqual('foo', outcome);
      };

      AjaxRequestTest.prototype.ajaxRequestDataTest = function() {
        var outcome;
        this.request.setData('foo');
        outcome = this.request.getData();
        return Assert.areEqual('foo', outcome);
      };

      AjaxRequestTest.prototype.ajaxRequestDataTypeTest = function() {
        var outcome;
        this.request.setDataType('foo');
        outcome = this.request.getDataType();
        return Assert.areEqual('foo', outcome);
      };

      AjaxRequestTest.prototype.ajaxRequestSuccessTest = function() {
        var expected, outcome;
        expected = (function(_this) {
          return function() {
            return alert('hello');
          };
        })(this);
        this.request.setSuccess(expected);
        outcome = this.request.getSuccess();
        return Assert.areEqual(expected, outcome);
      };

      AjaxRequestTest.prototype.ajaxRequestErrorTest = function() {
        var expected, outcome;
        expected = (function(_this) {
          return function() {
            return alert('hello');
          };
        })(this);
        this.request.setError(expected);
        outcome = this.request.getError();
        return Assert.areEqual(expected, outcome);
      };

      AjaxRequestTest.prototype.ajaxRequestExecuteTest = function() {
        this.request.setType('GET');
        return this.request.setDataType('html');
      };

      return AjaxRequestTest;

    })(TestClass);
  };
})(this));
