miam(
	'system/Utils'
	[]
	() =>
		###
		 # @class Utils
		 # @brief Wraps global useful methods
		 ###
		class Utils

			###
			 # Join pieces of an array using glue
			 # @param glue{String}
			 # @param pieces{Array}
			 # @return Joined array as a string
			 ###
			@implode: (glue, pieces) ->
				if not glue?
					throw new Error('You must give a glue to join pieces')
				else if not pieces? or pieces.length <= 0
					throw new Error('You should have at least one piece to implode')
				else 
					s = ''
					for i in [0..pieces.length - 1]
						if i is 0
							s += pieces[i]
						else
							s += glue + pieces[i]
					s	

			###
			 # Explode string using the given delimiter
			 # @param delimiter{String}
			 # @param string{String}
			 # @return Array with elements from given string
			 ###
			@explode: (delimiter, string) ->
				if not delimiter?
					throw new Error('You must give a delimiter to explode your string')
				else if not string? or string.length <= 0
					throw new Error('You must give a non empty string')
				else
					a = []
					tmp = ''
					for i in [0..string.length - 1]
						if string[i] is delimiter
							a.push tmp
							tmp = ''
						else 
							tmp += string[i]

					a.push tmp
					a

)