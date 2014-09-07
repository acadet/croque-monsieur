###
 # @class Log
 # @brief A log system
 ###
class Log
	#region Constructors
	
	#endregion Constructors
	
	#region Private

	###
	 # Level of log
	 # 0: no log
	 # 1: only errors
	 # 2: errors + info
	 # 3: all details
	 ###
	@level = 3
	
	#endregion Private
	
	#region Public

	###
	 # Prints a debug msg
	 ###
	@d: (m) ->
		if Log.level >= 3
			console.log '[CM DEBUG] ' + m

	###
	 # Prints a info msg
	 ###
	@i: (m) ->
		if Log.level >= 2
			console.log '%c[CM INFO] ' + m, 'color : blue'

	###
	 # Prints a warning msg
	 ###
	@w: (m) ->
		if Log.level >= 1
			console.log '%c[CM WARNING] ' + m, 'color : red'
			console.trace()
	
	#endregion Public