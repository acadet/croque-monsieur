miam(
	'tests/TestCookie'
	[
		'system/TestUnit'
		'system/Cookie'
	]
	() =>
		class TestCookie extends TestUnit
			constructor: () ->
				super TestUnit.outputs.HTML
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
				@assert not Cookie.getVal 'a'
				c = new Cookie 'a', 'c'
				Cookie.remove 'a'
				@assert not Cookie.getVal 'a'
				@endTest()
)