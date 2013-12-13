Croque.monsieur(
	'tests/TestUtils'
	[
		'system/UnitTest'
		'system/Utils'
	]
	() =>
		class TestUtils extends UnitTest
			constructor: () ->
				super UnitTest.outputs.HTML

				@testImplode()
				@testExplode()
				@testImplodeExplode()

			testImplode: () ->
				@startTest 'testImplode'

				a = ['abc', 'def', 'ghi']
				s = Utils.implode ',', a

				@assertEquals s, 'abc,def,ghi'

				a = ['fish', 'chicken', 'steak']
				s = Utils.implode ' Q ', a
				@assertEquals s, 'fish Q chicken Q steak'

				@assertWrong () =>
					Utils.implode()

				@assertWrong () =>
					Utils.implode null, ['a', 'b']

				@assertWrong () =>
					Utils.implode ';', []

				@endTest()

			testExplode: () ->
				@startTest 'testExplode'

				s = 'abc;def;ghi'
				a = ['abc', 'def', 'ghi']
				@assertEquals (Utils.explode ';', s), a

				s = 'I love potatoes'
				a = ['I', 'love', 'potatoes']
				@assertEquals (Utils.explode ' ', s), a

				@assertWrong () =>
					Utils.explode()

				@assertWrong () =>
					Utils.explode null, "Bourbon"

				@assertWrong () =>
					Utils.explode ';', ""

				@endTest()

			testImplodeExplode: () ->
				@startTest 'testImplodeExplode'

				a = ['abc', 'def', 'ghi']
				@assertEquals (Utils.explode ';', (Utils.implode ';', a)), a

				@endTest()

)