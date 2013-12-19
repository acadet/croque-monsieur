miam(
	'system/ImgLazyLoad'
	[
		'system/Tag'
	]
	() =>
		class ImgLazyLoad
			constructor: (c) ->
				if not c? then c = 'lazy-img'

				@class = c
				@setImgsFromDiv()

				$(window).resize () =>
					@refreshSrcs()

			setImgsFromDiv: () ->
				$(document).find('div.' + @class).each () =>
					t = new Tag 'img.' + @class
					if Environment.getWidth() < 500
						t.setAttr 'src', $(this).attr('data-img-small')
					else if Environment.getWidth < 1000
						t.setAttr 'src', $(this).attr('data-img-medium')
					else
						t.setAttr 'src', $(this).attr('data-img-large')

					t.setAttr 'alt', $(this).attr('data-img-alt')
					$(this).before(t.toString())
					$(this).remove()

			changeOnly: ($o, key, value) ->
				if $o.attr(key) is not value
					$o.attr key, value

			refreshSrcs: () ->
				$(document).find('img.' + @class).each () =>
					if Environment.getWidth < 500
						@changeOnly $(this), 'src', $(this).attr('data-img-small')
					else if Environment.getWidth < 1000
						@changeOnly $(this), 'src', $(this).attr('data-img-medium')
					else
						@changeOnly $(this), 'src', $(this).attr('data-img-large')

)