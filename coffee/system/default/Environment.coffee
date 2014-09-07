###
 # @class Environment
 # @brief Environment management. Provides details about window or used device
 ###
class Environment

	###
	 # Returns width of window
	 ###
	@getWidth: () ->
		if self.innerWidth? then self.innerWidth
		else document.documentElement.clientWidth

	###
	 # Returns height of window
	 ###
	@getHeight: () ->
		if self.innerHeight? then self.innerHeight
		else document.documentElement.clientHeight

	###
	 # Informs if used device is a mobile one
	 ###
	@isMobile: () ->
		(/Android|webOS|iPhone|Windows Phone|iPad|iPod|BlackBerry/i.test(navigator.userAgent))