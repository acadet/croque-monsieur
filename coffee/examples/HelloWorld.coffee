miam(
	'examples/HelloWorld'
	[
		'jquery'
	]
	() =>
		class HelloWorld
			constructor: ->
				$('body').append('<h2>If you can read this message, then everything is working :)</h2>')
)