class OrientedGraph

	constructor: () ->
		@vertices = new Array()
		@edges = new Array()

	inGraph: (vertice) ->
		for v in @vertices
			if vertice.getContent().getName() is v.getContent().getName()
				return true
		return false

	existEdge: (v1, v2) ->
		for e in @edges
			if e[0] is v1.getContent().getName() and e[1] is v2.getContent().getName()
				return true
		return false

	addVertice: (v) ->
		if not @inGraph(v)
			@vertices.push v

	bindVertices: (v1, v2) ->
		if not @existEdge(v1, v2)
			@edges.push new Array(v1.getContent().getName(), v2.getContent().getName())

	mapNeighborhood: (vertice, func) ->
		for e in @edges
			if e[0] is vertice.getContent().getName()
				for v in @vertices
					if e[1] is v.getContent().getName()
						func(v)

	find: (name) ->
		for v in @vertices
			if v.getContent().getName() is name
				return v
		return null


