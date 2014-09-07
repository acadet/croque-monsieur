miam(
	'tests/TestCroqueTrigger'
	[
		'system/CroqueTrigger'
	]
	() =>
		class TestCroqueTrigger
			constructor: () ->
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