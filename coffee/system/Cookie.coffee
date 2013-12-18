miam(
	'system/Cookie'
	[
		'jqueryCookie'
	]
	() =>
		###
		 # @class Cookie
		 # @brief This class allows developer managing cookies
		 ###
		class Cookie
			###
			 # Constructor
			 # If only key is given, get current value of cookie
			 # @param key{String} Required param corresponding to cookie's key
			 # @param value{String} Optional Cookie's value
			 # @param expires{Integer} Optional Number of day before expiring
			 # @param path{String} Optional Path for cookie
			 ###
			constructor: (key, value, expires, path) ->
				if not key? then throw new Error "Cookie must have at least a key"
				
				if not path? then path = '/'
				if not expires? then expires = 365
				if not value?
					@key = key
					@value = $.cookie key
				else
					@key = key
					@value = value
					$.cookie key, value,
						expires: expires
						path: path

			###
			 # Static method for getting value of a cookie
			 ###
			@getVal: (key) ->
				$.cookie key

			###
			 # Get value of current cookie
			 ###
			getVal: () ->
				@value

			###
			 # Set value of current cookie
			 ###
			setVal: (v) ->
				@value = v
				$.cookie @key, @value

			###
			 # Static method for removing cookie
			 ###
			@remove: (key) ->
				$.cookie key, null

			###
			 # Remove current cookie
			 ###
			remove: () ->
				Cookie.remove @key
)