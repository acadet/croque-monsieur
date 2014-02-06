miam(
	'system/ExceptionHandler'
	[]
	() =>
		###
		 # @class ExceptionHandler
		 # @brief Handles exceptions
		 ###
		class ExceptionHandler

			###
			 # Manages an error
			 ###
			@handle: (error) ->
				Log.w error.message
				Log.w error.stack
)