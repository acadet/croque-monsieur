var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('testing/system/TagTest', ['system/testing/TestClass', 'system/testing/Assert', 'system/Tag'], (function(_this) {
  return function() {
    var TagTest;
    return TagTest = (function(_super) {
      __extends(TagTest, _super);

      function TagTest() {
        return TagTest.__super__.constructor.apply(this, arguments);
      }

      TagTest.prototype.setUp = function() {
        return this.tag = new Tag('p');
      };

      TagTest.prototype.tearDown = function() {
        return this.tag = null;
      };

      TagTest.prototype.tagConstructorTest = function() {
        var outcome, tag;
        tag = new Tag('a');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        return Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
      };

      TagTest.prototype.tagConstructorSingleClassTest = function() {
        var outcome, tag;
        tag = new Tag('a.foo');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
        return Assert.isTrue(outcome.hasClass('foo'));
      };

      TagTest.prototype.tagConstructorMultipleClassesTest = function() {
        var outcome, tag;
        tag = new Tag('a.foo.bar');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
        Assert.isTrue(outcome.hasClass('foo'));
        return Assert.isTrue(outcome.hasClass('bar'));
      };

      TagTest.prototype.tagConstructorOnlyIdTest = function() {
        var outcome, tag;
        tag = new Tag('a#foo');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
        return Assert.areEqual('foo', outcome.attr('id'));
      };

      TagTest.prototype.tagConstructorIdAndSingleClassTest = function() {
        var outcome, tag;
        tag = new Tag('a#foo.bar');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
        Assert.areEqual('foo', outcome.attr('id'));
        return Assert.isTrue(outcome.hasClass('bar'));
      };

      TagTest.prototype.tagConstructorFullTest = function() {
        var outcome, tag;
        tag = new Tag('a#foo.bar.foobar');
        Assert.isNotNull(tag);
        outcome = tag.toJQuery();
        Assert.areEqual('a', outcome.prop('tagName').toLowerCase());
        Assert.areEqual('foo', outcome.attr('id'));
        Assert.isTrue(outcome.hasClass('bar'));
        return Assert.isTrue(outcome.hasClass('foobar'));
      };

      TagTest.prototype.tagAddClassTest = function() {
        var outcome;
        this.tag.addClass('foo');
        this.tag.addClass('bar');
        outcome = this.tag.toJQuery();
        Assert.isTrue(outcome.hasClass('foo'));
        return Assert.isTrue(outcome.hasClass('bar'));
      };

      TagTest.prototype.tagSetIdTest = function() {
        var outcome;
        this.tag.setId('foo');
        outcome = this.tag.toJQuery();
        return Assert.areEqual('foo', outcome.attr('id'));
      };

      TagTest.prototype.tagSetContentTest = function() {
        var outcome;
        this.tag.setContent('foobar');
        outcome = this.tag.toJQuery();
        return Assert.areEqual('foobar', outcome.html());
      };

      TagTest.prototype.tagSetAttrTest = function() {
        var outcome;
        this.tag.setAttr('foo', 'bar');
        outcome = this.tag.toJQuery();
        return Assert.areEqual('bar', outcome.attr('foo'));
      };

      TagTest.prototype.tagSetDataElementTest = function() {
        var outcome;
        this.tag.setDataElement('foo', 'bar');
        outcome = this.tag.toJQuery();
        return Assert.areEqual('bar', outcome.attr('data-foo'));
      };

      TagTest.prototype.tagToStringTest = function() {
        var outcome;
        this.tag.setId('foo');
        this.tag.setContent('foobar');
        outcome = this.tag.toString();
        return Assert.areEqual('<p id="foo">foobar</p>', outcome.toLowerCase());
      };

      return TagTest;

    })(TestClass);
  };
})(this));
