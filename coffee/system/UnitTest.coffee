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

			assertThat: (e1, e2) ->
				@done++
				
				if not e1?
					@appendLog 'Fail: first arg does not exist'
					return false

				if not e2?
					@appendLog 'Fail: second arg does not exist'
					return false

				if e1 is e2
					@ok++
					@appendLog 'Success: ' + e1
					return true
				else
					@appendLog 'Fail: expected ' + e1 + ' instead of ' + e2 
					return false

			startTest: (name) ->
				@log = ['Running ' + name]

			endTest: () ->
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