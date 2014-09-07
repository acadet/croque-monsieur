miam(
	'system/Tag'
	[
		'jquery'
		'system/Utils'
	]
	() =>
		###
		 # @class Tag
		 # @brief Help developer adding quickly a tag to page
		 ###
		class Tag
			###
			 # Build a new tag. Given element could wrap classes and id.
			 # For instance, a#link.myClass.anotherOne will create a <a>
			 # tag with "link" as id and "myClass" and "anotherOne" as
			 # classes
			 # @param tag{String}
			 ###
			constructor: (tag) ->
				if not tag?
					throw new Error 'Expected a tag'

				i = 0
				firstClassMatching = true
				current = tag[i]
				buffer = ''
				while i < tag.length and current isnt '#'
					if current is '.'
						if firstClassMatching
							firstClassMatching = false
							@tag = $('<' + buffer + '>')
						else
							@addClass buffer
						buffer = ''
					else
						buffer += current
					i++
					if i isnt tag.length then current = tag[i]

				if i is tag.length 
					if firstClassMatching
						@tag = $('<' + buffer + '>')
						return
					else
						@addClass buffer
						return

				@tag = $('<' + buffer + '>')
				buffer = ''
				i++
				current = tag[i]
				while i < tag.length and current isnt '.'
					buffer += current
					i++
					if i isnt tag.length then current = tag[i]

				@setId buffer
				if i is tag.length
					return

				i++
				buffer = ''
				current = tag[i]
				while i < tag.length
					if current is '.'
						@addClass buffer
						buffer = ''
					else
						buffer += current
					i++
					if i isnt tag.length then current = tag[i]

				@addClass buffer

			###
			 # Add class to current tag
			 # @param c{String}
			 ###
			addClass: (c) ->
				@tag.addClass c

			###
			 # Set id to current tag
			 # @param id{String}
			 ###
			setId: (id) ->
				@tag.attr 'id', id

			###
			 # Set content to current tag
			 # @param c{String}
			 ###
			setContent: (c) ->
				@tag.html c

			###
			 # Set attribute to current tag
			 # @param key{String}
			 # @param value{String}
			 ###
			setAttr: (key, value) ->
				@tag.attr key, value

			###
			 # Set a data element
			 # @param key{String}
			 # @param value{String}
			 ###
			setDataElement: (key, value) ->
				@tag.attr 'data-' + key, value

			###
			 # Get current tag as a string (with full elements)
			 ###
			toString: () ->
				@tag.prop 'outerHTML'

			###
			 # Append tag to given element. Using body by default
			 # @param e{String}
			 ###
			appendTo: (e) ->
				if not e? then e = 'body'
				$(e).append @tag

			###
			 # Centerize element horizontally. Use body by default
			 # @param $wrapper{jQuery Object}
			 ###
			horizontal: ($wrapper) ->
				Tag.horizontal @tag, $wrapper

			@horizontal: ($element, $wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				$element.css
					left : ($wrapper.outerWidth() - $element.outerWidth()) / 2

			###
			 # Centerize element vertically. Use body by default
			 # @param $wrapper{jQuery Object}
			 ###
			vertical: ($wrapper) ->
				Tag.vertical @tag, $wrapper

			@vertical: ($element, $wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				$element.css
					top : ($wrapper.outerHeight() - $element.outerHeight()) / 2

			###
			 # Centerize element. Use body by default
			 # @param $wrapper{jQuery Object}
			 ###
			centerize: ($wrapper) ->
				@horizontal $wrapper
				@vertical $wrapper

			@centerize: ($element, $wrapper) ->
				Tag.horizontal $element, $wrapper
				Tag.vertical $element, $wrapper

			###
			 # Cast tag to jquery object
			 ###
			toJQuery: () ->
				@tag

			###
			 # Cast tag to JS object
			 ###
			toJS: () ->
				@tag.get()[0]
)