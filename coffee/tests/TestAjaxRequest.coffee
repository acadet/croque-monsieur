miam(
	'test/TestAjaxRequest'
	[
		'system/UnitTest'
		'ajax/AjaxRequest'
	]
	() =>
		class TestAjaxRequest extends UnitTest
			constructor: () ->
				@testSimpleRequest()

			testSimpleRequest: () ->
				@startTest 'testSimpleRequest'

				@endTest()
)