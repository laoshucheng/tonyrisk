---
layout: post
title: "markdown cheatsheet"
tags: []
image:
  feature: posts.jpg
---

### 标题符号: '#'
+ 1～6个‘#’表示标题阶数


### 引用符号: '>'
+ 允许 ‘>’ 中嵌入其他markdown符号


### 无序列表符号: '+', '-', '*'
+ 符号于内容间用空格隔开

	空行再加制表符<tab>可以同一个列表中分段
- 这是第二个
- 		列表符号（如'-'）加上两个<tab>可以使用代码块
- 列表中其他标签用法可能和单独使用不太一样

<!--break-->

### 有序符号: '1. 2. 3.'
1. 第一个
3. 需要以英文句点和空格于内容隔开
22. 其实只要数字和句点隔开就可以，不一定要有序的数字（这行的标题是22.） 

	空行再加制表符<tab>可以同一个列表中分段
4. 最好按序号排序，以防以后支持有序现实


### ‘tab’可以放代码块
	这就是在代码块中输出,并且一般的markdown语法不会在代码快中解析
<pre><code>也可以直接用显性标签'pre,code'</code></pre>


### 简单代码显示：'``'

- 这是 `单独代码` 例子
- ``如果要在代码区段内插入反引号，你可以用多个反引号来开启和结束代码区段（`）``


### 转义字符还是'\\'
1. sdf
2\. dd


### 分割线：‘\-\-\-’ ‘\*\*\*’

-------------

### 链接用法‘[链接文字](http://url "title")’
- 参考式链接： ‘[link1][1]’
- 参考式链接： ‘[link2][2]’
- 也可以自动连接<tony@gmail.com>

[1]: url1 "title"
[2]: url2 "title"


### 强调用法：'*'

- *一个‘\*’是斜体*
- **两个‘\**’是加粗**


### 图片用法
- `![替代文字](url "title")`
- 或者

	`![Alt text][id]`
    
	`[id] url "title"`
- 目前不能指定宽度长度，如果想设置，就只能用html的标签'\<img\>'

----------- EOF ---------------
