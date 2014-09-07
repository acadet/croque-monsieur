miam(
	'testing/system/ajax/AjaxRequestTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/ajax/AjaxRequest'
	]
	() =>
		class AjaxRequestTest extends TestClass
			setUp: () ->
				@request = new AjaxRequest('http://google.fr')

			tearDown: () ->
				@request = null

			ajaxRequestConstructorTest: () ->
				# Arrange
				
				# Act
				request = new AjaxRequest('http://google.fr')
				
				# Assert
				Assert.isNotNull request
				Assert.areEqual 'GET', request.getType()
				Assert.areEqual 'json', request.getDataType()
				Assert.isNotNull request.getSuccess()
				Assert.isNotNull request.getError()

			ajaxRequestTypeTest: () ->
				# Arrange
				
				# Act
				@request.setType 'foo'
				outcome = @request.getType()
				
				# Assert
				Assert.areEqual 'foo', outcome

			ajaxRequestDataTest: () ->
				# Arrange
				
				# Act
				@request.setData 'foo'
				outcome = @request.getData()
				
				# Assert
				Assert.areEqual 'foo', outcome

			ajaxRequestDataTypeTest: () ->
				# Arrange
				
				# Act
				@request.setDataType 'foo'
				outcome = @request.getDataType()
				
				# Assert
				Assert.areEqual 'foo', outcome

			ajaxRequestSuccessTest: () ->
				# Arrange
				expected = () =>
					alert 'hello'
				
				# Act
				@request.setSuccess expected
				outcome = @request.getSuccess()

				# Assert
				Assert.areEqual expected, outcome

			ajaxRequestErrorTest: () ->
				# Arrange
				expected = () =>
					alert 'hello'
				
				# Act
				@request.setError expected
				outcome = @request.getError()
				
				# Assert
				Assert.areEqual expected, outcome

			ajaxRequestExecuteTest: () ->
				# Arrange
				@request.setType 'GET'
				@request.setDataType 'html'
				
				# Act
				# TODO
				
				# Assert
)