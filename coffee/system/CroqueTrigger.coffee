miam(
	'system/CroqueTrigger'
	[
		'jquery'
		'system/Utils'
	]
	() =>
		###
		 # @class CroqueTrigger
		 # @brief Sets triggers to specified HTML elements. See official doc for more details
		 # @description
		 # Specify events on your HTML elements and bind js callbacks to them.
		 # The trigger will automatically generate JS listeners.
		 ###
		class CroqueTrigger
			#region Constructors
			
			#endregion Constructors
			
			#region Private

			###
			 # From specified event and HTML element, returns
			 # callback to apply
			 # @param trigger Event
			 # @param element JS object
			 ###
			@_getMethod: (trigger, element) ->
				if trigger.length < 2
					throw new Error 'Specified event is not supported'

				return $(element).attr('data-on' + Utils.capitalize(trigger))

			@_bindTriggers: (events) ->
				for e in events
					$('*[data-on' + Utils.capitalize(e)).each (index, element) =>
						method = CroqueTrigger._getMethod e, element
						if not method? then return
						
						$(element).on e.toLowerCase(), (event) =>
							try
								eval 'window.Croque.getMainClass().' + method + '(element, event)'
							catch error
								Log.w 'An error has occurend when trying to apply method'
								console.error error

			###
			 # Sets mouse listeners
			 ###
			@_setMouseEvents: () ->
				events = [
					'click'
					'dbClick'
					'mouseEnter'
					'mouseLeave'
					'mouseMove'
					'mouseOut'
					'mouseOver'
					'mouseUp'
					'mouseDown'
				]

				CroqueTrigger._bindTriggers events
				
			###
			 # Sets keyboard listeners
			 ###
			@_setKeyboardEvents: () ->
				events = [
					'keyPress'
					'keyDown'
					'keyUp'
				]

				CroqueTrigger._bindTriggers events
			
			#endregion Private
			
			#region Public

			###
			 # Runs croqueTrigger
			 ###
			@run: () ->
				CroqueTrigger._setMouseEvents()
				CroqueTrigger._setKeyboardEvents()
			
			#endregion Public
)