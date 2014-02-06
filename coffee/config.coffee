###
 # @file config.coffee
 # @author Adrien Cadet <acadet@live.fr>
 # @brief This file wraps config of CM. More details on official website
 ###

CROQUE_CONFIG =
	###
	 # You can disable cache when developing
	 ###
	cache: false
	
	
	###
	 # Default files/libs to load
	 ###
	default : [
		'jquery'
		'modernizr'
		'system/default/Environment'
		'system/default/Log'
		'system/default/Interface'
	]
	
	
	###
	 # Exports global vars from specified files
	 # E.g.: exports $ for jQuery
	 ###
	exports:
		jquery: '$'
		quoJS : '$$'
	
	
	###
	 # Add here more config vars to require js
	 ###
	extras: {}
	
	
	###
	 # Some libs are not able to run on IE
	 # You can specify here which one(s) you
	 # want to exclude
	 ###
	IESupport: [
		'quoJS'
	]
	

	###
	 # Define here your libs (alias/path)
	 # Path must be defined from location of boot.coffee
	 ###
	libs:
		jquery : 'vendor/jquery.1.10.2'
		jqueryCookie : 'vendor/jquery-cookie.1.4.0'
		modernizr : 'vendor/modernizr.2.7.1'
		jqueryUI : 'vendor/jquery-ui.1.10.3'
		quoJS : 'vendor/quo.2.3.6'
	