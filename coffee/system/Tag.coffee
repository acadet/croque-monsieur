miam(
	'system/Tag'
	[
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
			 # For instance, a#link.myClass.anotherOne will create a A
			 # tag with link as id and myClass and anotherOne as classes
			 # @param tag{String}
			 ###
			constructor: (tag) ->
				a = Utils.explode '.', tag
				pre = Utils.explode '#', a[0]

				@tag = $('<' + pre[0] + '></' + pre[0] + '>')

				if pre.length > 1
					@setId pre[1]
				
				for i in [1..a.length - 1]
					@addClass a[i]

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
				if not $wrapper? then $wrapper = $('body')
				@tag.css
					left : ($wrapper.outerWidth() - @tag.outerWidth()) / 2

			###
			 # Centerize element vertically. Use body by default
			 # @param $wrapper{jQuery Object}
			 ###
			vertical: ($wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				@tag.css
					top : ($wrapper.outerHeight() - @tag.outerHeight()) / 2

			###
			 # Centerize element. Use body by default
			 # @param $wrapper{jQuery Object}
			 ###
			centerize: ($wrapper) ->
				@horizontal $wrapper
				@vertical $wrapper

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