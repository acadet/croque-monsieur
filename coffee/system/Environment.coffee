class Environment
  @getWidth: () ->
    if self.innerWidth != undefined then self.innerWidth
    else document.documentElement.clientWidth
    
  @getHeight: () ->
    if self.innerHeight != undefined then self.innerHeight
    else document.document.Element.clientHeight
    
  @isTouchable: () ->
    (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent))