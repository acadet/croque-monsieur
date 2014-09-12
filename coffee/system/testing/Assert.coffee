miam(
	'system/testing/Assert'
	[]
	() =>
		###
		 # @class Assert
		 # @brief Provides methods for asserting when testing
		 ###
		class Assert
			#region Constructors
			
			#endregion Constructors
			
			#region Private
			
			#endregion Private
			
			#region Public

			###
			 # Asserts provided boolean is true
			 ###
			@isTrue: (bool) ->
				if not bool
					throw new Error "Expected #{ bool } to be true"

			###
			 # Asserts provided boolean is false
			 ###
			@isFalse: (bool) ->
				if bool
					throw new Error "Expected #{ bool } to be false"

			###
			 # Asserts provided value is null
			 ###
			@isNull: (value) ->
				if value isnt null
					throw new Error "Expected #{ value } to be null"

			###
			 # Asserts provided value is not null
			 ###
			@isNotNull: (value) ->
				if value is null
					throw new Error "Expected #{ value } to be not null"

			###
			 # Asserts expected value is equal to current one
			 ###
			@areEqual: (expected, value) ->
				if expected isnt value
					throw new Error "Expected #{ value } to be equal to #{ expected }"

			###
			 # Asserts not expected value is not equal to current one
			 ###
			@areNotEqual: (notExpected, value) ->
				if notExpected is value
					throw new Error "Expected #{ value } to be different from #{ notExpected }"

			###
			 # Asserts provided method will throw an exception
			 ###
			@fail: (func) ->
				try
					func()
					throw new Error "Expected #{ func } to throw an exception"
				catch e				
			
			#endregion Public
)