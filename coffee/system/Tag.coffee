miam(
	'system/Tag'
	[
		'system/Utils'
	]
	() =>
		class Tag
			constructor: (tag) ->
				if tag?
					a = Utils.explode '.', tag
					@tag = $('<' + a[0] + '></' + a[0] + '>')
					
					for i in [1..a.length - 1]
						@addClass a[i]
				else
					@tag = null

			addClass: (c) ->
				@tag.addClass c

			removeClass: (c) ->
				@tag.removeClass c

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

			find: (criterion) ->
				@tag = $(document).find(criterion)

			remove: () ->
				$(document).find(@tag).remove()

			toJQuery: () ->
				@tag

			toJS: () ->
				@tag.get()[0]
)