miam('system/ImgLazyLoad', ['system/Tag'], (function(_this) {
  return function() {

    /*
    		  * @defaultClass ImgLazyLoad
    		  * @brief Provides a lazy load for imgs. Applies only for images matching given class
    		  * @description
    		  * Class is given when lauching. Breakpoints are 500 and 1000 (3 zones)
    		  * Developer must define divs with given class and srcs of imgs. 
    		  * They will be automatically replaced
     */
    var ImgLazyLoad;
    return ImgLazyLoad = (function() {
      function ImgLazyLoad() {}

      ImgLazyLoad.defaultClass = 'lazy-img';


      /*
      			  * Runs img lazy loader
       */

      ImgLazyLoad.run = function(customClass) {
        if (customClass != null) {
          ImgLazyLoad.defaultClass = customClass;
        }
        ImgLazyLoad.setImgsFromDiv();
        return $(window).resize((function(_this) {
          return function() {
            return ImgLazyLoad.refreshSrcs();
          };
        })(this));
      };


      /*
      			  * Called only once. Replace divs by imgs
       */

      ImgLazyLoad.setImgsFromDiv = function() {
        return $(document).find('div.' + this.defaultClass).each((function(_this) {
          return function(i, e) {
            var t;
            t = new Tag('img.' + _this.defaultClass);
            if (Environment.getWidth() < 500) {
              t.setAttr('src', $(e).attr('data-img-small'));
            } else if (Environment.getWidth() < 1000) {
              t.setAttr('src', $(e).attr('data-img-medium'));
            } else {
              t.setAttr('src', $(e).attr('data-img-large'));
            }
            t.setAttr('alt', $(e).attr('data-img-alt'));
            t.setAttr('data-img-small', $(e).attr('data-img-small'));
            t.setAttr('data-img-medium', $(e).attr('data-img-medium'));
            t.setAttr('data-img-large', $(e).attr('data-img-large'));
            $(e).before(t.toString());
            return $(e).remove();
          };
        })(this));
      };


      /*
      			  * Changes atrribute only if value is different than existing
       */

      ImgLazyLoad.changeOnly = function($o, key, value) {
        if ($o.attr(key) !== value) {
          return $o.attr(key, value);
        }
      };


      /*
      			  * Refreshes srcs on window resizing
       */

      ImgLazyLoad.refreshSrcs = function() {
        return $(document).find('img.' + this.defaultClass).each((function(_this) {
          return function(i, e) {
            if (Environment.getWidth() < 500) {
              return ImgLazyLoad.changeOnly($(e), 'src', $(e).attr('data-img-small'));
            } else if (Environment.getWidth() < 1000) {
              return ImgLazyLoad.changeOnly($(e), 'src', $(e).attr('data-img-medium'));
            } else {
              return ImgLazyLoad.changeOnly($(e), 'src', $(e).attr('data-img-large'));
            }
          };
        })(this));
      };

      return ImgLazyLoad;

    })();
  };
})(this));
