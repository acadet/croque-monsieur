miam(
	'tests/TestQuoJs'
	[
		'system/TestUnit'
		'quoJS'
	]
	() =>
		class TestQuoJs extends TestUnit
			constructor: () ->
				$$(document).on 'touch', () =>
					console.log 'coucou'
					alert 'hello!'
)