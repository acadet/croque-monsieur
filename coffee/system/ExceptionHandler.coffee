miam(
	'system/ExceptionHandler'
	[]
	() =>
		class ExceptionHandler

			@handle: (error) ->
				Log.w error.message
				Log.w error.stack
)