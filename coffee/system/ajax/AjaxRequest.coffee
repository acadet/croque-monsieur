miam(
	'system/ajax/AjaxRequest'
	[
		'jquery'
	]
	() =>
		###
		 # @class AjaxRequest
		 # @brief A simple ajax request
		 ###
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

			###
			 # Sets type of request (POST, GET etc.)
			 ###
			setType: (type) ->
				@type = type

			###
			 # Sets optional data to send
			 ###
			setData: (data) ->
				@data = data

			###
			 # Sets type of received data
			 ###
			setDataType: (type) ->
				@dataType = type

			###
			 # Sets success callback
			 ###
			setSuccess: (f) ->
				@success = f

			###
			 # Sets error callback
			 ###
			setError: (f) ->
				@error = f

			###
			 # Runs request
			 ###
			execute: () ->
				$.ajax(
					type : @type
					url : @url
					data: @data
					dataType : @dataType
					success : @success
					error : @error
				)
			
			#endregion Public
)