miam('tests/TestImgLazyLoad', ['system/ImgLazyLoad'], (function(_this) {
  return function() {
    var TestImgLazyLoad;
    return TestImgLazyLoad = (function() {
      function TestImgLazyLoad() {
        ImgLazyLoad.run('my-lazy-img');
      }

      return TestImgLazyLoad;

    })();
  };
})(this));
