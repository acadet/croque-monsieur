
/*
  * @class Module
  * @brief Used struct to manage dependencies
 */
var Module;

Module = (function() {
  function Module(name, declaration) {
    this.name = name;
    this.declaration = declaration;
  }

  Module.prototype.getName = function() {
    return this.name;
  };

  Module.prototype.setName = function(n) {
    return this.name = n;
  };

  Module.prototype.getDeclaration = function() {
    return this.declaration;
  };

  Module.prototype.setDeclaration = function(f) {
    return this.declaration = f;
  };

  return Module;

})();
