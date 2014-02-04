###
 # @class Vertice
 # @brief Wraps module for dep management
 ###
class Vertice
	# Colors represents if a vertice has already been visited
	@colors =
		WHITE : 0 # First time
		GREY : 1 # Already visited
		BLACK : 2 # Already visited and neighbors loaded

	constructor: (content) ->
		@content = content
		@color = Vertice.colors.WHITE

	getContent: () ->
		@content

	isWhite: () ->
		@color is Vertice.colors.WHITE

	isGrey: () ->
		@color is Vertice.colors.GREY

	isBlack: () ->
		@color is Vertice.colors.BLACK

	setWhite: () ->
		@color = Vertice.colors.WHITE

	setGrey: () ->
		@color = Vertice.colors.GREY

	setBlack: () ->
		@color = Vertice.colors.BLACK

