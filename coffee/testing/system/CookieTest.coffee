miam(
	'testing/system/CookieTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/Cookie'
	]
	() =>
		class CookieTest extends TestClass
			setUp: () ->
				@cookie = new Cookie 'foo'

			tearDown: () ->
				@cookie.remove()
				@cookie = null

			cookieConstructorTest: () ->
				# Arrange

				# Act
				cookie = new Cookie 'foobar', 'bar'
				
				# Assert
				Assert.isNotNull cookie
				Assert.areEqual 'bar', Cookie.getValue('foobar')

			cookieConstructorNoKeyTest: () ->
				# Arrange
				
				# Act
				Assert.fail () => cookie = new Cookie
				
				# Assert

			cookieValueTest: () ->
				# Arrange
				
				# Act
				@cookie.setValue 'bar'
				outcome = @cookie.getValue()
				
				# Assert
				Assert.areEqual 'bar', outcome
				Assert.areEqual 'bar', Cookie.getValue('foo')

			cookieValueStaticTest: () ->
				# Arrange
				
				# Act
				@cookie.setValue 'bar'
				outcome = Cookie.getValue 'foo'
				
				# Assert
				Assert.areEqual 'bar', outcome
				Assert.areEqual @cookie.getValue(), outcome

			cookieRemoveTest: () ->
				# Arrange
				@cookie.setValue 'bar'
				
				# Act
				@cookie.remove()
				
				# Assert
				Assert.areNotEqual 'bar', Cookie.getValue('foo')

			cookieRemoveStaticTest: () ->
				# Arrange
				@cookie.setValue 'bar'
				
				# Act
				Cookie.remove 'foo'
				
				# Assert
				Assert.areNotEqual 'bar', Cookie.getValue('foo')
)