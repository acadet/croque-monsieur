Croque.monsieur(
	'system/UnitTest'
	[]
	() =>
		class UnitTest
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

				if "#{e1}" is "#{e2}"
					@ok++
					@appendLog 'Success: ' + e1
					return true
				else
					@appendLog 'Fail: expected ' + e1 + ' instead of ' + e2 
					return false

			assertUndefined: (e) ->
				@done++
				if e?
					@appendLog 'Fail: expected to be undefined: ' + e
				else
					@ok++
					@appendLog 'Success'

			assertWrong: (f) ->
				@done++
				try
					f()
					@appendLog 'Fail: expected to be wrong: ' + f
				catch e
					@ok++
					@appendLog 'Success'
				

			startTest: (name) ->
				@done = 0
				@ok = 0
				@log = ['Running ' + name]

			endTest: () ->
				if @ok is 0 or @done is 0
					Log.i "UnitTest: You should launch at least one test"
					return null
				stats = 'Successes: ' + @ok + ' / Total: ' + @done
				if @output is UnitTest.outputs.CONSOLE
					for e in @log
						console.log e
					console.log stats
				else if @output is UnitTest.outputs.HTML
					s = '<h2>' + @log[0] + '</h2>'
					for i in [1..@log.length - 1]
						s += '<p>' + @log[i] + '</p>'
					s += stats
					$('body').append s
				else 
					throw new Error 'You specified a bad ouput'
				
)