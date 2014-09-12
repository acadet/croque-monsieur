miam(
	'system/ajax/PutRequest'
	[
		'system/ajax/AjaxRequest'
	]
	() =>
		###
		 # @class PutRequest
		 # @brief A PUT request
		 ###
		class PutRequest extends AjaxRequest
			constructor: (url) ->
				super url
				@setType 'PUT'
				@setSuccess (data, status, xhr) =>
					console.log 'PUT Request sucess!'
					console.log data
				@setError (xhr, status, error) =>
					console.log 'PUT Request failed!'
					console.log error
)