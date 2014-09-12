miam(
	'system/Tag'
	[
		'jquery'
		'system/Utils'
	]
	() =>
		###
		 # @class Tag
		 # @brief Makes appending a HTML tag to page easier
		 ###
		class Tag
			#region Constructors

			###
			 # Builds a new tag. Given element could wrap classes and id.
			 # For instance, a#link.myClass.anotherOne will create a <a>
			 # tag with "link" as id and "myClass" and "anotherOne" as
			 # classes.
			 # Id and classes are optional
			 # @param tag{String}
			 ###
			constructor: (tag) ->
				if not tag?
					throw new Error 'Expected a tag'

				# Following algorithm browse only once
				# provided string

				i = 0
				firstClassMatching = true
				current = tag[i]
				buffer = ''
				# First, collect prefix until finding an id
				while i < tag.length and current isnt '#'
					if current is '.'
						# A class was found. That means there is
						# no id
						if firstClassMatching
							# First class matching.
							# Needs to create tag base
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
					# No id was found
					if firstClassMatching
						# Only a tag, no id and classes
						@tag = $('<' + buffer + '>')
						return
					else
						# Add pending class
						@addClass buffer
						return

				@tag = $('<' + buffer + '>')
				buffer = ''
				i++
				current = tag[i]
				# Id has been found, now seek for classes
				while i < tag.length and current isnt '.'
					buffer += current
					i++
					if i isnt tag.length then current = tag[i]

				# First class encountered. Saves stored id
				@setId buffer
				if i is tag.length
					# No classes, only an id
					return

				i++
				buffer = ''
				current = tag[i]
				# Collect classes
				while i < tag.length
					if current is '.'
						# New class, save previous one
						@addClass buffer
						buffer = ''
					else
						buffer += current
					i++
					if i isnt tag.length then current = tag[i]

				@addClass buffer
			
			#endregion Constructors
			
			#region Private
			
			#endregion Private
			
			#region Public
			
			#endregion Public

			###
			 # Adds class to current tag
			 # @param c{String}
			 ###
			addClass: (c) ->
				@tag.addClass c

			###
			 # Sets id to current tag
			 # @param id{String}
			 ###
			setId: (id) ->
				@tag.attr 'id', id

			###
			 # Sets content to current tag
			 # @param c{String}
			 ###
			setContent: (c) ->
				@tag.html c

			###
			 # Sets attribute to current tag
			 # @param key{String}
			 # @param value{String}
			 ###
			setAttr: (key, value) ->
				@tag.attr key, value

			###
			 # Sets a data element
			 # @param key{String}
			 # @param value{String}
			 ###
			setDataElement: (key, value) ->
				@tag.attr 'data-' + key, value

			###
			 # Gets current tag as a string (with full elements)
			 ###
			toString: () ->
				@tag.prop 'outerHTML'

			###
			 # Appends tag to given element. Using body by default
			 # @param e{String}
			 ###
			appendTo: (e) ->
				if not e? then e = 'body'
				$(e).append @tag

			###
			 # Centerizes element horizontally.
			 # Wrapper is optional: uses body by default
			 # @param $wrapper{jQuery Object}
			 ###
			horizontal: ($wrapper) ->
				Tag.horizontal @tag, $wrapper

			###
			 # Centerizes provided element horizontally.
			 # Wrapper is optional: uses body by default
			 # @param $element{jQuery Object}
			 # @param $wrapper{jQuery Object}
			 ###
			@horizontal: ($element, $wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				$element.css
					left : ($wrapper.outerWidth() - $element.outerWidth()) / 2

			###
			 # Centerizes element vertically.
			 # Wrapper is optional: uses body by default
			 # @param $wrapper{jQuery Object}
			 ###
			vertical: ($wrapper) ->
				Tag.vertical @tag, $wrapper

			###
			 # Centerizes provided element vertically.
			 # Wrapper is optional: uses body by default
			 # @param $element{jQuery Object}
			 # @param $wrapper{jQuery Object}
			 ###
			@vertical: ($element, $wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				$element.css
					top : ($wrapper.outerHeight() - $element.outerHeight()) / 2

			###
			 # Centerizes element.
			 # Wrapper is optional: uses body by default
			 # @param $wrapper{jQuery Object}
			 ###
			centerize: ($wrapper) ->
				@horizontal $wrapper
				@vertical $wrapper

			###
			 # Centerizes provided element vertically.
			 # Wrapper is optional: uses body by default
			 # @param $element{jQuery Object}
			 # @param $wrapper{jQuery Object}
			 ###
			@centerize: ($element, $wrapper) ->
				Tag.horizontal $element, $wrapper
				Tag.vertical $element, $wrapper

			###
			 # Casts tag to jquery object
			 ###
			toJQuery: () ->
				@tag

			###
			 # Casts tag to JS object
			 ###
			toJS: () ->
				@tag.get()[0]
)