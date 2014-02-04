###
 # @class Log
 # @brief A log system
 ###
class Log

	###
	 # Level of log
	 # 0: no log
	 # 1: only errors
	 # 2: all details
	 ###
	@level = 2

	###
	 # Prints a info msg
	 ###
	@i: (m) ->
		if Log.level >= 2
			console.log '[CM INFO] ' + m

	###
	 # Prints a warning msg
	 ###		
	@w: (m) ->
		if Log.level >= 1
			console.log '%c[CM WARNING] ' + m, 'color : red'