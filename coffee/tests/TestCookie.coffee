Croque.monsieur(
	'tests/TestCookie'
	[
		'system/UnitTest'
		'system/Cookie'
	]
	() =>
		class TestCookie extends UnitTest
			constructor: () ->
				super
				@testSimpleConstructor()
				$('body').append @getLog()

			testSimpleConstructor: () ->
				c = new Cookie 'a', 'b'
				@assertThat c.getVal(), Cookie.getVal 'a'
)