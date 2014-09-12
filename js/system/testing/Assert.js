miam('system/testing/Assert', [], (function(_this) {
  return function() {

    /*
    		  * @class Assert
    		  * @brief Provides methods for asserting when testing
     */
    var Assert;
    return Assert = (function() {
      function Assert() {}


      /*
      			  * Asserts provided boolean is true
       */

      Assert.isTrue = function(bool) {
        if (!bool) {
          throw new Error("Expected " + bool + " to be true");
        }
      };


      /*
      			  * Asserts provided boolean is false
       */

      Assert.isFalse = function(bool) {
        if (bool) {
          throw new Error("Expected " + bool + " to be false");
        }
      };


      /*
      			  * Asserts provided value is null
       */

      Assert.isNull = function(value) {
        if (value !== null) {
          throw new Error("Expected " + value + " to be null");
        }
      };


      /*
      			  * Asserts provided value is not null
       */

      Assert.isNotNull = function(value) {
        if (value === null) {
          throw new Error("Expected " + value + " to be not null");
        }
      };


      /*
      			  * Asserts expected value is equal to current one
       */

      Assert.areEqual = function(expected, value) {
        if (expected !== value) {
          throw new Error("Expected " + value + " to be equal to " + expected);
        }
      };


      /*
      			  * Asserts not expected value is not equal to current one
       */

      Assert.areNotEqual = function(notExpected, value) {
        if (notExpected === value) {
          throw new Error("Expected " + value + " to be different from " + notExpected);
        }
      };


      /*
      			  * Asserts provided method will throw an exception
       */

      Assert.fail = function(func) {
        var e;
        try {
          func();
          throw new Error("Expected " + func + " to throw an exception");
        } catch (_error) {
          e = _error;
        }
      };

      return Assert;

    })();
  };
})(this));
