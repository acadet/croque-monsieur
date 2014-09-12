miam(
	'system/ajax/DeleteRequest'
	[
		'system/ajax/AjaxRequest'
	]
	() =>
		###
		 # @class DeleteRequest
		 # @brief A DELETE request
		 ###
		class DeleteRequest extends AjaxRequest
			constructor: (url) ->
				super url
				@setType 'DELETE'
				@setSuccess (data, status, xhr) =>
					console.log 'DELETE Request sucess!'
					console.log data
				@setError (xhr, status, error) =>
					console.log 'DELETE Request failed!'
					console.log error
)