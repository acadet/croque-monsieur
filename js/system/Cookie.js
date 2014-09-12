miam('system/Cookie', ['jqueryCookie'], (function(_this) {
  return function() {

    /*
    		  * @class Cookie
    		  * @brief This class allows developer managing cookies
     */
    var Cookie;
    return Cookie = (function() {

      /*
      			  * If only key is given, gets current value of cookie
      			  * @param key{String} Required param corresponding to cookie's key
      			  * @param value{String} Optional Cookie's value
      			  * @param expires{Integer} Optional Number of day before expiring
      			  * @param path{String} Optional Path for cookie
       */
      function Cookie(key, value, expires, path) {
        if (key == null) {
          throw new Error("Cookie must have at least a key");
        }
        if (path == null) {
          path = '/';
        }
        if (expires == null) {
          expires = 365;
        }
        if (value == null) {
          this.key = key;
          this.value = $.cookie(key);
        } else {
          this.key = key;
          this.value = value;
          $.cookie(key, value, {
            expires: expires,
            path: path
          });
        }
      }


      /*
      			  * Static method for getting value of a cookie
       */

      Cookie.getValue = function(key) {
        return $.cookie(key);
      };


      /*
      			  * Gets value of current cookie
       */

      Cookie.prototype.getValue = function() {
        return this.value;
      };


      /*
      			  * Sets value of current cookie
       */

      Cookie.prototype.setValue = function(v) {
        this.value = v;
        return $.cookie(this.key, this.value);
      };


      /*
      			  * Static method for removing cookie
       */

      Cookie.remove = function(key) {
        return $.cookie(key, null);
      };


      /*
      			  * Removes current cookie
       */

      Cookie.prototype.remove = function() {
        return Cookie.remove(this.key);
      };

      return Cookie;

    })();
  };
})(this));
