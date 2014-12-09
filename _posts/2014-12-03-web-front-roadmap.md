---
layout: post
title: "一步到位学好Web前端"
description: ""
category: 
tags: []
image:
  feature: posts.jpg
---

'一步到位学好Web前端?' 拉倒吧，我只是整理了想学好的思路和一些工具资料，真正要学精通没有几年的沉淀根本不可能。

最近应项目需要，所以要转到网站开发当中来。仔细回忆了下，发现从来木有学过 Web 前端的技术，大学也没上过课啊。

只有最基本的一些 HTML 语言的认知，而且还停留在很早的阶段。

随着项目的不断推进，平时不断的泡论坛，查资料，像发现新大陆一样的感觉：原来 Web 前端知识和技能都很丰富啊！

开发一个又好看又快兼容性又好 SEO 做的也到位的网站一点不比游戏服务器，或者游戏客户端需要钻研的时间少。

所以，经过一段时间的沉淀，慢慢梳理一些我认为一些还不错的知识要点。

<!--break-->

# 基本知识
- http 协议([HTTP协议详解](http://www.cnblogs.com/TankXiao/archive/2012/02/13/2342672.html),[互联网协议入门](http://www.ruanyifeng.com/blog/2012/05/internet_protocol_suite_part_i.html))
- HTML([教程](http://www.w3school.com.cn/html/index.asp), [HTML5](http://www.w3school.com.cn/html5/index.asp))
- CSS([教程](http://www.w3school.com.cn/css/index.asp), [CSS3](http://www.w3school.com.cn/css3/index.asp))
- Javascript, ajax, json/xml ([教程](http://www.w3school.com.cn/b.asp))
- [web前端规范](http://www.jianshu.com/p/8d291d823cc0)

**给几个比较合适的学习资源：**

- [W3School](http://www.w3school.com.cn/index.html)(w3c官方资料站点)
- [W3CSchool菜鸟教程](http://www.w3cschool.cc/)(比官方站点类似，但是内容更丰富)
- [Head First HTML与CSS](http://book.douban.com/subject/25752357/)
- [HTTP权威指南](http://book.douban.com/subject/10746113/)
- [可以替代curl的好工具](https://github.com/jakubroztocil/httpie)

http 协议呢，有些人可能觉得不了解没什么关系。确实，真正感觉用到的地方没有，但是就和编程一样，

写代码的不了解计算机的组织管理结构也能编写，但是大师级，或者真正精通的程序员肯定知道底层技术。

因为这在后期的优化，认知，甚至排错，预防安全方面都和最最基础的东西是分不开的。

留个问题，检验下第一阶段：

> 从输入一个url，到显示出页面这段过程中，具体发生了什么事？

# 基本上手
- [html5-boilerplate](http://html5boilerplate.com/)
- [jquery](http://jquery.com/)
- [bootstrap](http://getbootstrap.com/)/[uikit](http://getuikit.com/)等一些主流UI框架
- [AngularJs](https://angularjs.org/)
- 会使用一些 debug 工具，如 Firebug，chrome的开发者工具等

知道一些基本原理和概念之后，就要站在巨人的肩膀上开始实战训练了

`html5-boilerplate` 是一个比较专业的前端模板，一开始可以参照它一步步了解大体框架

`jQuery` 是最好用的 Javascript 库，极大解放生产力，并且很多插件都是基于 jQuery 的

`bootstrap` 和 `uikit` 是比较不错的前端 UI 框架，已经封装了一系列效果和样式，可以快速开发出一个不难看的网站

`AngularJs` 让你可以把 Web 当成一个 Client 应用开发。基于 MVC 的开发理念，把页面视图和数据模型分离开来

**给几个比较合适的学习资源：**

- [CSS高效开发实战](http://book.douban.com/subject/25966259/)
- [CSS网站布局实录](http://book.douban.com/subject/2175995/)
- [jQuery基础教程](http://book.douban.com/subject/25733582/)
- [JavaScript语言精粹](http://book.douban.com/subject/3590768/)
- [JavaScript模式](http://book.douban.com/subject/11506062/)
- [无懈可击的Web设计](http://book.douban.com/subject/3687098/)
- [无懈可击的Web设计II](http://book.douban.com/subject/4935289/)

# 进阶

- 各个浏览器的兼容性和各自内核的差异（ie各个版本，firefox，chrome，safari等）
- 响应式设计，兼容移动端显示(一些针对移动端的标签属性)
- 优化页面，加快加载速度；运用面向对象，模块化思想，学会偷懒（重用）；学习怎么优化 SEO
- 知道一些高级技巧，比如长连接，WebSocket等
- 读一些杰出框架插件的源代码（如jQuery），向一些开源软件做贡献

**给几个比较合适的学习资源：**

- [HTML5高级程序设计](http://book.douban.com/subject/5402708/)
- [CSS权威指南](http://book.douban.com/subject/2308234/)
- [精通CSS](http://book.douban.com/subject/4736167/)
- [CSS禅意花园](http://book.douban.com/subject/2052176/)
- [JavaScript权威指南](http://book.douban.com/subject/10549733/)
- [ppk谈JavaScript](http://book.douban.com/subject/3022779/)
- [高性能JavaScript](http://book.douban.com/subject/5362856/)
- [Web前端黑客技术揭秘](http://book.douban.com/subject/20451827/)
- [高性能网站建设指南](http://book.douban.com/subject/3132277/)
- [高性能网站建设进阶指南](http://book.douban.com/subject/4719162/)

  以上哪一本都能带来新的体会和视角，建议都当床头书

# 入道
- 不断重复修炼上面的3大步骤，形成自己的知识体系，有自己的积累，善于优化架构
- 理解目标用户操作习惯和思维，知道他们需求
- 提高审美水平
- 提高 UI 交互设计

# 持续不断的学习
- 阅读各种书籍（深入原理的，巧妙技巧的，Web重构的，Web安全的）
- 了解一些主流服务端技术：ruby，php，nodejs等
- 混迹各种论坛博客，经常和同行交流
- 欣赏其他好的网站作品

### 附上一些资料
- [前端技能汇总](https://github.com/JacksonTian/fks)：配上一张思维导图，让你对整个 Web 前端架构有很好指导性，并且也搜集一些主要技能和工具
- [前端知识体系](http://ecomfe.duapp.com/tag/animation-library)：搜集了很多工具，插件
- [前端开发相关网站博客](https://github.com/foru17/front-end-collect)
- [ShowSlow -- 检测网站性能的站点](http://www.showslow.com/)


----------- EOF ---------------
