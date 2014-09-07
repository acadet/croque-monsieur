miam(
	'system/collections/Stack'
	[]
	() =>
		class Stack

			class StackElement
				#region Constructors

				constructor: (content) ->
					@prev = null
					@content = content
				
				#endregion Constructors
				
				#region Private
				
				#endregion Private
				
				#region Public

				hasPrev: () ->
					@prev?

				getPrev: () ->
					@prev

				setPrev: (e) ->
					@prev = e

				getContent: () ->
					@content
				
				#endregion Public

			#region Constructors

			constructor: () ->
				@queue = null
				@size = 0
			
			#endregion Constructors
			
			#region Private
			
			#endregion Private
			
			#region Public

			top: () ->
				if @queue?
					return @queue.getContent()
				else
					return null

			pop: () ->
				if @queue?
					e = @queue
					@queue = e.getPrev()
					@size--
					return e.getContent()
				else
					return null

			push: (obj) ->
				e = new StackElement obj
				@size++

				if not @queue?
					@queue = e
					return

				e.setPrev @queue
				@queue = e

			getSize: () ->
				@size
			
			#endregion Public
)