var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/collections/StackTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/collections/Stack'], (function(_this) {
  return function() {
    var StackTest;
    return StackTest = (function(_super) {
      __extends(StackTest, _super);

      function StackTest() {
        return StackTest.__super__.constructor.apply(this, arguments);
      }

      StackTest.prototype.setUp = function() {
        return this.stack = new Stack;
      };

      StackTest.prototype.tearDown = function() {
        return this.stack = null;
      };

      StackTest.prototype.stackConstructorTest = function() {
        var stack;
        stack = new Stack;
        Assert.isNotNull(stack);
        return Assert.areEqual(0, stack.getSize());
      };

      StackTest.prototype.stackTopTest = function() {
        var outcome;
        this.stack.push('foo');
        this.stack.push('bar');
        outcome = this.stack.top();
        Assert.areEqual('bar', outcome);
        return Assert.areEqual(2, this.stack.getSize());
      };

      StackTest.prototype.stackTopEmptyTest = function() {
        var outcome;
        outcome = this.stack.top();
        return Assert.isNull(outcome);
      };

      StackTest.prototype.stackPopTest = function() {
        var outcome;
        this.stack.push('foo');
        this.stack.push('bar');
        outcome = this.stack.pop();
        Assert.areEqual('bar', outcome);
        Assert.areEqual(1, this.stack.getSize());
        return Assert.areEqual('foo', this.stack.top());
      };

      StackTest.prototype.stackPopEmptyTest = function() {
        var outcome;
        outcome = this.stack.pop();
        Assert.isNull(outcome);
        return Assert.areEqual(0, this.stack.getSize());
      };

      StackTest.prototype.stackPopSingleElementTest = function() {
        var outcome;
        this.stack.push('foo');
        outcome = this.stack.pop();
        Assert.areEqual('foo', outcome);
        Assert.areEqual(0, this.stack.getSize());
        return Assert.isNull(this.stack.top());
      };

      StackTest.prototype.stackPushTest = function() {
        this.stack.push('foo');
        this.stack.push('bar');
        Assert.areEqual(2, this.stack.getSize());
        return Assert.areEqual('bar', this.stack.top());
      };

      StackTest.prototype.stackPushEmptyTest = function() {
        this.stack.push('foo');
        Assert.areEqual('foo', this.stack.top());
        return Assert.areEqual(1, this.stack.getSize());
      };

      StackTest.prototype.stackGetSizeTest = function() {
        var outcome;
        this.stack.push('foo');
        this.stack.push('bar');
        outcome = this.stack.getSize();
        return Assert.areEqual(2, outcome);
      };

      StackTest.prototype.stackGetSizeEmptyTest = function() {
        var outcome;
        outcome = this.stack.getSize();
        return Assert.areEqual(0, outcome);
      };

      return StackTest;

    })(TestClass);
  };
})(this));
