miam(
	'system/testing/TestClass'
	[
		'jquery'
	]
	() =>
		class TestClass
			#region Constructors

			constructor: () ->
				if not TestClass._collected?
					TestClass._collected = new Array

				TestClass._collected.push @
			
			#endregion Constructors
			
			#region Private

			@_shuffleArray: (a) ->
				for value, index in a
					i = parseInt(Math.round(Math.random() * (a.length - 1)))
					tmp = a[i]
					a[i] = value
					a[index] = tmp

			@_runTest: (testClass, className, method, methodName) ->
				TestClass._total++
				start = new Date().getTime()
				try
					testClass.setUp()
					method.call(testClass)
					TestClass._success++
					time = (new Date().getTime()) - start
					TestClass._totalTime += time
					o = 
						name: className
						method: methodName
						time: time
					TestClass._passedTests.push o
				catch e
					console.error e.message
					console.error e.stack
					o = 
						name: className
						method: methodName
						error: e
					TestClass._failedTests.push o
				finally
					testClass.tearDown()

			@_sortTest: (a, b) ->
				if a.name is b.name 
					if a.method > b.method
						return 1
					if a.method < b.method
						return - 1
					return 0
				if a.name > b.name
					return 1
				return -1

			#endregion Private
			
			#region Public

			@run: () ->
				if not TestClass._collected
					return

				TestClass._success = 0
				TestClass._total = 0
				TestClass._failedTests = new Array
				TestClass._passedTests = new Array
				TestClass._totalTime = 0

				TestClass._shuffleArray(TestClass._collected)

				for obj in TestClass._collected
					for name, property of obj
						if typeof(property) is 'function'
							if name.length > 5
								suffix = name.substring(name.length - 4, name.length).toLowerCase()
								if suffix is "test"
									TestClass._runTest obj, obj.constructor.name, property, name

				$('body').append('<h1>Unit testing sum up</h1>')
				sumUp = "<p class=\"sum-up\">Total tests: <span class=\"total\">#{ TestClass._total }</span>.
					Passed tests: <span class=\"success\">#{ TestClass._success }</span>.
					Failed tests: <span class=\"fail\">#{ TestClass._total - TestClass._success }</span>.
					</p>
				"
				$('body').append sumUp

				if TestClass._success isnt TestClass._total
					$('body').append('<h2>Failed tests</h2>')
					TestClass._failedTests.sort TestClass._sortTest
					currentClass = TestClass._failedTests[0].name
					output = "<ul class=\"errors\"><li>#{ currentClass }<ul>"					
					for e in TestClass._failedTests
						if e.name isnt currentClass
							output += "</ul></li>"
							currentClass = e.name
							output += "<li>#{ currentClass }<ul>"
						output += "<li>#{ e.method }: <pre>#{ e.error.stack }</pre>"

					output += "</ul></li></ul>"
					$('body').append output

				if TestClass._success is 0
					return

				TestClass._passedTests.sort TestClass._sortTest
				$('body').append('<h2>Passed tests</h2>')
				if TestClass._totalTime < 1
					$('body').append("<p>Total: less than 1ms</p>")
				else
					$('body').append("<p>Total: #{ TestClass._totalTime }ms</p>")
				currentClass = TestClass._passedTests[0].name
				output = "<ul class=\"passing\"><li>#{ currentClass }<ul>"
				for e in TestClass._passedTests
					if e.name isnt currentClass
						output += "</ul></li>"
						currentClass = e.name
						output += "<li>#{ currentClass }<ul>"
					output += "<li>#{ e.method } — "
					if e.time < 1
						output += "less than 1"
					else 
						output += "#{ e.time }"
					output += "ms</li>"

				output += "</ul></li></ul>"
				$('body').append output


			setUp: () ->
				return

			tearDown: () ->
				return
			
			#endregion Public
)