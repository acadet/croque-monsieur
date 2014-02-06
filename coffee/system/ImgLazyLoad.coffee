miam(
	'system/ImgLazyLoad'
	[
		'system/Tag'
	]
	() =>
		###
		 # @class ImgLazyLoad
		 # @brief Provides a lazy load for imgs. Applies only for images matching given class
		 # @description
		 # Class is given when initializing. Breakpoints are 500 and 1000 (3 zones)
		 # Developer must define divs with given class and srcs of imgs. 
		 # They will be automatically replaced
		 ###
		class ImgLazyLoad
			constructor: (c) ->
				if not c? then c = 'lazy-img'

				@class = c
				@setImgsFromDiv()

				$(window).resize () =>
					@refreshSrcs()

			###
			 # Called only once. Replace divs by imgs
			 ###
			setImgsFromDiv: () ->
				$(document).find('div.' + @class).each (i, e) =>
					t = new Tag 'img.' + @class
					if Environment.getWidth() < 500
						t.setAttr 'src', $(e).attr('data-img-small')
					else if Environment.getWidth() < 1000
						t.setAttr 'src', $(e).attr('data-img-medium')
					else
						t.setAttr 'src', $(e).attr('data-img-large')

					t.setAttr 'alt', $(e).attr('data-img-alt')
					t.setAttr 'data-img-small', $(e).attr('data-img-small')
					t.setAttr 'data-img-medium', $(e).attr('data-img-medium')
					t.setAttr 'data-img-large', $(e).attr('data-img-large')
					$(e).before(t.toString())
					$(e).remove()

			###
			 # Changes atrribute only if value is different than existing
			 ###
			changeOnly: ($o, key, value) ->
				if $o.attr(key) isnt value
					$o.attr key, value

			###
			 # Refreshes srcs on window resizing
			 ###
			refreshSrcs: () ->
				$(document).find('img.' + @class).each (i, e) =>
					if Environment.getWidth() < 500
						@changeOnly $(e), 'src', $(e).attr('data-img-small')
					else if Environment.getWidth() < 1000
						@changeOnly $(e), 'src', $(e).attr('data-img-medium')
					else
						@changeOnly $(e), 'src', $(e).attr('data-img-large')

)