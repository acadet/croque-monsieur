miam('system/ajax/AjaxRequest', ['jquery'], (function(_this) {
  return function() {

    /*
    		  * @class AjaxRequest
    		  * @brief A simple ajax request
     */
    var AjaxRequest;
    return AjaxRequest = (function() {
      function AjaxRequest(url) {
        this.url = url;
        this.type = 'GET';
        this.dataType = 'json';
        this.success = (function(_this) {
          return function(data, status, xhr) {
            console.log('AjaxRequest success!');
            return console.log(data);
          };
        })(this);
        this.error = (function(_this) {
          return function(xhr, status, error) {
            console.log('AjaxRequest failed!');
            return console.log(error);
          };
        })(this);
      }


      /*
      			  * Sets type of request (POST, GET etc.)
       */

      AjaxRequest.prototype.setType = function(type) {
        return this.type = type;
      };


      /*
      			  * Sets optional data to send
       */

      AjaxRequest.prototype.setData = function(data) {
        return this.data = data;
      };


      /*
      			  * Sets type of received data
       */

      AjaxRequest.prototype.setDataType = function(type) {
        return this.dataType = type;
      };


      /*
      			  * Sets success callback
       */

      AjaxRequest.prototype.setSuccess = function(f) {
        return this.success = f;
      };


      /*
      			  * Sets error callback
       */

      AjaxRequest.prototype.setError = function(f) {
        return this.error = f;
      };


      /*
      			  * Runs request
       */

      AjaxRequest.prototype.execute = function() {
        return $.ajax({
          type: this.type,
          url: this.url,
          data: this.data,
          dataType: this.dataType,
          success: this.success,
          error: this.error
        });
      };

      return AjaxRequest;

    })();
  };
})(this));
