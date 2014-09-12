miam(
	'tests/TestQuoJs'
	[
		'quoJS'
	]
	() =>
		class TestQuoJs
			constructor: () ->
				$$(document).on 'touch', () =>
					alert 'hello!'
)