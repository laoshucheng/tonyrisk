---
layout: post
title: "js模块化二"
description: ""
category: 
tags: []
image:
  feature: posts.jpg
---

## 立即执行函数

``` js
var a = function(p1, p2){
    // ...
}
a(xx, yy)
```

js 中函数可以是一个变量，调用函数，可以直接调用变量；所以立即执行函数，其实就是这样：

<!--break-->

``` js
var result = (function(p1, p2){
    //... 
})();
```

## CommonJS 规范

CommonJS 只是一种规范，NodeJs 是最著名的实现此规范的技术
有几个关键的特性：

1. 一个文件就是一个独立的模块，内部的变量和方法都不能被外部引用；除非返回了映射结果，或者是定义成 global 对象的属性
2. 使用 require 来加载模块
3. 通过 module.exports 对象作为模块对外的接口

## AMD 规范

AMD(异步模块定义) 也是一种规范。CommondJS 加载模块是同步，而 AMD 则是异步

1. define([mod array], callback)
2. AMD 兼容 CommondJS 规范
3. 比较流行的有 RequireJs


----------- EOF ---------------
