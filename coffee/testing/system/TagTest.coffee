miam(
	'testing/system/TagTest'
	[
		'system/testing/TestClass'
		'system/testing/Assert'
		'system/Tag'
	]
	() =>
		class TagTest extends TestClass
			setUp: () ->
				@tag = new Tag 'p'

			tearDown: () ->
				@tag = null

			tagConstructorTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()

			tagConstructorSingleClassTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a.foo'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()
				Assert.isTrue outcome.hasClass('foo')

			tagConstructorMultipleClassesTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a.foo.bar'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()
				Assert.isTrue outcome.hasClass('foo')
				Assert.isTrue outcome.hasClass('bar')

			tagConstructorOnlyIdTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a#foo'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()
				Assert.areEqual 'foo', outcome.attr('id')
			
			tagConstructorIdAndSingleClassTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a#foo.bar'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()
				Assert.areEqual 'foo', outcome.attr('id')
				Assert.isTrue outcome.hasClass('bar')

			tagConstructorFullTest: () ->
				# Arrange
				
				# Act
				tag = new Tag 'a#foo.bar.foobar'
				
				# Assert
				Assert.isNotNull tag
				outcome = tag.toJQuery()
				Assert.areEqual 'a', outcome.prop('tagName').toLowerCase()
				Assert.areEqual 'foo', outcome.attr('id')
				Assert.isTrue outcome.hasClass('bar')
				Assert.isTrue outcome.hasClass('foobar')

			tagAddClassTest: () ->
				# Arrange
				
				# Act
				@tag.addClass 'foo'
				@tag.addClass 'bar'
				
				# Assert
				outcome = @tag.toJQuery()
				Assert.isTrue outcome.hasClass('foo')
				Assert.isTrue outcome.hasClass('bar')

			tagSetIdTest: () ->
				# Arrange
				
				# Act
				@tag.setId 'foo'
				
				# Assert
				outcome = @tag.toJQuery()
				Assert.areEqual 'foo', outcome.attr('id')

			tagSetContentTest: () ->
				# Arrange
				
				# Act
				@tag.setContent 'foobar'
				
				# Assert
				outcome = @tag.toJQuery()
				Assert.areEqual 'foobar', outcome.html()

			tagSetAttrTest: () ->
				# Arrange
				
				# Act
				@tag.setAttr 'foo', 'bar'
				
				# Assert
				outcome = @tag.toJQuery()
				Assert.areEqual 'bar', outcome.attr('foo')

			tagSetDataElementTest: () ->
				# Arrange
				
				# Act
				@tag.setDataElement 'foo', 'bar'
				
				# Assert
				outcome = @tag.toJQuery()
				Assert.areEqual 'bar', outcome.attr('data-foo')

			tagToStringTest: () ->
				# Arrange
				@tag.setId 'foo'
				@tag.setContent 'foobar'
				
				# Act
				outcome = @tag.toString()
				
				# Assert
				Assert.areEqual '<p id="foo">foobar</p>', outcome.toLowerCase()
)