miam('system/Tag', ['jquery', 'system/Utils'], (function(_this) {
  return function() {

    /*
    		  * @class Tag
    		  * @brief Makes appending a HTML tag to page easier
     */
    var Tag;
    return Tag = (function() {

      /*
      			  * Builds a new tag. Given element could wrap classes and id.
      			  * For instance, a#link.myClass.anotherOne will create a <a>
      			  * tag with "link" as id and "myClass" and "anotherOne" as
      			  * classes.
      			  * Id and classes are optional
      			  * @param tag{String}
       */
      function Tag(tag) {
        var buffer, current, firstClassMatching, i;
        if (tag == null) {
          throw new Error('Expected a tag');
        }
        i = 0;
        firstClassMatching = true;
        current = tag[i];
        buffer = '';
        while (i < tag.length && current !== '#') {
          if (current === '.') {
            if (firstClassMatching) {
              firstClassMatching = false;
              this.tag = $('<' + buffer + '>');
            } else {
              this.addClass(buffer);
            }
            buffer = '';
          } else {
            buffer += current;
          }
          i++;
          if (i !== tag.length) {
            current = tag[i];
          }
        }
        if (i === tag.length) {
          if (firstClassMatching) {
            this.tag = $('<' + buffer + '>');
            return;
          } else {
            this.addClass(buffer);
            return;
          }
        }
        this.tag = $('<' + buffer + '>');
        buffer = '';
        i++;
        current = tag[i];
        while (i < tag.length && current !== '.') {
          buffer += current;
          i++;
          if (i !== tag.length) {
            current = tag[i];
          }
        }
        this.setId(buffer);
        if (i === tag.length) {
          return;
        }
        i++;
        buffer = '';
        current = tag[i];
        while (i < tag.length) {
          if (current === '.') {
            this.addClass(buffer);
            buffer = '';
          } else {
            buffer += current;
          }
          i++;
          if (i !== tag.length) {
            current = tag[i];
          }
        }
        this.addClass(buffer);
      }


      /*
      			  * Adds class to current tag
      			  * @param c{String}
       */

      Tag.prototype.addClass = function(c) {
        return this.tag.addClass(c);
      };


      /*
      			  * Sets id to current tag
      			  * @param id{String}
       */

      Tag.prototype.setId = function(id) {
        return this.tag.attr('id', id);
      };


      /*
      			  * Sets content to current tag
      			  * @param c{String}
       */

      Tag.prototype.setContent = function(c) {
        return this.tag.html(c);
      };


      /*
      			  * Sets attribute to current tag
      			  * @param key{String}
      			  * @param value{String}
       */

      Tag.prototype.setAttr = function(key, value) {
        return this.tag.attr(key, value);
      };


      /*
      			  * Sets a data element
      			  * @param key{String}
      			  * @param value{String}
       */

      Tag.prototype.setDataElement = function(key, value) {
        return this.tag.attr('data-' + key, value);
      };


      /*
      			  * Gets current tag as a string (with full elements)
       */

      Tag.prototype.toString = function() {
        return this.tag.prop('outerHTML');
      };


      /*
      			  * Appends tag to given element. Using body by default
      			  * @param e{String}
       */

      Tag.prototype.appendTo = function(e) {
        if (e == null) {
          e = 'body';
        }
        return $(e).append(this.tag);
      };


      /*
      			  * Centerizes element horizontally.
      			  * Wrapper is optional: uses body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.horizontal = function($wrapper) {
        return Tag.horizontal(this.tag, $wrapper);
      };


      /*
      			  * Centerizes provided element horizontally.
      			  * Wrapper is optional: uses body by default
      			  * @param $element{jQuery Object}
      			  * @param $wrapper{jQuery Object}
       */

      Tag.horizontal = function($element, $wrapper) {
        if ($wrapper == null) {
          $wrapper = $('body');
        }
        return $element.css({
          left: ($wrapper.outerWidth() - $element.outerWidth()) / 2
        });
      };


      /*
      			  * Centerizes element vertically.
      			  * Wrapper is optional: uses body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.vertical = function($wrapper) {
        return Tag.vertical(this.tag, $wrapper);
      };


      /*
      			  * Centerizes provided element vertically.
      			  * Wrapper is optional: uses body by default
      			  * @param $element{jQuery Object}
      			  * @param $wrapper{jQuery Object}
       */

      Tag.vertical = function($element, $wrapper) {
        if ($wrapper == null) {
          $wrapper = $('body');
        }
        return $element.css({
          top: ($wrapper.outerHeight() - $element.outerHeight()) / 2
        });
      };


      /*
      			  * Centerizes element.
      			  * Wrapper is optional: uses body by default
      			  * @param $wrapper{jQuery Object}
       */

      Tag.prototype.centerize = function($wrapper) {
        this.horizontal($wrapper);
        return this.vertical($wrapper);
      };


      /*
      			  * Centerizes provided element vertically.
      			  * Wrapper is optional: uses body by default
      			  * @param $element{jQuery Object}
      			  * @param $wrapper{jQuery Object}
       */

      Tag.centerize = function($element, $wrapper) {
        Tag.horizontal($element, $wrapper);
        return Tag.vertical($element, $wrapper);
      };


      /*
      			  * Casts tag to jquery object
       */

      Tag.prototype.toJQuery = function() {
        return this.tag;
      };


      /*
      			  * Casts tag to JS object
       */

      Tag.prototype.toJS = function() {
        return this.tag.get()[0];
      };

      return Tag;

    })();
  };
})(this));
