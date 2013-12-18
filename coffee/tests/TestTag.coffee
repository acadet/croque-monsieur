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
				@testConstructor()
				@testClasses()
				@testId()
				@testContent()
				@testCenterize()

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

			testConstructor: () ->
				@startTest 'testConstructor'
				t = new Tag('div#gin.martini.bijou')
				@assert t.toJQuery().hasClass('martini')
				@assert t.toJQuery().hasClass('bijou')
				@assertEquals t.toJQuery().attr('id'), 'gin'

				@endTest()

			testClasses: () ->
				@startTest 'testClasses'
				t = new Tag('div')
				t.addClass 'churchill'
				t.addClass 'farnell'

				@assert t.toJQuery().hasClass('chruchill')
				@assert t.toJQuery().hasClass('farnell')
				@endTest()

			testId: () ->
				@startTest 'testId'
				t = new Tag('div')
				t.setId 'orange'
				@assertEquals t.toJQuery().attr('id'), 'orange'
				@endTest()

			testContent: () ->
				@startTest 'testContent'
				t = new Tag('div.apple')
				u = new Tag('div.pear')
				t.setContent u.toString()
				t.appendTo()

				@assert $(document).find('div.apple div.pear').html()

				@endTest()

			testCenterize: () ->
				@startTest 'testCenterize'
				t = new Tag('div')

				t.centerize()
				@assertEquals parseFloat(t.toJQuery().css('top')), ($('body').outerHeight() - t.toJQuery().outerHeight()) / 2
				@assertEquals parseFloat(t.toJQuery().css('left')), ($('body').outerWidth() - t.toJQuery().outerWidth()) / 2

				@endTest()
)