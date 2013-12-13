class Log
	@enabled = true
	@i: (m) ->
		if Log.enabled
			console.log '[CM INFO] ' + m
	@w: (m) ->
		if Log.enabled
			console.log '%c[CM WARNING] ' + m, 'color : red'