miam(
	'system/ajax/GetRequest'
	[
		'system/ajax/AjaxRequest'
	]
	() =>
		class GetRequest extends AjaxRequest
			constructor: (url) ->
				super url
				@setType 'GET'
				@setSuccess (data, status, xhr) =>
					console.log 'GET Request sucess!'
					console.log data
				@setError (xhr, status, error) =>
					console.log 'GET Request failed!'
					console.log error
)