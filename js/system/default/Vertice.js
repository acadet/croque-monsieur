
/*
  * @class Vertice
  * @brief Wraps module for dep management
 */
var Vertice;

Vertice = (function() {
  function Vertice(content) {
    this.content = content;
    this.color = Vertice.colors.WHITE;
  }

  Vertice.colors = {
    WHITE: 0,
    GREY: 1,
    BLACK: 2
  };


  /*
  	  * Gets intern content
   */

  Vertice.prototype.getContent = function() {
    return this.content;
  };


  /*
  	  * Returns true if vertice has never been visited
   */

  Vertice.prototype.isWhite = function() {
    return this.color === Vertice.colors.WHITE;
  };


  /*
  	  * Returns true if vertice has already been visited
  	  * but its neighbors are not all loaded
   */

  Vertice.prototype.isGrey = function() {
    return this.color === Vertice.colors.GREY;
  };


  /*
  	  * Returns true if vertice has been visited and 
  	  * its neighbors are loaded
   */

  Vertice.prototype.isBlack = function() {
    return this.color === Vertice.colors.BLACK;
  };


  /*
  	  * Sets color to white
   */

  Vertice.prototype.setWhite = function() {
    return this.color = Vertice.colors.WHITE;
  };


  /*
  	  * Sets color to grey
   */

  Vertice.prototype.setGrey = function() {
    return this.color = Vertice.colors.GREY;
  };


  /*
  	  * Sets color to black
   */

  Vertice.prototype.setBlack = function() {
    return this.color = Vertice.colors.BLACK;
  };

  return Vertice;

})();
