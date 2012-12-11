do ->
  size = null
  resizeEvent = -> $(window).trigger 'responsiveResize', size
  resizeTimer = null
  $(window).bind 'resize', ()=>
    if resizeTimer then clearTimeout resizeTimer
    reg = /\"/g
    size = window.getComputedStyle(document.body,':after').getPropertyValue('content').replace('-','').replace(reg,'') if window.getComputedStyle(document.body,':after')
    resizeTimer = setTimeout resizeEvent, 100
