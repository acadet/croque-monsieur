var _this=this;miam("system/CroqueTrigger",[],function(){var CroqueTrigger;return CroqueTrigger=function(){function CroqueTrigger(){this.run()}return CroqueTrigger.prototype.applyMethod=function(trigger,element){return trigger=trigger.substr(0,1).toUpperCase()+trigger.slice(1),eval("window.Croque.getMainClass()."+$(element).attr("data-on"+trigger)+"(element)")},CroqueTrigger.prototype.run=function(){var r=this;return $("*[data-onClick]").each(function(e,t){return $(t).on("click",function(){return r.applyMethod("click",$(t))})}),$("*[data-onHover]").each(function(e,t){return $(t).on("hover",function(){return r.applyMethod("hover",$(t))})})},CroqueTrigger}()});