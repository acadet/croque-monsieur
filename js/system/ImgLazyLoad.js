miam('system/ImgLazyLoad', ['jquery', 'system/Tag'], (function(_this) {
  return function() {

    /*
    		  * @defaultClass ImgLazyLoad
    		  * @brief Provides a lazy loader for imgs. Applies only for images matching given class
    		  * @description
    		  * Class is given when lauching. Breakpoints are 500 and 1000 (3 zones)
    		  * Developer must define divs with given class and srcs of imgs. 
    		  * They will be automatically replaced
     */
    var ImgLazyLoad;
    return ImgLazyLoad = (function() {
      function ImgLazyLoad() {}


      /*
      			  * Shows target only if not already displayed
       */

      ImgLazyLoad._show = function(target) {
        if (target.css('display') === 'none') {
          return target.css('display', 'inherit');
        }
      };


      /*
      			  * Hides target only if not already hidden
       */

      ImgLazyLoad._hide = function(target) {
        if (target.css('display') !== 'none') {
          return target.css('display', 'none');
        }
      };


      /*
      			  * Inits loader. Creates images for each supported size
       */

      ImgLazyLoad._init = function() {
        $(document).find('div.' + ImgLazyLoad._targetClass).each((function(_this) {
          return function(i, e) {
            var large, medium, small;
            small = new Tag('img.small-lazy-img.' + ImgLazyLoad._targetClass);
            medium = new Tag('img.medium-lazy-img.' + ImgLazyLoad._targetClass);
            large = new Tag('img.large-lazy-img.' + ImgLazyLoad._targetClass);
            small.setAttr('src', $(e).attr('data-small-img'));
            medium.setAttr('src', $(e).attr('data-medium-img'));
            large.setAttr('src', $(e).attr('data-large-img'));
            $(e).before(small.toString());
            $(e).before(medium.toString());
            $(e).before(large.toString());
            return $(e).remove();
          };
        })(this));
        return ImgLazyLoad._engine();
      };


      /*
      			  * Engines which image to display
       */

      ImgLazyLoad._engine = function() {
        return $(document).find('img.' + ImgLazyLoad._targetClass).each((function(_this) {
          return function(i, e) {
            var _ref;
            if ($(e).hasClass('small-lazy-img')) {
              if (Environment.getWidth() < 500) {
                return ImgLazyLoad._show($(e));
              } else {
                return ImgLazyLoad._hide($(e));
              }
            } else if ($(e).hasClass('medium-lazy-img')) {
              if ((500 <= (_ref = Environment.getWidth()) && _ref < 1000)) {
                return ImgLazyLoad._show($(e));
              } else {
                return ImgLazyLoad._hide($(e));
              }
            } else {
              if (Environment.getWidth() >= 1000) {
                return ImgLazyLoad._show($(e));
              } else {
                return ImgLazyLoad._hide($(e));
              }
            }
          };
        })(this));
      };


      /*
      			  * Runs img lazy loader
       */

      ImgLazyLoad.run = function(customTargetClass) {
        ImgLazyLoad._targetClass = customTargetClass != null ? customTargetClass : 'lazy-img';
        ImgLazyLoad._init();
        return $(window).resize((function(_this) {
          return function() {
            return ImgLazyLoad._engine();
          };
        })(this));
      };

      return ImgLazyLoad;

    })();
  };
})(this));
