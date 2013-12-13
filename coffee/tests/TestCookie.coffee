Croque.monsieur(
	'tests/TestCookie'
	[
		'system/UnitTest'
		'system/Cookie'
	]
	() =>
		class TestCookie extends UnitTest
			constructor: () ->
				super UnitTest.outputs.HTML
				@testSimpleConstructor()				

			testSimpleConstructor: () ->
				@startTest('testSimpleConstructor')

				c = new Cookie 'a', 'b'
				@assertThat c.getVal(), Cookie.getVal 'a'

				@endTest()
)