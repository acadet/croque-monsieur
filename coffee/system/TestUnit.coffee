miam(
	'system/TestUnit'
	[]
	() =>
		class TestUnit
			@outputs = 
				CONSOLE : 1
				HTML : 2

			constructor: (output) ->
				@done = 0
				@ok = 0
				@log = []
				@output = output

			appendLog: (msg) ->
				@log.push @done + '- ' + msg

			assertEquals: (e1, e2) ->
				@done++
				
				if not e1?
					@appendLog 'Fail: first arg does not exist'
					return false

				if not e2?
					@appendLog 'Fail: second arg does not exist'
					return false

				if "#{e1}" is "#{e2}" or e1 is e2
					@ok++
					@appendLog 'Success: ' + e1
					return true
				else
					@appendLog 'Fail: expected ' + e1 + ' instead of ' + e2 
					return false

			assertWrong: (f) ->
				@done++
				try
					f()
					@appendLog 'Fail: expected to be wrong: ' + f
				catch e
					@ok++
					@appendLog 'Success: ' + e.message

			assert: (e) ->
				@done++
				if e?
					@ok++
					@appendLog 'Success'
				else
					@appendLog 'Fail: expected to be true: ' + e
				
			startTest: (name) ->
				@done = 0
				@ok = 0
				@log = ['Running ' + name]

			endTest: () ->
				if @done is 0
					Log.i "TestUnit: You should launch at least one test"
					return null
				stats = 'Successes: ' + @ok + ' / Total: ' + @done
				if @output is TestUnit.outputs.CONSOLE
					for e in @log
						console.log e
					console.log stats
				else if @output is TestUnit.outputs.HTML
					s = '<h2>' + @log[0] + '</h2>'
					for i in [1..@log.length - 1]
						s += '<p>' + @log[i] + '</p>'
					s += '<p style="color : '
					if @ok is @done
						s += 'green'
					else
						s += 'red'
					s += ';">' + stats + '</p>'
					$('body').append s
				else 
					throw new Error 'You specified a bad ouput'
				
)