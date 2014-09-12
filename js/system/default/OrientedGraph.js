
/*
  * @class OrientedGraph
  * @brief An orientend graph
  * @description
  * To perform dependencies management, croque is using a graph.
  * Each vertice is a module to load and edges represents deps.
  * Croque will load firstly vertices without neighbors
 */
var OrientedGraph;

OrientedGraph = (function() {
  function OrientedGraph() {
    this.vertices = new Array();
    this.edges = new Array();
  }


  /*
  	  * Tests if a vertice is already in graph
   */

  OrientedGraph.prototype.inGraph = function(vertice) {
    var v, _i, _len, _ref;
    _ref = this.vertices;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      v = _ref[_i];
      if (vertice.getContent().getName() === v.getContent().getName()) {
        return true;
      }
    }
    return false;
  };


  /*
  	  * Tests if an edge is already in graph
   */

  OrientedGraph.prototype.existEdge = function(v1, v2) {
    var e, _i, _len, _ref;
    _ref = this.edges;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      e = _ref[_i];
      if (e[0] === v1.getContent().getName() && e[1] === v2.getContent().getName()) {
        return true;
      }
    }
    return false;
  };


  /*
  	  * Adds vertice to graph
   */

  OrientedGraph.prototype.addVertice = function(v) {
    if (!this.inGraph(v)) {
      return this.vertices.push(v);
    }
  };


  /*
  	  * Binds 2 vertices as v1 -> v2
   */

  OrientedGraph.prototype.bindVertices = function(v1, v2) {
    if (!this.existEdge(v1, v2)) {
      return this.edges.push(new Array(v1.getContent().getName(), v2.getContent().getName()));
    }
  };


  /*
  	  * Applies a function to the neighborhood of a given vertice
   */

  OrientedGraph.prototype.mapNeighborhood = function(vertice, func) {
    var e, v, _i, _len, _ref, _results;
    _ref = this.edges;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      e = _ref[_i];
      if (e[0] === vertice.getContent().getName()) {
        _results.push((function() {
          var _j, _len1, _ref1, _results1;
          _ref1 = this.vertices;
          _results1 = [];
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            v = _ref1[_j];
            if (e[1] === v.getContent().getName()) {
              _results1.push(func(v));
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        }).call(this));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };


  /*
  	  * Finds a vertice using its name
   */

  OrientedGraph.prototype.find = function(name) {
    var v, _i, _len, _ref;
    _ref = this.vertices;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      v = _ref[_i];
      if (v.getContent().getName() === name) {
        return v;
      }
    }
    return null;
  };

  return OrientedGraph;

})();
