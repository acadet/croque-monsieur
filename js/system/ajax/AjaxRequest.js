var _this=this;miam("ajax/AjaxRequest",[],function(){var t;return t=function(){function t(t){this.url=t,this.type="GET",this.dataType="json",this.success=function(t){return console.log("AjaxRequest success!"),console.log(t)},this.error=function(t,e,s){return console.log("AjaxRequest failed!"),console.log(s)}}return t.prototype.setType=function(t){return this.type=t},t.prototype.setData=function(t){return this.data=t},t.prototype.setDataType=function(t){return this.dataType=t},t.prototype.setSuccess=function(t){return this.success=t},t.prototype.setError=function(t){return this.error=t},t.prototype.execute=function(){return $.ajax({type:this.type,url:this.url,dataType:this.dataType,success:this.success,error:this.error})},t}()});