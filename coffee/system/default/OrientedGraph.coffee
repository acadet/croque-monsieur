###
 # @class OrientedGraph
 # @brief An orientend graph
 # @description
 # To perform dependencies management, croque is using a graph.
 # Each vertice is a module to load and edges represents deps.
 # Croque will load firstly vertices without neighbors
 ###
class OrientedGraph

	constructor: () ->
		@vertices = new Array()
		@edges = new Array()

	###
	 # Tests if a vertice is already in graph
	 ###
	inGraph: (vertice) ->
		for v in @vertices
			if vertice.getContent().getName() is v.getContent().getName()
				return true
		return false

	###
	 # Tests if an edge is already in graph
	 ###
	existEdge: (v1, v2) ->
		for e in @edges
			if e[0] is v1.getContent().getName() and e[1] is v2.getContent().getName()
				return true
		return false

	###
	 # Adds vertice to graph
	 ###
	addVertice: (v) ->
		if not @inGraph(v)
			@vertices.push v

	###
	 # Binds 2 vertices as v1 -> v2
	 ###
	bindVertices: (v1, v2) ->
		if not @existEdge(v1, v2)
			@edges.push new Array(v1.getContent().getName(), v2.getContent().getName())

	###
	 # Applies a function to the neighborhood of a given vertice
	 ###
	mapNeighborhood: (vertice, func) ->
		for e in @edges
			if e[0] is vertice.getContent().getName()
				for v in @vertices
					if e[1] is v.getContent().getName()
						func(v)

	###
	 # Finds a vertice using its name
	 ###
	find: (name) ->
		for v in @vertices
			if v.getContent().getName() is name
				return v
		return null


