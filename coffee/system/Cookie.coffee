Croque.monsieur(
	'system/Cookie'
	[
		'jqueryCookie'
	]
	() =>
		class Cookie
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

			@getVal: (key) ->
				$.cookie key

			getVal: () ->
				@value

			setVal: (v) ->
				@value = v
				$.cookie @key, @value

			@remove: (key) ->
				$.cookie key, null

			remove: () ->
				Cookie.remove @key
)