var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/collections/QueueTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/collections/Queue'], (function(_this) {
  return function() {
    var QueueTest;
    return QueueTest = (function(_super) {
      __extends(QueueTest, _super);

      function QueueTest() {
        return QueueTest.__super__.constructor.apply(this, arguments);
      }

      QueueTest.prototype.setUp = function() {
        return this.queue = new Queue;
      };

      QueueTest.prototype.tearDown = function() {
        return this.queue = null;
      };

      QueueTest.prototype.queueConstructorTest = function() {
        var queue;
        queue = new Queue;
        Assert.isNotNull(queue);
        Assert.isNull(queue.top());
        return Assert.areEqual(0, queue.getSize());
      };

      QueueTest.prototype.queueTopTest = function() {
        var outcome;
        this.queue.push('foo');
        this.queue.push('bar');
        outcome = this.queue.top();
        Assert.areEqual('foo', outcome);
        return Assert.areEqual(2, this.queue.getSize());
      };

      QueueTest.prototype.queueTopEmptyTest = function() {
        var outcome;
        outcome = this.queue.top();
        return Assert.isNull(outcome);
      };

      QueueTest.prototype.queuePopTest = function() {
        var outcome;
        this.queue.push('foo');
        this.queue.push('bar');
        outcome = this.queue.pop();
        Assert.areEqual('foo', outcome);
        return Assert.areEqual(1, this.queue.getSize());
      };

      QueueTest.prototype.queuePopEmptyTest = function() {
        var outcome;
        outcome = this.queue.pop();
        Assert.isNull(outcome);
        return Assert.areEqual(0, this.queue.getSize());
      };

      QueueTest.prototype.queuePopSingleElementTest = function() {
        var outcome;
        this.queue.push('foo');
        outcome = this.queue.pop();
        Assert.areEqual('foo', outcome);
        return Assert.areEqual(0, this.queue.getSize());
      };

      QueueTest.prototype.queuePushTest = function() {
        this.queue.push('foo');
        this.queue.push('bar');
        Assert.areEqual('foo', this.queue.top());
        Assert.areEqual(2, this.queue.getSize());
        this.queue.pop();
        return Assert.areEqual('bar', this.queue.top());
      };

      QueueTest.prototype.queuePushSingleElementTest = function() {
        this.queue.push('foo');
        Assert.areEqual('foo', this.queue.top());
        return Assert.areEqual(1, this.queue.getSize());
      };

      QueueTest.prototype.queueGetSizeTest = function() {
        var outcome;
        this.queue.push('foo');
        this.queue.push('bar');
        outcome = this.queue.getSize();
        return Assert.areEqual(2, outcome);
      };

      QueueTest.prototype.queueGetSizeEmptyTest = function() {
        var outcome;
        outcome = this.queue.getSize();
        return Assert.areEqual(0, outcome);
      };

      return QueueTest;

    })(TestClass);
  };
})(this));
