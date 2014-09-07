miam(
	'system/collections/Queue'
	[]
	() =>
		class Queue			

			class QueueElement
				#region Constructors
				
				constructor: (content) ->
					@next = null
					@content = content

				#endregion Constructors
				
				#region Private
				
				#endregion Private
				
				#region Public

				hasNext: () ->
					@next?

				getNext: () ->
					@next

				setNext: (e) ->
					@next = e

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

			top: () ->
				if @head?
					@head.getContent()
				else
					null

			pop: () ->
				if @head?
					e = @head
					@head = e.getNext()
					@size--
					return e.getContent()
				else
					return null

			push: (obj) ->
				e = new QueueElement obj
				@size++

				if not @head?
					@head = e
					return

				cursor = @head

				while cursor.hasNext()
					cursor = cursor.getNext()

				cursor.setNext e

			getSize: () ->
				@size
			
			#endregion Public
)