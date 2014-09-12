miam(
	'system/collections/Queue'
	[]
	() =>
		###
		 # @class Queue
		 # @brief A simple queue structure
		 ###
		class Queue			

			###
			 # @class QueueElement
			 # @brief Internal class used by the queue to manage 
			 # its content
			 ###
			class QueueElement
				#region Constructors
				
				constructor: (content) ->
					@next = null
					@content = content

				#endregion Constructors
				
				#region Private
				
				#endregion Private
				
				#region Public

				###
				 # Returns true if element has a follower
				 ###
				hasNext: () ->
					@next?

				###
				 # Gets follower
				 ###
				getNext: () ->
					@next

				###
				 # Sets follower
				 ###
				setNext: (e) ->
					@next = e

				###
				 # Gets intern content
				 ###
				getContent: () ->
					@content
				
				#endregion Public

			#region Constructors

			constructor: () ->
				@head = null
				@size = 0
			
			#endregion Constructors

			#region Private
			
			#endregion Private
			
			#region Public

			###
			 # Returns oldest element but keep it in the
			 # structure
			 ###
			top: () ->
				if @head?
					@head.getContent()
				else
					null

			###
			 # Returns oldest element and removes it from 
			 # the structure
			 ###
			pop: () ->
				if @head?
					e = @head
					@head = e.getNext()
					@size--
					return e.getContent()
				else
					return null

			###
			 # Adds a new element
			 ###
			push: (obj) ->
				e = new QueueElement obj
				@size++

				if not @head?
					# Currently empty
					@head = e
					return

				cursor = @head

				while cursor.hasNext()
					cursor = cursor.getNext()

				cursor.setNext e

			###
			 # Gets current size
			 ###
			getSize: () ->
				@size
			
			#endregion Public
)