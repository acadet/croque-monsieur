miam(
	'tests/TestImgLazyLoad'
	[
		'system/TestUnit'
		'system/ImgLazyLoad'
	]
	() =>
		class TestImgLazyLoad extends TestUnit
			constructor: () ->
				super TestUnit.outputs.HTML
				ImgLazyLoad.run 'my-lazy-img'
)