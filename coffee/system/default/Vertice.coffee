class Vertice
	@colors =
		WHITE : 0
		GREY : 1
		BLACK : 2

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

