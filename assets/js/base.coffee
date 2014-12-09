---
---
go_top= ()->
  $(window).scroll (e)->
    # 若滚动条离顶部大于100元素
    if $(window).scrollTop() > 100
      $("#gotop").fadeIn(500)
    else
      $("#gotop").fadeOut(500)

$("#gotop").click (e)->
  # 以1秒的间隔返回顶部
  $('body,html').animate {scrollTop:0}, 200

$("#gotop").mouseover (e)->
  $(this).css("background","url(/assets/images/gotop.png) no-repeat 0px 0px")

$("#gotop").mouseout (e)->
  $(this).css("background","url(/assets/images/gotop.png) no-repeat -70px 0px")

$(document).ready ()->
  go_top()
