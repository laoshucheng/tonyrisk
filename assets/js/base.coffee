---
---

shortContent = ->
  $('body').removeClass 'short-content'

  page_size = 0
  page_size += $('#page-content').height() if $('#page-content').is(":visible")
  page_size += $('#page-footer').height() if $('#page-footer').is(":visible")
  page_size += $('#page-header').height() if $('#page-header').is(":visible")

  if $(window).height() > page_size
    $('body').addClass 'short-content'

$(window).resize ()->
  shortContent()

$('#page-content').bind "heightChange", ()->
  shortContent()
  
$(document).ready ()->
  shortContent()
