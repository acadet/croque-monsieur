var _this=this,__hasProp={}.hasOwnProperty,__extends=function(t,s){function e(){this.constructor=t}for(var o in s)__hasProp.call(s,o)&&(t[o]=s[o]);return e.prototype=s.prototype,t.prototype=new e,t.__super__=s.prototype,t};miam("tests/TestTag",["system/TestUnit","system/Tag"],function(){var t;return t=function(t){function s(){s.__super__.constructor.call(this,TestUnit.outputs.HTML),this.testAppend(),this.testRemove(),this.testConstructor()}return __extends(s,t),s.prototype.testAppend=function(){var t;return this.startTest("testAppend"),t=new Tag("div"),t.appendTo(),this.assert($("body").find("div").html()),$("body").find("div").remove(),$("body").append('<div class="koala"></div>'),t.appendTo("div.koala"),this.assert($("div.koala").find("div").html()),$("div.koala").remove(),this.endTest()},s.prototype.testRemove=function(){var t;return this.startTest("testRemove"),t=new Tag("div"),t.appendTo(),t.remove(),this.assert(!$("body").find("div")),this.endTest()},s.prototype.testConstructor=function(){var t;return this.startTest("testConstructor"),t=new Tag("div.martini.bijou"),this.assert(t.toJQuery().hasClass("martini")),this.assert(t.toJQuery().hasClass("bijou")),this.endTest()},s.prototype.testFind=function(){},s}(TestUnit)});