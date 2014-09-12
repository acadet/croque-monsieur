
/*
  * @class Vertice
  * @brief Wraps module for dep management
 */
var Vertice;

Vertice = (function() {
  Vertice.colors = {
    WHITE: 0,
    GREY: 1,
    BLACK: 2
  };

  function Vertice(content) {
    this.content = content;
    this.color = Vertice.colors.WHITE;
  }

  Vertice.prototype.getContent = function() {
    return this.content;
  };

  Vertice.prototype.isWhite = function() {
    return this.color === Vertice.colors.WHITE;
  };

  Vertice.prototype.isGrey = function() {
    return this.color === Vertice.colors.GREY;
  };

  Vertice.prototype.isBlack = function() {
    return this.color === Vertice.colors.BLACK;
  };

  Vertice.prototype.setWhite = function() {
    return this.color = Vertice.colors.WHITE;
  };

  Vertice.prototype.setGrey = function() {
    return this.color = Vertice.colors.GREY;
  };

  Vertice.prototype.setBlack = function() {
    return this.color = Vertice.colors.BLACK;
  };

  return Vertice;

})();
