
/*
  * @class Log
  * @brief A log system
 */
var Log;

Log = (function() {

  /*
  	  * Level of log
  	  * 0: no log
  	  * 1: only errors
  	  * 2: errors + info
  	  * 3: all details
   */
  function Log() {}

  Log.level = 3;


  /*
  	  * Prints a debug msg
   */

  Log.d = function(m) {
    if (Log.level >= 3) {
      return console.log('[CM DEBUG] ' + m);
    }
  };


  /*
  	  * Prints an info msg
   */

  Log.i = function(m) {
    if (Log.level >= 2) {
      return console.log('%c[CM INFO] ' + m, 'color : blue');
    }
  };


  /*
  	  * Prints a warning msg
   */

  Log.w = function(m) {
    if (Log.level >= 1) {
      console.log('%c[CM WARNING] ' + m, 'color : red');
      return console.trace();
    }
  };

  return Log;

})();
