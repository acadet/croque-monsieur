miam('system/collections/Stack', [], (function(_this) {
  return function() {

    /*
    		  * @class Stack
    		  * @brief A simple stack structure
     */
    var Stack;
    return Stack = (function() {

      /*
      			  * @class StackElement
      			  * @brief Internal class used by stack to manage its content
       */
      var StackElement;

      StackElement = (function() {
        function StackElement(content) {
          this.prev = null;
          this.content = content;
        }


        /*
        				  * Returns true if element is following
        				  * another
         */

        StackElement.prototype.hasPrev = function() {
          return this.prev != null;
        };


        /*
        				  * Gets previous element
         */

        StackElement.prototype.getPrev = function() {
          return this.prev;
        };


        /*
        				  * Sets previous element
         */

        StackElement.prototype.setPrev = function(e) {
          return this.prev = e;
        };


        /*
        				  * Gets intern content
         */

        StackElement.prototype.getContent = function() {
          return this.content;
        };

        return StackElement;

      })();

      function Stack() {
        this.queue = null;
        this.size = 0;
      }


      /*
      			  * Returns latest element in stack
      			  * but keeping it
       */

      Stack.prototype.top = function() {
        if (this.queue != null) {
          return this.queue.getContent();
        } else {
          return null;
        }
      };


      /*
      			  * Returns latest element and removes it
      			  * from the stack
       */

      Stack.prototype.pop = function() {
        var e;
        if (this.queue != null) {
          e = this.queue;
          this.queue = e.getPrev();
          this.size--;
          return e.getContent();
        } else {
          return null;
        }
      };


      /*
      			  * Adds a new element
       */

      Stack.prototype.push = function(obj) {
        var e;
        e = new StackElement(obj);
        this.size++;
        if (this.queue == null) {
          this.queue = e;
          return;
        }
        e.setPrev(this.queue);
        return this.queue = e;
      };


      /*
      			  * Gets current size
       */

      Stack.prototype.getSize = function() {
        return this.size;
      };

      return Stack;

    })();
  };
})(this));
