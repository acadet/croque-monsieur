miam(
	'system/ajax/AjaxRequest'
	[]
	() =>
		class AjaxRequest
			#region Constructors
			
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

			#endregion Constructors
			
			#region Private
			
			#endregion Private
			
			#region Public

			getType: () ->
				@type

			setType: (type) ->
				@type = type

			getData: () ->
				@data

			setData: (data) ->
				@data = data

			getDataType: () ->
				@dataType

			setDataType: (type) ->
				@dataType = type

			getSuccess: () ->
				@success

			setSuccess: (f) ->
				@success = f

			getError: () ->
				@error

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
			
			#endregion Public
)