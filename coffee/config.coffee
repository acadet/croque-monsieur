CROQUE_CONFIG =
	cache: true # Enable cache when developing
	default : [ # Default files to load
		'jquery'
		'modernizr'
		'system/default/Environment'
		'system/default/Log'
		'system/default/Interface'
	]
	exports: # Exports global var from specified files
		jquery: '$'
		quoJS : '$$'
	extras: {}
	# Some libs are not able to run on IE
	# You can disable them here
	IESupport: [
		'quoJS'
	]
	libs: # Global libraries
		jquery : 'vendor/jquery.1.10.2'
		jqueryCookie : 'vendor/jquery-cookie.1.4.0'
		modernizr : 'vendor/modernizr.2.7.1'
		jqueryUI : 'vendor/jquery-ui.1.10.3'
		quoJS : 'vendor/quo.2.3.6'
	