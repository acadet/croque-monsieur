miam('system/collections/Queue', [], (function(_this) {
  return function() {

    /*
    		  * @class Queue
    		  * @brief A simple queue structure
     */
    var Queue;
    return Queue = (function() {

      /*
      			  * @class QueueElement
      			  * @brief Internal class used by the queue to manage 
      			  * its content
       */
      var QueueElement;

      QueueElement = (function() {
        function QueueElement(content) {
          this.next = null;
          this.content = content;
        }


        /*
        				  * Returns true if element has a follower
         */

        QueueElement.prototype.hasNext = function() {
          return this.next != null;
        };


        /*
        				  * Gets follower
         */

        QueueElement.prototype.getNext = function() {
          return this.next;
        };


        /*
        				  * Sets follower
         */

        QueueElement.prototype.setNext = function(e) {
          return this.next = e;
        };


        /*
        				  * Gets intern content
         */

        QueueElement.prototype.getContent = function() {
          return this.content;
        };

        return QueueElement;

      })();

      function Queue() {
        this.head = null;
        this.size = 0;
      }


      /*
      			  * Returns oldest element but keep it in the
      			  * structure
       */

      Queue.prototype.top = function() {
        if (this.head != null) {
          return this.head.getContent();
        } else {
          return null;
        }
      };


      /*
      			  * Returns oldest element and removes it from 
      			  * the structure
       */

      Queue.prototype.pop = function() {
        var e;
        if (this.head != null) {
          e = this.head;
          this.head = e.getNext();
          this.size--;
          return e.getContent();
        } else {
          return null;
        }
      };


      /*
      			  * Adds a new element
       */

      Queue.prototype.push = function(obj) {
        var cursor, e;
        e = new QueueElement(obj);
        this.size++;
        if (this.head == null) {
          this.head = e;
          return;
        }
        cursor = this.head;
        while (cursor.hasNext()) {
          cursor = cursor.getNext();
        }
        return cursor.setNext(e);
      };


      /*
      			  * Gets current size
       */

      Queue.prototype.getSize = function() {
        return this.size;
      };

      return Queue;

    })();
  };
})(this));
