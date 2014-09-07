###
 # @class Vertice
 # @brief Wraps module for dep management
 ###
class Vertice
	#region Constructors

	constructor: (content) ->
		@content = content
		@color = Vertice.colors.WHITE
	
	#endregion Constructors
	
	#region Private

	# Colors represents if a vertice has already been visited
	@colors =
		WHITE : 0 # First time
		GREY : 1 # Already visited
		BLACK : 2 # Already visited and neighbors loaded
	
	#endregion Private
	
	#region Public

	###
	 # Gets intern content
	 ###
	getContent: () ->
		@content

	###
	 # Returns true if vertice has never been visited
	 ###
	isWhite: () ->
		@color is Vertice.colors.WHITE

	###
	 # Returns true if vertice has already been visited
	 # but its neighbors are not all loaded
	 ###
	isGrey: () ->
		@color is Vertice.colors.GREY

	###
	 # Returns true if vertice has been visited and 
	 # its neighbors are loaded
	 ###
	isBlack: () ->
		@color is Vertice.colors.BLACK

	###
	 # Sets color to white
	 ###
	setWhite: () ->
		@color = Vertice.colors.WHITE

	###
	 # Sets color to grey
	 ###
	setGrey: () ->
		@color = Vertice.colors.GREY

	###
	 # Sets color to black
	 ###
	setBlack: () ->
		@color = Vertice.colors.BLACK
	
	#endregion Public