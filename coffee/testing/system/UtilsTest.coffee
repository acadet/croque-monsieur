miam(
	'testing/system/UtilsTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/Utils'
	]
	() =>
		class UtilsTest extends TestClass
			setUp: () ->

			tearDown: () ->

			_compareJSON: (a, b) ->
				for key, value of a
					if value isnt b[key]
						return false
				return true

			utilsImplodeTest: () ->
				# Arrange
				a = new Array
				a.push 'foo'
				a.push 'bar'
				a.push 'foobar'
				
				# Act
				outcome = Utils.implode ';', a
				
				# Assert
				Assert.isNotNull outcome
				Assert.areEqual 'foo;bar;foobar', outcome

			utilsImplodeSingleElementTest: () ->
				# Arrange
				a = new Array
				a.push 'foo'
				
				# Act
				outcome = Utils.implode ';', a
				
				# Assert
				Assert.isNotNull outcome
				Assert.areEqual 'foo', outcome

			utilsImplodeNoGlueTest: () ->
				# Arrange
				
				# Act
				Assert.fail () =>
					outcome = Utils.implode()
				
				# Assert

			utilsImplodeNoPiecesTest: () ->
				# Arrange
				
				# Act
				Assert.fail () =>
					outcome = Utils.implode ';'
				
				# Assert

			utilsExplodeTest: () ->
				# Arrange
				s = 'foo;bar;foobar'
				
				# Act
				outcome = Utils.explode ';', s
				
				# Assert
				Assert.isNotNull outcome
				Assert.areEqual 3, outcome.length
				Assert.areEqual 'foo', outcome[0]
				Assert.areEqual 'bar', outcome[1]
				Assert.areEqual 'foobar', outcome[2]

			utilsExplodeSingleElementTest: () ->
				# Arrange
				s = 'foobar'
				
				# Act
				outcome = Utils.explode '+', s
				
				# Assert
				Assert.isNotNull outcome
				Assert.areEqual 1, outcome.length
				Assert.areEqual 'foobar', outcome[0]

			utilsExplodeDelimiterAndSourceAreSameTest: () ->
				# Arrange
				s = "$$"
				
				# Act
				outcome = Utils.explode '$', s
				
				# Assert
				Assert.isNotNull outcome
				Assert.areEqual 3, outcome.length
				Assert.areEqual '', outcome[0]
				Assert.areEqual '', outcome[1]
				Assert.areEqual '', outcome[2]

			utilsExplodeNoDelimiterTest: () ->
				# Arrange
				
				# Act
				Assert.fail () =>
					outcome = Utils.explode()
				
				# Assert

			utilsExplodeNoSourceTest: () ->
				# Arrange
				
				# Act
				Assert.fail () =>
					outcome = Utils.explode ';'
				
				# Assert

			utilsConcatJSONTest: () ->
				# Arrange
				a =
					firstName: 'foo'
					city: 'San Francisco'
				b =
					lastName: 'bar'
					age: 18
				expected = 
					firstName: 'foo'
					lastName: 'bar'
					age: 18
					city: 'San Francisco'
				
				# Act
				Utils.concatJSON(a, b)
				
				# Assert
				Assert.isTrue @_compareJSON(expected, a)

			utilsConcatJSONSourceNullTest: () ->
				# Arrange
				a = 
					firstName: 'James'
					lastName: 'Bond'
				
				# Act
				Assert.fail () =>
					Utils.concatJSON null, a
				
				# Assert

			utilsConcatJSONAppendedNullTest: () ->
				# Arrange
				a = 
					firstName: 'James'
					lastName: 'Bond'
				expected =
					firstName: 'James'
					lastName: 'Bond'
				
				# Act
				Utils.concatJSON a, null
				
				# Assert
				Assert.isTrue @_compareJSON(expected, a)

			utilsCapitalizeTest: () ->
				# Arrange
				value = 'harvey'
				
				# Act
				outcome = Utils.capitalize value
				
				# Assert
				Assert.areEqual 'Harvey', outcome

			utilsCapitalizeNullTest: () ->
				# Arrange
				
				# Act
				outcome = Utils.capitalize null
				
				# Assert
				Assert.isNull outcome

			utilsCapitalizeTooShortTest: () ->
				# Arrange
				
				# Act
				Assert.fail () =>
					outcome = Utils.capitalize ''
				
				# Assert
)