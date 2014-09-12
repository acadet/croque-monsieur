miam('system/Utils', [], (function(_this) {
  return function() {

    /*
    		  * @class Utils
    		  * @brief Wraps global useful methods
     */
    var Utils;
    return Utils = (function() {
      function Utils() {}


      /*
      			  * Joins pieces of an array using glue
      			  * @param glue{String}
      			  * @param pieces{Array}
      			  * @return Joined array as a string
       */

      Utils.implode = function(glue, pieces) {
        var i, s, _i, _ref;
        if (glue == null) {
          throw new Error('You must give a glue to join pieces');
        } else if ((pieces == null) || pieces.length <= 0) {
          throw new Error('You should have at least one piece to implode');
        } else {
          s = '';
          for (i = _i = 0, _ref = pieces.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
            if (i === 0) {
              s += pieces[i];
            } else {
              s += glue + pieces[i];
            }
          }
          return s;
        }
      };


      /*
      			  * Explode string using the given delimiter
      			  * @param delimiter{String}
      			  * @param string{String}
      			  * @return Array with elements from given string
       */

      Utils.explode = function(delimiter, string) {
        var a, i, tmp, _i, _ref;
        if (delimiter == null) {
          throw new Error('You must give a delimiter to explode your string');
        } else if ((string == null) || string.length <= 0) {
          throw new Error('You must give a non empty string');
        } else {
          a = [];
          tmp = '';
          for (i = _i = 0, _ref = string.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
            if (string[i] === delimiter) {
              a.push(tmp);
              tmp = '';
            } else {
              tmp += string[i];
            }
          }
          a.push(tmp);
          return a;
        }
      };


      /*
      			  * Shuffles an array
       */

      Utils.shuffleArray = function(a) {
        var i, index, tmp, value, _i, _len, _results;
        _results = [];
        for (index = _i = 0, _len = a.length; _i < _len; index = ++_i) {
          value = a[index];
          i = parseInt(Math.round(Math.random() * (a.length - 1)));
          tmp = a[i];
          a[i] = value;
          _results.push(a[index] = tmp);
        }
        return _results;
      };


      /*
      			  * Concats 2 JSON objects
      			  * @param obj1 Destination
      			  * @param obj2 Object to append
       */

      Utils.concatJSON = function(obj1, obj2) {
        var key, value, _results;
        if (obj1 == null) {
          throw new Error('Destination is null');
        }
        if (obj2 == null) {
          Log.w('Object to append is null');
          return;
        }
        _results = [];
        for (key in obj2) {
          value = obj2[key];
          _results.push(obj1[key] = value);
        }
        return _results;
      };


      /*
      			  * Capitalizes first letter of string
      			  * @param string
       */

      Utils.capitalize = function(string) {
        if (string == null) {
          Log.w('Provided string is null');
          return null;
        }
        if (string.length < 1) {
          throw new Error('Unable to capitalize: string is too short');
        }
        return string.substr(0, 1).toUpperCase() + string.slice(1);
      };

      return Utils;

    })();
  };
})(this));
