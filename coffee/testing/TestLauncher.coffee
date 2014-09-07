miam(
	'testing/TestLauncher'
	[
		'testing/system/collections/QueueTest'
		'testing/system/collections/StackTest'
		'testing/system/CookieTest'
		'testing/system/TagTest'
		'testing/system/UtilsTest'
	]
	() =>
		class TestLauncher
			constructor: () ->
				# Collection tests
				new QueueTest()
				new StackTest()

				# System tests
				new CookieTest()
				new TagTest()
				new UtilsTest()

				TestClass.run()
)