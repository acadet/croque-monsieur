miam(
	'system/ajax/PostRequest'
	[
		'system/ajax/AjaxRequest'
	]
	() =>
		###
		 # @class PostRequest
		 # @brief A POST request
		 ###
		class PostRequest extends AjaxRequest
			constructor: (url) ->
				super url
				@setType 'POST'
				@setSuccess (data, status, xhr) =>
					console.log 'POST Request sucess!'
					console.log data
				@setError (xhr, status, error) =>
					console.log 'POST Request failed!'
					console.log error
)