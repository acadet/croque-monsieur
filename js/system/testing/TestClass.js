miam('system/testing/TestClass', ['jquery'], (function(_this) {
  return function() {

    /*
    		  * @class TestClass
    		  * @brief Provides a unit test template. For more details, visit documentation
     */
    var TestClass;
    return TestClass = (function() {
      function TestClass() {
        TestClass._collect(this);
      }


      /*
      			  * Collects details about provided test class
       */

      TestClass._collect = function(obj) {
        var e, name, o, property, suffix;
        e = {
          target: obj,
          methods: new Array
        };
        for (name in obj) {
          property = obj[name];
          if (typeof property === 'function') {
            if (name.length > 5) {
              suffix = name.substring(name.length - 4, name.length).toLowerCase();
              if (suffix === 'test') {
                o = {
                  name: name,
                  target: property
                };
                e.methods.push(o);
              }
            }
          }
        }
        if (TestClass._collected == null) {
          TestClass._collected = new Array;
        }
        return TestClass._collected.push(e);
      };


      /*
      			  * Runs specified test
      			  * @param testClass Target
      			  * @param className Name of target
      			  * @param method Targeted method
      			  * @param methodName Name of targeted method
       */

      TestClass._runTest = function(testClass, className, method, methodName) {
        var e, o, start, time;
        TestClass._total++;
        start = new Date().getTime();
        try {
          testClass.setUp();
          method.call(testClass);
          testClass.tearDown();
          time = (new Date().getTime()) - start;
          TestClass._success++;
          TestClass._totalTime += time;
          o = {
            name: className,
            method: methodName,
            time: time
          };
          return TestClass._passedTests.push(o);
        } catch (_error) {
          e = _error;
          console.error(e.message);
          console.error(e.stack);
          o = {
            name: className,
            method: methodName,
            error: e
          };
          TestClass._failedTests.push(o);
          return testClass.tearDown();
        }
      };


      /*
      			  * Sorts tests by class name then by method name
       */

      TestClass._sortTest = function(a, b) {
        if (a.name === b.name) {
          if (a.method > b.method) {
            return 1;
          }
          if (a.method < b.method) {
            return -1;
          }
          return 0;
        }
        if (a.name > b.name) {
          return 1;
        }
        return -1;
      };


      /*
      			  * Runs checked in tests
       */

      TestClass.run = function() {
        var currentClass, e, m, obj, output, sumUp, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3;
        if (!TestClass._collected) {
          Log.w('No tests to run');
          return;
        }
        TestClass._success = 0;
        TestClass._total = 0;
        TestClass._failedTests = new Array;
        TestClass._passedTests = new Array;
        TestClass._totalTime = 0;
        Utils.shuffleArray(TestClass._collected);
        _ref = TestClass._collected;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          obj = _ref[_i];
          Utils.shuffleArray(obj.methods);
          _ref1 = obj.methods;
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            m = _ref1[_j];
            TestClass._runTest(obj.target, obj.target.constructor.name, m.target, m.name);
          }
        }
        $('body').append('<h1>Unit testing sum up</h1>');
        sumUp = "<p class=\"sum-up\">Total tests: <span class=\"total\">" + TestClass._total + "</span>. Passed tests: <span class=\"success\">" + TestClass._success + "</span>. Failed tests: <span class=\"fail\">" + (TestClass._total - TestClass._success) + "</span>. </p>";
        $('body').append(sumUp);
        if (TestClass._success !== TestClass._total) {
          $('body').append('<h2>Failed tests</h2>');
          TestClass._failedTests.sort(TestClass._sortTest);
          currentClass = TestClass._failedTests[0].name;
          output = "<ul class=\"errors\"><li>" + currentClass + "<ul>";
          _ref2 = TestClass._failedTests;
          for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
            e = _ref2[_k];
            if (e.name !== currentClass) {
              output += "</ul></li>";
              currentClass = e.name;
              output += "<li>" + currentClass + "<ul>";
            }
            output += "<li>" + e.method + ": <pre>" + e.error.stack + "</pre>";
          }
          output += "</ul></li></ul>";
          $('body').append(output);
        }
        if (TestClass._success === 0) {
          return;
        }
        TestClass._passedTests.sort(TestClass._sortTest);
        $('body').append('<h2>Passed tests</h2>');
        if (TestClass._totalTime < 1) {
          $('body').append("<p>Total: less than 1ms</p>");
        } else {
          $('body').append("<p>Total: " + TestClass._totalTime + "ms</p>");
        }
        currentClass = TestClass._passedTests[0].name;
        output = "<ul class=\"passing\"><li>" + currentClass + "<ul>";
        _ref3 = TestClass._passedTests;
        for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
          e = _ref3[_l];
          if (e.name !== currentClass) {
            output += "</ul></li>";
            currentClass = e.name;
            output += "<li>" + currentClass + "<ul>";
          }
          output += "<li>" + e.method + " — ";
          if (e.time < 1) {
            output += "less than 1";
          } else {
            output += "" + e.time;
          }
          output += "ms</li>";
        }
        output += "</ul></li></ul>";
        return $('body').append(output);
      };


      /*
      			  * This method is called before each test.
      			  * Test class can override it to be called
       */

      TestClass.prototype.setUp = function() {};


      /*
      			  * This method is called after each test.
      			  * Test class can override it to be called
       */

      TestClass.prototype.tearDown = function() {};

      return TestClass;

    })();
  };
})(this));
