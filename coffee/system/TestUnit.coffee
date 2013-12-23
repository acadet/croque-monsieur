miam(
	'system/TestUnit'
	[]
	() =>
		###
		 # @class TestUnit
		 # @brief Make tests easier. Wrap multiple functions such as assert, log...
		 # @description To use this class, create your one inheriting from this one.
		 # Then start each of your test by startTest() and end it by endTest() to get
		 # a trace of what you have run
		 ###
		class TestUnit
			###
			 # Static attribute. Developer can choose output
			 ###
			@outputs = 
				CONSOLE : 1
				HTML : 2

			###
			 # Init a new test unit. User can choose an ouput
			 ###
			constructor: (output) ->
				@done = 0
				@ok = 0
				@log = []
				if output?
					@output = output
				else @output = TestUnit.outputs.CONSOLE

			###
			 # Append message to current log
			 # @param msg{String}
			 ###
			appendToLog: (msg) ->
				@log.push @done + '- ' + msg

			###
			 # Assert that given elements are equals
			 # Answer is added to log
			 # @param e1{Object}
			 # @param e2{Object}
			 ###
			assertEquals: (e1, e2) ->
				@done++
				
				if not e1?
					@appendToLog 'Fail: first arg does not exist'
					return false

				if not e2?
					@appendToLog 'Fail: second arg does not exist'
					return false

				if "#{e1}" is "#{e2}" or e1 is e2
					@ok++
					@appendToLog 'Success: ' + e1
					return true
				else
					@appendToLog 'Fail: expected ' + e1 + ' instead of ' + e2 
					return false

			###
			 # Assert that function will throw an en error
			 # @param f{Function}
			 ###
			assertWrong: (f) ->
				@done++
				try
					f()
					@appendToLog 'Fail: expected to be wrong: ' + f
				catch e
					@ok++
					@appendToLog 'Success: ' + e.message

			###
			 # Assert element is defined
			 # @param e{Object}
			 ###
			assert: (e) ->
				@done++
				if e?
					@ok++
					@appendToLog 'Success'
				else
					@appendToLog 'Fail: expected to be defined: ' + e
				
			###
			 # Start test. Create a new log and reset counters
			 # @param name{String} Name of test
			 ###
			startTest: (name) ->
				@done = 0
				@ok = 0
				@log = ['Running ' + name]

			###
			 # End testing. Display result in selected output
			 ###
			endTest: () ->
				if @done is 0
					Log.i "TestUnit: You should launch at least one test"
					return
				
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