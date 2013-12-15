miam(
	'ajax/AjaxRequest'
	[]
	() =>
		class AjaxRequest
			constructor: (url) ->
				@url = url
				@type = 'GET'
				@dataType = 'json'
				@success = (data, status, xhr) =>
					console.log 'AjaxRequest success!'
					console.log data
				@error = (xhr, status, error) =>
					console.log 'AjaxRequest failed!'
					console.log error

			setType: (type) ->
				@type = type
				this

			setData: (data) ->
				@data = data
				this

			setDataType: (type) ->
				@dataType = type
				this

			setSuccess: (f) ->
				@success = f

			setError: (f) ->
				@error = f	

			execute: () ->
				$.ajax(
					type : @type
					url : @url
					dataType : @dataType
					success : @success
					error : @error
				)
)