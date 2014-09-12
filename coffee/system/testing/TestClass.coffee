miam(
	'system/testing/TestClass'
	[
		'jquery'
	]
	() =>
		###
		 # @class TestClass
		 # @brief Provides a unit test template. For more details, visit documentation
		 ###
		class TestClass
			#region Constructors

			constructor: () ->
				TestClass._collect @
			
			#endregion Constructors
			
			#region Private

			###
			 # Collects details about provided test class
			 ###
			@_collect: (obj) ->
				e =
					target : obj
					methods: new Array

				for name, property of obj
					if typeof(property) is 'function'
						if name.length > 5
							suffix = name.substring(name.length - 4, name.length).toLowerCase()
							if suffix is 'test'
								o =
									name : name
									target : property
								e.methods.push o

				if not TestClass._collected?
					TestClass._collected = new Array
				TestClass._collected.push e

			###
			 # Runs specified test
			 # @param testClass Target
			 # @param className Name of target
			 # @param method Targeted method
			 # @param methodName Name of targeted method
			 ###
			@_runTest: (testClass, className, method, methodName) ->
				TestClass._total++
				start = new Date().getTime()

				try
					testClass.setUp()
					method.call(testClass)
					testClass.tearDown()

					# End of test process
					time = (new Date().getTime()) - start
					TestClass._success++
					TestClass._totalTime += time
					o =
						name: className
						method: methodName
						time: time
					# Save in passed tests
					TestClass._passedTests.push o
				catch e
					# Ouch! An error has occured
					console.error e.message
					console.error e.stack
					o =
						name: className
						method: methodName
						error: e
					# Save in failed tests
					TestClass._failedTests.push o
					# Do not forget to tear down
					testClass.tearDown()

			###
			 # Sorts tests by class name then by method name
			 ###
			@_sortTest: (a, b) ->
				if a.name is b.name
					if a.method > b.method
						return 1
					if a.method < b.method
						return -1
					return 0
				if a.name > b.name
					return 1
				return -1

			#endregion Private
			
			#region Public

			###
			 # Runs checked in tests
			 ###
			@run: () ->
				if not TestClass._collected
					Log.w 'No tests to run'
					return

				TestClass._success = 0
				TestClass._total = 0
				TestClass._failedTests = new Array
				TestClass._passedTests = new Array
				TestClass._totalTime = 0

				# To improve environment, tests are run randomly
				Utils.shuffleArray(TestClass._collected)
				for obj in TestClass._collected
					Utils.shuffleArray(obj.methods)
					for m in obj.methods
						TestClass._runTest obj.target, obj.target.constructor.name, m.target, m.name

				# Starting building sum up
				$('body').append('<h1>Unit testing sum up</h1>')
				sumUp = "<p class=\"sum-up\">Total tests: <span class=\"total\">#{ TestClass._total }</span>.
					Passed tests: <span class=\"success\">#{ TestClass._success }</span>.
					Failed tests: <span class=\"fail\">#{ TestClass._total - TestClass._success }</span>.
					</p>
				"
				$('body').append sumUp

				if TestClass._success isnt TestClass._total
					# There are failed tests, print them
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

				# Print successful tests
				TestClass._passedTests.sort TestClass._sortTest
				$('body').append('<h2>Passed tests</h2>')

				# Print total duration
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

			###
			 # This method is called before each test.
			 # Test class can override it to be called
			 ###
			setUp: () ->
				return

			###
			 # This method is called after each test.
			 # Test class can override it to be called
			 ###
			tearDown: () ->
				return
			
			#endregion Public
)