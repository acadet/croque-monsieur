
/*
  * @class Module
  * @brief Used structure to manage dependencies
 */
var Module;

Module = (function() {
  function Module(name, declaration) {
    this.name = name;
    this.declaration = declaration;
  }


  /*
    * Gets name
   */

  Module.prototype.getName = function() {
    return this.name;
  };


  /*
    * Sets name
   */

  Module.prototype.setName = function(n) {
    return this.name = n;
  };


  /*
    * Gets stored declaration
   */

  Module.prototype.getDeclaration = function() {
    return this.declaration;
  };


  /*
    * Stores declaration
   */

  Module.prototype.setDeclaration = function(f) {
    return this.declaration = f;
  };

  return Module;

})();
