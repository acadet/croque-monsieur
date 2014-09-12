miam(
	'testing/system/collections/QueueTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/collections/Queue'
	]
	() =>
		class QueueTest extends TestClass

			setUp: () ->
				@queue = new Queue

			tearDown: () ->
				@queue = null
				
			queueConstructorTest: () ->
				# Arrange

				# Act
				queue = new Queue

				# Assert
				Assert.isNotNull queue
				Assert.isNull queue.top()
				Assert.areEqual 0, queue.getSize()

			queueTopTest: () ->
				# Arrange
				@queue.push 'foo'
				@queue.push 'bar'

				# Act
				outcome = @queue.top()

				# Assert
				Assert.areEqual 'foo', outcome
				Assert.areEqual 2, @queue.getSize()

			queueTopEmptyTest: () ->
				# Arrange
			
				# Act
				outcome = @queue.top()
			
				# Assert
				Assert.isNull outcome

			queuePopTest: () ->
				# Arrange
				@queue.push 'foo'
				@queue.push 'bar'
			
				# Act
				outcome = @queue.pop()
			
				# Assert
				Assert.areEqual 'foo', outcome
				Assert.areEqual 1, @queue.getSize()

			queuePopEmptyTest: () ->
				# Arrange
				
				# Act
				outcome = @queue.pop()
				
				# Assert
				Assert.isNull outcome
				Assert.areEqual 0, @queue.getSize()

			queuePopSingleElementTest: () ->
				# Arrange
				@queue.push 'foo'
				
				# Act
				outcome = @queue.pop()
				
				# Assert
				Assert.areEqual 'foo', outcome
				Assert.areEqual 0, @queue.getSize()

			queuePushTest: () ->
				# Arrange
				@queue.push 'foo'
				
				# Act
				@queue.push 'bar'
				
				# Assert
				Assert.areEqual 'foo', @queue.top()
				Assert.areEqual 2, @queue.getSize()

				@queue.pop()
				Assert.areEqual 'bar', @queue.top()

			queuePushSingleElementTest: () ->
				# Arrange
				
				# Act
				@queue.push 'foo'
				
				# Assert
				Assert.areEqual 'foo', @queue.top()
				Assert.areEqual 1, @queue.getSize()

			queueGetSizeTest: () ->
				# Arrange
				@queue.push 'foo'
				@queue.push 'bar'
				
				# Act
				outcome = @queue.getSize()
				
				# Assert
				Assert.areEqual 2, outcome

			queueGetSizeEmptyTest: () ->
				# Arrange
				
				# Act
				outcome = @queue.getSize()
				
				# Assert
				Assert.areEqual 0, outcome
)