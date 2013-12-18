miam(
	'system/Tag'
	[
		'system/Utils'
	]
	() =>
		class Tag
			constructor: (tag) ->
				a = Utils.explode '.', tag
				pre = Utils.explode '#', a[0]

				@tag = $('<' + pre[0] + '></' + pre[0] + '>')

				if pre.length > 1
					@setId pre[1]
				
				for i in [1..a.length - 1]
					@addClass a[i]

			addClass: (c) ->
				@tag.addClass c

			setId: (id) ->
				@tag.attr 'id', id

			setContent: (c) ->
				@tag.html c

			setDataElement: (key, value) ->
				@tag.attr 'data-' + key, value

			toString: () ->
				@tag.prop 'outerHTML'

			appendTo: (e) ->
				if not e? then e = 'body'
				$(e).append @tag

			horizontal: ($wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				@tag.css
					left : ($wrapper.outerWidth() - @tag.outerWidth()) / 2

			vertical: ($wrapper) ->
				if not $wrapper? then $wrapper = $('body')
				@tag.css
					top : ($wrapper.outerHeight() - @tag.outerHeight()) / 2

			centerize: ($wrapper) ->
				@horizontal $wrapper
				@vertical $wrapper

			toJQuery: () ->
				@tag

			toJS: () ->
				@tag.get()[0]
)