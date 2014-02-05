miam(
	'tests/TestCroqueTrigger'
	[
		'system/CroqueTrigger'
		'system/TestUnit'
	]
	() =>
		class TestCroqueTrigger extends TestUnit
			constructor: () ->
				super TestUnit.outputs.HTML

				new CroqueTrigger()

			clicked: ($element) ->
				alert "You've clicked me!"
)