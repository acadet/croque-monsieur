miam(
	'system/CroqueTrigger'
	[]
	() =>
		class CroqueTrigger
			constructor: () ->
				@run()

			applyMethod: (trigger, element) ->
				trigger = trigger.substr(0, 1).toUpperCase() + trigger.slice(1)
				eval 'window.Croque.getMainClass().' + $(element).attr('data-on' + trigger) + '(element)'

			run: () ->
				$('*[data-onClick]').each (index, element) =>
					$(element).on 'click', () =>
						@applyMethod 'click', $(element)

				$('*[data-onHover]').each (index, element) =>
					$(element).on 'hover', () =>
						@applyMethod 'hover', $(element)

)