miam(
	'system/ImgLazyLoad'
	[
		'jquery'
		'system/Tag'
	]
	() =>
		###
		 # @defaultClass ImgLazyLoad
		 # @brief Provides a lazy loader for imgs. Applies only for images matching given class
		 # @description
		 # Class is given when lauching. Breakpoints are 500 and 1000 (3 zones)
		 # Developer must define divs with given class and srcs of imgs. 
		 # They will be automatically replaced
		 ###
		class ImgLazyLoad
			#region Constructors
			
			#endregion Constructors
			
			#region Private

			###
			 # Shows target only if not already displayed
			 ###
			@_show: (target) ->
				if target.css('display') is 'none'
					target.css 'display', 'inherit'

			###
			 # Hides target only if not already hidden
			 ###
			@_hide: (target) ->
				if target.css('display') isnt 'none'
					target.css 'display', 'none'

			###
			 # Inits loader. Creates images for each supported size
			 ###
			@_init: () ->
				$(document).find('div.' + ImgLazyLoad._targetClass).each (i, e) =>
					small = new Tag 'img.small-lazy-img.' + ImgLazyLoad._targetClass
					medium = new Tag 'img.medium-lazy-img.' + ImgLazyLoad._targetClass
					large = new Tag 'img.large-lazy-img.' + ImgLazyLoad._targetClass

					small.setAttr 'src', $(e).attr('data-small-img')
					medium.setAttr 'src', $(e).attr('data-medium-img')
					large.setAttr 'src', $(e).attr('data-large-img')

					# Remove original trigger
					$(e).before(small.toString())
					$(e).before(medium.toString())
					$(e).before(large.toString())
					$(e).remove()

				ImgLazyLoad._engine()

			###
			 # Engines which image to display
			 ###
			@_engine: () ->
				$(document).find('img.' + ImgLazyLoad._targetClass).each (i, e) =>
					if $(e).hasClass 'small-lazy-img'
						if Environment.getWidth() < 500
							ImgLazyLoad._show $(e)
						else
							ImgLazyLoad._hide $(e)
					else if $(e).hasClass 'medium-lazy-img'
						if 500 <= Environment.getWidth() < 1000
							ImgLazyLoad._show $(e)
						else
							ImgLazyLoad._hide $(e)
					else
						if Environment.getWidth() >= 1000
							ImgLazyLoad._show $(e)
						else
							ImgLazyLoad._hide $(e)
			
			#endregion Private
			
			#region Public

			###
			 # Runs img lazy loader
			 ###
			@run: (customTargetClass) ->
				ImgLazyLoad._targetClass = if customTargetClass? then customTargetClass else 'lazy-img'
				
				ImgLazyLoad._init()

				$(window).resize () =>
					ImgLazyLoad._engine()
			
			#endregion Public

)