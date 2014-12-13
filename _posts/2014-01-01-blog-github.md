---
layout: post
title: "使用Github搭建个人博客"
tags: []
image:
  feature: posts.jpg
---

## 简单介绍
在github上创建一个项目，会有一个默认的项目首页（一般就是显示文件列表和一个简单的README文件内容）。

此外github也允许你自定义项目主页，所以有了[github pages](https://pages.github.com/)，它维护一些简单的静态页面。

[戳这里查看一个快速学习使用git pages的网站](http://www.thinkful.com/learn/a-guide-to-using-github-pages/start/)

Pages允许用户可以使用github提供的[模板](https://help.github.com/articles/creating-pages-with-the-automatic-generator)，也允许用户自己编写html页面后上传。github pages使用jekyll程序来搭建，上传后会由jekyll程序来处理生成页面。

[jekyll](http://jekyllrb.com/)是一个静态站点生成器，根据网页源码生成静态文件，提供变量，模板，插件等功能。

所以整个步骤就是：

	1. 写好符合jekyll规范网站源码
	2. 上传到github
	3. 由github生成并托管整个网站

<!--break-->

## 具体流程：

1. 建立一个博客项目

		$mkdir blog
		$cd blog
		$git init

2. 创建一个无父节点分支: `gh-pages`（github只有对该分支的页面，才能生成网页）

		git checkout --orphan gh-pages

3. 创建配置文件 _config.yml，并配置，如

        # 博客地址是 username.github.com/blog/
        baseurl: /blog

        # 域名
        url: http://www.tonyrisk.info

        # 把 markdown 解释器设置为 redcarpet，并做一些扩展配置
        # gem install redcarpet 来安装 redcarpet
        markdown: redcarpet
        redcarpet:
            extensions: ["with_toc_data", "strikethrough", "fenced_code_blocks", "highlight", "underline", "smart", "tables", "no_intra_emphasis", "autolink"]
		
    更多配置：[查看这里](http://jekyllrb.com/docs/configuration/)

4. 创建一个_layouts目录，用于存放模板文件

		mkdir _layouts

5. 在_layouts下创建default.html文件，作为Blog的默认模板，内容如下：

    ``` html
    <!DOCTYPE html>
    <html>
	    <head>
		    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
            <title>{{"{{ page.title "}}}}</title>
        </head>
	    <body>
		    {{"{{ content "}}}}
        </body>
    </html>
    ```

    `{{"{{content"}}}}` 表示文章内容，jekyll采用liquid模板语言

    更多变量：[查看这里](http://jekyllrb.com/docs/variables/)

6. 在项目根目录，创建一个_posts目录，用于存放博客文章

		mkdir _posts

7. 在_posts下创建文章，如`2014-08-20-first.md`，文件名必须为：

		YEAR-MONTH-DAY-title.MARKUP
		
    `MARKUP`可以是`md`(如果用markdown编写)，`html`(如果是html)，`textile`(如果是textile)
   
	下面是一偏文章示例:
	
		--- 
		layout: default
		title: 你好，世界
		---
		<h2>{{ page.title }}</h2>
		<p>我的第一篇文章</p>
		<p>{{ page.date | date_to_string }}</p>

    两条`---`中间的是yaml头，用来设置参数等。
    
    注意，三根短划线前面，是**不能有空格的!!**
    
    `layout`用来指明使用_layout文件夹下的哪个模板
    
    `title`如果不设置默认用文件名的title
    
    更多参数：[查看这里](http://jekyllrb.com/docs/frontmatter/)

8. 在根目录下创建首页：index.html(下面代码简单列出所有文章，你也可以自己编辑文件)

		---
		layout: default
		title: 我的Blog
		---
		<h2>{{ page.title }}</h2>
		<p>最新文章</p>
		<ul>
			{{"{% for post in site.posts "}}%}
			<li>{{"{{ post.date | date_to_string "}}}} <a href="{{"{{ site.baseurl "}}}}{{"{{ post.url "}}}}">{{"{{ post.title "}}}}</a></li>
			{{"{% endfor "}}%}
		</ul>

9. 提交发布（提交到github后，一般十分钟后，页面生效）

		$git add -A
		$git commit -m "first post"
        
		# blog是在github上创建的项目
		$git remote add origin https://github.com/username/blog.git
        
		# 把本地gh-pages分支推送到origin主机的gh-pages分支上
		$git push -u origin gh-pages

	http://username.github.com/blog/ (如果步骤3设置中`base_url=/blog`)这个地址就是博客地址

## 绑定域名
基本blog就搭建完成了，如果需要把站点域名换成自己的域名，也非常简单：

1. 项目根目录下面，新建一个名为CNAME的文本文件，里面写入你要绑定的域名，如：
   example.com 或者 xxx.example.com

2. 在你的域名商那添加一条cname记录指向username.github.com，如果是顶级域名得是A记录

3. 并把_config.yml中的baseurl改成‘/’指向username.github.com

## jeklly主题
以上是从零开始搭建，但是很多页面美化等都没有，现在有一个快速搭建功能齐全的工具[JekyllBootstrap](http://jekyllbootstrap.com/)

1. 在github上创建一个新的项目，比如：blog
2. 安装Jekyll Bootstrap

		git clone https://github.com/plusjade/jekyll-bootstrap.git blog
		cd blog
		rm -rf .git
		git init
		git checkout --orphan gh-pages
		git add -A
		git commit -m 'first commit'
		git remote add origin https://github.com/username/blog.git
		git push -u origin gh-pages

3. 安装jekyll，以便在本地查看博客

		gem install jekyll
		cd blog
		jekyll serve（localhost:4000 上可以访问博客了）

4. 新建一个文章：

		$ rake post title="Hello World"

5. 安装一个主题：

		# 可以在github上自行寻找jeklly的主题
		rake theme:install git="git://github.com/jekyllbootstrap/theme-mark-reid.git"

----------- EOF ---------------
