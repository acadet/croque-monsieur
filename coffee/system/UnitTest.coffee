Croque.monsieur(
	'system/UnitTest'
	[]
	() =>
		class UnitTest
			constructor: () ->
				@done = 0
				@ok = 0

			assertThat: (e1, e2) ->
				@done++
				if e1 is e2
					@ok++
					true
				else
					false

			getLog: () ->
				s = '<p>Unit Test:</p>'
				s += '<p>Tests done: ' + @done + '</p>'
				s += '<p>Tests passed: ' + @ok + '</p>'
				s
)