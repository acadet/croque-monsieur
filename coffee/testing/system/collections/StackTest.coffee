miam(
	'testing/system/collections/StackTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/collections/Stack'
	]
	() =>
		class StackTest extends TestClass
			setUp: () ->
				@stack = new Stack

			tearDown: () ->
				@stack = null

			stackConstructorTest: () ->
				# Arrange
				
				# Act
				stack = new Stack
				
				# Assert
				Assert.isNotNull stack
				Assert.areEqual 0, stack.getSize()

			stackTopTest: () ->
				# Arrange
				@stack.push 'foo'
				@stack.push 'bar'
				
				# Act
				outcome = @stack.top()
				
				# Assert
				Assert.areEqual 'bar', outcome
				Assert.areEqual 2, @stack.getSize()

			stackTopEmptyTest: () ->
				# Arrange
				
				# Act
				outcome = @stack.top()
				
				# Assert
				Assert.isNull outcome

			stackPopTest: () ->
				# Arrange
				@stack.push 'foo'
				@stack.push 'bar'
				
				# Act
				outcome = @stack.pop()
				
				# Assert
				Assert.areEqual 'bar', outcome
				Assert.areEqual 1, @stack.getSize()
				Assert.areEqual 'foo', @stack.top()

			stackPopEmptyTest: () ->
				# Arrange
				
				# Act
				outcome = @stack.pop()
				
				# Assert
				Assert.isNull outcome
				Assert.areEqual 0, @stack.getSize()

			stackPopSingleElementTest: () ->
				# Arrange
				@stack.push 'foo'
				
				# Act
				outcome = @stack.pop()
				
				# Assert
				Assert.areEqual 'foo', outcome
				Assert.areEqual 0, @stack.getSize()
				Assert.isNull @stack.top()

			stackPushTest: () ->
				# Arrange
				@stack.push 'foo'
				
				# Act
				@stack.push 'bar'
				
				# Assert
				Assert.areEqual 2, @stack.getSize()
				Assert.areEqual 'bar', @stack.top()

			stackPushEmptyTest: () ->
				# Arrange
				
				# Act
				@stack.push 'foo'
				
				# Assert
				Assert.areEqual 'foo', @stack.top()
				Assert.areEqual 1, @stack.getSize()

			stackGetSizeTest: () ->
				# Arrange
				@stack.push 'foo'
				@stack.push 'bar'
				
				# Act
				outcome = @stack.getSize()
				
				# Assert
				Assert.areEqual 2, outcome

			stackGetSizeEmptyTest: () ->
				# Arrange
				
				# Act
				outcome = @stack.getSize()
				
				# Assert
				Assert.areEqual 0, outcome
)