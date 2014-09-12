miam('system/Cookie', ['jqueryCookie'], (function(_this) {
  return function() {

    /*
    		  * @class Cookie
    		  * @brief This class allows developer managing cookies
     */
    var Cookie;
    return Cookie = (function() {

      /*
      			  * Constructor
      			  * If only key is given, get current value of cookie
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

      Cookie.getVal = function(key) {
        return $.cookie(key);
      };


      /*
      			  * Get value of current cookie
       */

      Cookie.prototype.getVal = function() {
        return this.value;
      };


      /*
      			  * Set value of current cookie
       */

      Cookie.prototype.setVal = function(v) {
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
      			  * Remove current cookie
       */

      Cookie.prototype.remove = function() {
        return Cookie.remove(this.key);
      };

      return Cookie;

    })();
  };
})(this));
