miam(
	'system/ImgLazyLoad'
	[
		'system/Tag'
	]
	() =>
		###
		 # @defaultClass ImgLazyLoad
		 # @brief Provides a lazy load for imgs. Applies only for images matching given class
		 # @description
		 # Class is given when lauching. Breakpoints are 500 and 1000 (3 zones)
		 # Developer must define divs with given class and srcs of imgs. 
		 # They will be automatically replaced
		 ###
		class ImgLazyLoad
			@defaultClass = 'lazy-img'

			###
			 # Runs img lazy loader
			 ###
			@run: (customClass) ->
				if customClass?
					ImgLazyLoad.defaultClass = customClass
				
				ImgLazyLoad.setImgsFromDiv()

				$(window).resize () =>
					ImgLazyLoad.refreshSrcs()

			###
			 # Called only once. Replace divs by imgs
			 ###
			@setImgsFromDiv: () ->
				$(document).find('div.' + @defaultClass).each (i, e) =>
					t = new Tag 'img.' + @defaultClass
					
					if Environment.getWidth() < 500
						t.setAttr 'src', $(e).attr('data-img-small')
					else if Environment.getWidth() < 1000
						t.setAttr 'src', $(e).attr('data-img-medium')
					else
						t.setAttr 'src', $(e).attr('data-img-large')

					# Set attr of new image
					t.setAttr 'alt', $(e).attr('data-img-alt')
					t.setAttr 'data-img-small', $(e).attr('data-img-small')
					t.setAttr 'data-img-medium', $(e).attr('data-img-medium')
					t.setAttr 'data-img-large', $(e).attr('data-img-large')
					
					# Remove old div and add new img
					$(e).before(t.toString())
					$(e).remove()

			###
			 # Changes atrribute only if value is different than existing
			 ###
			@changeOnly: ($o, key, value) ->
				if $o.attr(key) isnt value
					$o.attr key, value

			###
			 # Refreshes srcs on window resizing
			 ###
			@refreshSrcs: () ->
				$(document).find('img.' + @defaultClass).each (i, e) =>
					if Environment.getWidth() < 500
						ImgLazyLoad.changeOnly $(e), 'src', $(e).attr('data-img-small')
					else if Environment.getWidth() < 1000
						ImgLazyLoad.changeOnly $(e), 'src', $(e).attr('data-img-medium')
					else
						ImgLazyLoad.changeOnly $(e), 'src', $(e).attr('data-img-large')

)