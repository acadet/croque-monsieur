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
				@testConstructor()		
				@testRemove()		

			testConstructor: () ->
				@startTest('testConstructor')

				c = new Cookie 'a', 'b'
				@assertEquals c.getVal(), Cookie.getVal 'a'

				d = new Cookie 'a'
				@assertEquals d.getVal(), c.getVal()

				@endTest()

			testRemove: () ->
				@startTest('testRemove')
				c = new Cookie 'a', 'b'
				c.remove()
				@assertUndefined Cookie.getVal 'a'
				c = new Cookie 'a', 'c'
				Cookie.remove 'a'
				@assertUndefined Cookie.getVal 'a'
				@endTest()
)