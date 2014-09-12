miam(
	'system/collections/Stack'
	[]
	() =>
		###
		 # @class Stack
		 # @brief A simple stack structure
		 ###
		class Stack

			###
			 # @class StackElement
			 # @brief Internal class used by stack to manage its content
			 ###
			class StackElement
				#region Constructors

				constructor: (content) ->
					@prev = null
					@content = content
				
				#endregion Constructors
				
				#region Private
				
				#endregion Private
				
				#region Public

				###
				 # Returns true if element is following
				 # another
				 ###
				hasPrev: () ->
					@prev?

				###
				 # Gets previous element
				 ###
				getPrev: () ->
					@prev

				###
				 # Sets previous element
				 ###
				setPrev: (e) ->
					@prev = e

				###
				 # Gets intern content
				 ###
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

			###
			 # Returns latest element in stack
			 # but keeping it
			 ###
			top: () ->
				if @queue?
					return @queue.getContent()
				else
					return null

			###
			 # Returns latest element and removes it
			 # from the stack
			 ###
			pop: () ->
				if @queue?
					e = @queue
					@queue = e.getPrev()
					@size--
					return e.getContent()
				else
					return null

			###
			 # Adds a new element
			 ###
			push: (obj) ->
				e = new StackElement obj
				@size++

				if not @queue?
					# Empty stack
					@queue = e
					return

				e.setPrev @queue
				@queue = e

			###
			 # Gets current size
			 ###
			getSize: () ->
				@size
			
			#endregion Public
)