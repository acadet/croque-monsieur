class Environment
  @getWidth: () ->
    if self.innerWidth? then self.innerWidth
    else document.documentElement.clientWidth
    
  @getHeight: () ->
    if self.innerHeight? then self.innerHeight
    else document.documentElement.clientHeight
    
  @isTouchable: () ->
    (/Android|webOS|iPhone|Windows Phone|iPad|iPod|BlackBerry/i.test(navigator.userAgent))