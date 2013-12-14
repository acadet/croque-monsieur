miam(
	'tests/TestTag'
	[
		'system/TestUnit'
		'system/Tag'
	]
	() =>
		class TestTag extends TestUnit
			constructor: () ->
				super TestUnit.outputs.HTML
				@testAppend()
				@testRemove()
				@testConstructor()

			testAppend: () ->
				@startTest 'testAppend'
				t = new Tag('div')

				t.appendTo()
				@assert $('body').find('div').html()
				$('body').find('div').remove()

				$('body').append('<div class="koala"></div>')
				t.appendTo 'div.koala'
				@assert $('div.koala').find('div').html()
				$('div.koala').remove()

				@endTest()

			testRemove: () ->
				@startTest 'testRemove'
				t = new Tag('div')

				t.appendTo()
				t.remove()
				@assert not $('body').find('div')

				@endTest()

			testConstructor: () ->
				@startTest 'testConstructor'
				t = new Tag('div.martini.bijou')
				@assert t.toJQuery().hasClass('martini')
				@assert t.toJQuery().hasClass('bijou')

				@endTest()

			testFind: () ->
				
)