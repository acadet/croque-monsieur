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
				CroqueTrigger.run()

			click: (e) ->
				Log.i "Click"

			mouseEnter: (e) ->
				Log.i "Mouse enter"

			keyPress: (e, event) ->
				Log.i event.which

			hold: (e) ->
				Log.i "Hold"


)