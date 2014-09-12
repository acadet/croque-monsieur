var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

miam('system/ajax/DeleteRequest', ['system/ajax/AjaxRequest'], (function(_this) {
  return function() {
    var DeleteRequest;
    return DeleteRequest = (function(_super) {
      __extends(DeleteRequest, _super);

      function DeleteRequest(url) {
        DeleteRequest.__super__.constructor.call(this, url);
        this.setType('DELETE');
        this.setSuccess((function(_this) {
          return function(data, status, xhr) {
            console.log('DELETE Request sucess!');
            return console.log(data);
          };
        })(this));
        this.setError((function(_this) {
          return function(xhr, status, error) {
            console.log('DELETE Request failed!');
            return console.log(error);
          };
        })(this));
      }

      return DeleteRequest;

    })(AjaxRequest);
  };
})(this));
