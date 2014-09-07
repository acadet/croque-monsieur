miam(
	'tests/TestImgLazyLoad'
	[
		'system/ImgLazyLoad'
	]
	() =>
		class TestImgLazyLoad
			constructor: () ->
				ImgLazyLoad.run 'my-lazy-img'
)