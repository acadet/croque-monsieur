miam('system/ajax/AjaxRequest', [], (function(_this) {
  return function() {
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

      AjaxRequest.prototype.setType = function(type) {
        return this.type = type;
      };

      AjaxRequest.prototype.setData = function(data) {
        return this.data = data;
      };

      AjaxRequest.prototype.setDataType = function(type) {
        return this.dataType = type;
      };

      AjaxRequest.prototype.setSuccess = function(f) {
        return this.success = f;
      };

      AjaxRequest.prototype.setError = function(f) {
        return this.error = f;
      };

      AjaxRequest.prototype.execute = function() {
        return $.ajax({
          type: this.type,
          url: this.url,
          dataType: this.dataType,
          success: this.success,
          error: this.error
        });
      };

      return AjaxRequest;

    })();
  };
})(this));
