miam(
	'system/testing/Assert'
	[]
	() =>
		class Assert
			#region Constructors
			
			#endregion Constructors
			
			#region Private
			
			#endregion Private
			
			#region Public

			@isTrue: (bool) ->
				if not bool
					throw new Error "Expected #{ bool } to be true"

			@isFalse: (bool) ->
				if bool
					throw new Error "Expected #{ bool } to be false"

			@isNull: (value) ->
				if value isnt null
					throw new Error "Expected #{ value } to be null"

			@isNotNull: (value) ->
				if value is null
					throw new Error "Expected #{ value } to be not null"

			@isUndefined: (value) ->
				if value isnot undefined
					throw new Error "Expected #{ value } to be undefined"

			@isNotUndefined: (value) ->
				if value is undefined
					throw new Error "Expected #{ value } to be defined"

			@areEqual: (expected, value) ->
				if expected isnt value
					throw new Error "Expected #{ value } to be equal to #{ expected }"

			@areNotEqual: (notExpected, value) ->
				if notExpected is value
					throw new Error "Expected #{ value } to be different from #{ notExpected }"

			@fail: (func) ->
				try
					func()
					throw new Error "Expected #{ func } to throw an exception"
				catch e				
			
			#endregion Public
)