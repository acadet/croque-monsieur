miam('system/Tag', ['system/Utils'], (function(_this) {
  return function() {

    /*
    		  * @class Tag
    		  * @brief Help developer adding quickly a tag to page
     */
    var Tag;
    return Tag = (function() {

      /*
      			  * Build a new tag. Given element could wrap classes and id.
      			  * For instance, a#link.myClass.anotherOne will create a A
      			  * tag with link as id and myClass and anotherOne as classes
      			  * @param tag{String}
       */
      function Tag(tag) {
        var a, i, pre, _i, _ref;
        a = Utils.explode('.', tag);
        pre = Utils.explode('#', a[0]);
        this.tag = $('<' + pre[0] + '></' + pre[0] + '>');
        if (pre.length > 1) {
          this.setId(pre[1]);
        }
        for (i = _i = 1, _ref = a.length - 1; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
          this.addClass(a[i]);
        }
      }


      /*
      			  * Add class to current tag
      			  * @param c{String}
       */

      Tag.prototype.addClass = function(c) {
        return this.tag.addClass(c);
      };


      /*
      			  * Set id to current tag
      			  * @param id{String}
       */

      Tag.prototype.setId = function(id) {
        return this.tag.attr('id', id);
      };


      /*
      			  * Set content to current tag
      			  * @param c{String}
       */

      Tag.prototype.setContent = function(c) {
        return this.tag.html(c);
      };


      /*
      			  * Set attribute to current tag
      			  * @param key{String}
      			  * @param value{String}
       */

      Tag.prototype.setAttr = function(key, value) {
        return this.tag.attr(key, value);
      };


      /*
      			  * Set a data element
      			  * @param key{String}
      			  * @param value{String}
       */

      Tag.prototype.setDataElement = function(key, value) {
        return this.tag.attr('data-' + key, value);
      };


      /*
      			  * Get current tag as a string (with full elements)
       */

      Tag.prototype.toString = function() {
        return this.tag.prop('outerHTML');
      };


      /*
      			  * Append tag to given element. Using body by default
      			  * @param e{String}
       */

      Tag.prototype.appendTo = function(e) {
        if (e == null) {
          e = 'body';
        }
        return $(e).append(this.tag);
      };


      /*
      			  * Centerize element horizontally. Use body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.horizontal = function($wrapper) {
        return Tag.horizontal(this.tag, $wrapper);
      };

      Tag.horizontal = function($element, $wrapper) {
        if ($wrapper == null) {
          $wrapper = $('body');
        }
        return $element.css({
          left: ($wrapper.outerWidth() - $element.outerWidth()) / 2
        });
      };


      /*
      			  * Centerize element vertically. Use body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.vertical = function($wrapper) {
        return Tag.vertical(this.tag, $wrapper);
      };

      Tag.vertical = function($element, $wrapper) {
        if ($wrapper == null) {
          $wrapper = $('body');
        }
        return $element.css({
          top: ($wrapper.outerHeight() - $element.outerHeight()) / 2
        });
      };


      /*
      			  * Centerize element. Use body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.centerize = function($wrapper) {
        this.horizontal($wrapper);
        return this.vertical($wrapper);
      };

      Tag.centerize = function($element, $wrapper) {
        Tag.horizontal($element, $wrapper);
        return Tag.vertical($element, $wrapper);
      };


      /*
      			  * Cast tag to jquery object
       */

      Tag.prototype.toJQuery = function() {
        return this.tag;
      };


      /*
      			  * Cast tag to JS object
       */

      Tag.prototype.toJS = function() {
        return this.tag.get()[0];
      };

      return Tag;

    })();
  };
})(this));
