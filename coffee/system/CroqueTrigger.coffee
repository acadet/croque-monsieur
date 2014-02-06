miam(
	'system/CroqueTrigger'
	[
		'system/Utils'
		'system/ExceptionHandler'
	]
	() =>
		###
		 # @class CroqueTrigger
		 # @brief Sets trigger to specified HTML elements. See official doc for more details
		 # @description
		 # Specify events on your HTML elements and bind js callbacks to them.
		 # The trigger will automatically generate JS listeners.
		 ###
		class CroqueTrigger

			###
			 # From specified event and HTML element, returns
			 # callback to apply
			 # @param trigger Event
			 # @param element JS object
			 ###
			@getMethod: (trigger, element) ->
				if trigger.length < 2
					throw new Error 'Specified event is not supported'

				trigger = Utils.capitalize(trigger)
				try
					f = $(element).attr('data-on' + trigger)
					return f
				catch error
					Log.w 'An error has occured when trying fixing triggers'
					ExceptionHandler.handle error
				return null
				

			###
			 # Sets mouse listeners
			 ###
			@setMouseEvents: () ->
				events = [
					'click'
					'dbclick'
					'mouseEnter'
					'mouseLeave'
					'mouseMove'
					'mouseOut'
					'mouseOver'
					'mouseUp'
					'mouseDown'
				]

				for e in events
					$('*[data-on' + Utils.capitalize(e)).each (index, element) =>
						method = CroqueTrigger.getMethod e, element
						if not method? then return
						
						$(element).on e.toLowerCase(), () =>
							try
								eval 'window.Croque.getMainClass().' + method + '(element)'
							catch error
								Log.w 'An error has occurend when trying applying method'
								ExceptionHandler.handle error

				
			###
			 # Sets keyboard listeners
			 ###
			@setKeyboardEvents: () ->
				events = [
					'keyPress'
					'keyDown'
					'keyUp'
				]

				for e in events
					$('*[data-on' + Utils.capitalize(e)).each (index, element) =>
						method = CroqueTrigger.getMethod e, element
						if not method? then return
						
						$(element).on e.toLowerCase(), (event) =>
							try
								eval 'window.Croque.getMainClass().' + method + '(element, event)'
							catch error
								Log.w 'An error has occurend when trying applying method'
								ExceptionHandler.handle error

			###
			 # Sets touch listeners
			 ###
			@setTouchEvents: () ->
				events = [
					'singleTap'
					'doubleTap'
					'hold'
					'swipeUp'
					'swipeDown'
					'swipeLeft'
					'swipeRight'
				]

				quoJS = false
				f = (e, element) =>
					method = CroqueTrigger.getMethod e, element
					if not method? then return
					
					$$(element).on e, () =>
						try
							eval 'window.Croque.getMainClass().' + method + '(element)'
						catch error
							Log.w 'An error has occurend when trying applying method'
							ExceptionHandler.handle error

				for e in events
					$('*[data-on' + Utils.capitalize(e)).each (index, element) =>
						s = e
						if quoJS
							f(s, element)
						else
							require ['quoJS'], () =>
								quoJS = true
								f(s, element)

			###
			 # Runs croqueTrigger
			 ###
			@run: () ->
				CroqueTrigger.setMouseEvents()
				CroqueTrigger.setKeyboardEvents()
				CroqueTrigger.setTouchEvents()
)