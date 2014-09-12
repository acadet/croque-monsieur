miam('testing/TestLauncher', ['testing/system/collections/QueueTest', 'testing/system/collections/StackTest', 'testing/system/CookieTest', 'testing/system/TagTest', 'testing/system/UtilsTest'], (function(_this) {
  return function() {
    var TestLauncher;
    return TestLauncher = (function() {
      function TestLauncher() {
        new QueueTest();
        new StackTest();
        new CookieTest();
        new TagTest();
        new UtilsTest();
        TestClass.run();
      }

      return TestLauncher;

    })();
  };
})(this));
