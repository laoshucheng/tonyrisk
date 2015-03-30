---
layout: post
title: "Git 常用操作"
tags: []
image:
  feature: posts.jpg
---

git 是一个**分布式**的版本控制工具，每个开发人员从git版本库check out的时候会在自己的机器上也克隆一个版本库。在没网络的情况下，也能提交文件，查看log，查看历史版本，创建分支等。

Git主分支的名字，默认叫做Master。它是自动建立的，版本库初始化以后，默认就是在主分支在进行开发。

### 不同于svn，git在本地的状态有三个：

- 工作目录(working dir): 持有的实际文件
- 暂存区(index): 通过add命令，临时保存的改动
- Head: 指向最后一次提交(commit)的结果

<!--break-->

## 安装
Mac下直接下面命令（Mac用户强烈建议安装[homebrew](http://brew.sh/)和[brew cask](http://caskroom.io/)）

	brew install git
	
安装完后，可以用`git help`查看用法帮助
	
## 设置

### 1. git配置有三大块：

1. 系统级别：/etc/gitconfig(`git config --system`设置或者读取时用system参数)
2. 全局级别：~/.gitconfig(`git config --global`设置或者读取时用global参数)
3. 项目级别：myproject/.git/config (`git config`)

*优先级：* 3>2>1(如，3的设置会覆盖2的)

### 2. 操作
- 设置：`git config --global user.name 'xxx'`
- 查看：`git config --global user.name`
- 查看当前生效所有设置：`git config --list`
- 也可以直接编辑上面所提到的`gitconfig`文件

*一般会先用global设置用户层面的配置，再在项目层面设置针对项目的设置*

### 3. 常用配置

	[user]		
		name = xxxx
		email = xxx@xxx.com
	[color]
	    #开启着色功能
		ui＝ true
		status = auto
		diff = auto
		branch = auto
		interactive = auto
	[merge]
	    #默认 merge 都加上 --no-ff
		ff = false
	[alias]
	    #别名
		st = status
		ci = "commit -m"
		br = branch
		co = checkout
		cia = "commit -am"
		df = diff
		dt = difftool
		mg = merge
		mt = mergetool
		ll = "log --oneline"
		last = "log -1 HEAD"

## 新建版本库  

从零建立git版本库：

	mkdir myproject
	touch README.md LICENSE .gitignore
	git init								# 会在目录下建立.git文件夹
	git add *								# 把所有文件都放入本地缓存区
    git commit -m ‘first commit’		    # 将更改记录成快照
    
	# 还没有克隆现有仓库，并欲将本地仓库连接到某个远程服务器
	git remote add origin https://github.com/xxxx/test.git
    
	# 把本地改动更新到远程仓库的master分支上去
	git push -u origin master

## 复制版本库
	# 常用clone：
	git clone http[s]://example.com/path/to/repo.git/
	git clone [user@]example.com:path/to/repo.git/
	
	# 只clone某一个分支
	git clone -b branch-name git@github.com:user/myproject.git 

## 分支操作
	# 查看本地分支
	git branch
    
	# 查看远程分支
	git branch -r
	
	# 建立分支
	git branch branch-name

	# 建立无父节点的分支	
	git checkout --orphan branch-name
	
	# 建立并切换分支
	git checkout -b branch-name [from_branch]
	
	# 删除分支
	git branch -d branch-name

	# 删除远程分支
	git push [远程主机名] :[分支名]
	
	# 切换分支
	git checkout branch-name
	
	# 查看已经和当前分支合并的分支
	git branch --merged 
	
	# 查看尚未和当前分支合并的分支
	git branch --no-merged
	
	# 在本地分支上合并远程分支
	git merge --no-ff origin/master
	
### 分支使用场景实例
	#创建一个功能分支：
	git checkout -b feature-x develop

	#开发完成后，将功能分支合并到develop分支：
	git checkout develop
	git merge –no-ff feature-x

	#删除feature分支：
	git branch -d feature-x

## 推送本地更新到服务器

	git push [远程主机名] [本地分支名]:[远程分支名]

## 更新远程主机的内容到本地
	
	git pull [远程主机名] [远程分支名]:[本地分支名]
	
## 撤销回滚
	# reset 命令是把当前分支指向另一个位置
	# 把add的文件，撤销
	git reset -- <filename>
	git reset # 撤销所有add的文件
	
	# 会用HEAD中最新的内容替换掉工作目录中的内容，回滚到最后一个commit
	git checkout -- <filename>
	
	# 想丢弃你在本地的所有改动与提交，可以到服务器上获取最新的版本历史，
	# 并将你本地主分支指向它：
	git fetch origin
	git reset --hard origin/master
	
	# 检出某个文件的历史版本： 
	git checkout <commit> <paths>
	
	# 检出某个文件的历史版本到其他文件名： 
	git show <commit>:<file> new_name 
	例：git show d06b1cf09d2:text.txt > test1.txt
	
## Diff
	# 查看两个版本之间的区别
	git diff version1 version2
	
	# 查看当前缓存区（就是add后）和最新commit版本的区别
	git diff --cached
	
	# 查看当前工作目录和最新commit之间的区别
	git diff HEAD
	
	# 当前工作目录和其他分支之间的区别
	git diff branch-name
	
	# 查看缓存区和工作目录之间的区别
	git diff

## 存储: 保存当前工作内容到git栈，然后回复到最新commit状态
    # 存储
    git stash
    
    # 恢复最新一次存储
    git stash pop

    # 查看现有所有存储的列表
    git stash list

## 其他常用命令
	# 查看本地库状态
	git status [-s]
	
	# 添加文件到暂存区
	git add [-A]
	
	# 提交暂存区文件到本地库
	git commit -m "msg"	
	# 等价于add，加commit操作：
	git commit -am "msg"

    # 从缓存区中删除
    git rm file_name
    # 如果要在工作目录中留着该文件，可以使用
    git rm --cached file_name

    # 移动或者重命名缓存区中的文件
    git mv old_file new_file

    # 显示一个分支中提交的更改记录
    git log
	

## 扩展和参考

技术光是看书，如果没有实战完全不能深入理解的，最好的学习还是赶紧建立一个git库，然后在实战中学习吧。
另外看其他人总结的经验和知识点也能少走不少弯路：

- github的员工所著，豆瓣评分9.1的神书：[pro git](http://iissnan.com/progit/)

- pro git作者另一本，可看作pro git的补充版: [Git Community Book 中文版](http://gitbook.liuhui998.com/)

- 《Git权威指南》:  [中文官网](http://www.worldhello.net/gotgit/)

- 《Git权威指南》作者蒋鑫有一本好作，讲关于git和github的: [GotGitHub](http://www.worldhello.net/gotgithub/)

- 个人觉得最简单易懂介绍git的：[廖雪峰讲git](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

- 快速明白git内部构造：[中文版](http://youngsterxyf.github.io/2013/09/28/learning-git-internals-by-example/)

- 在公司内，怎么使用好git: [英文版](http://www.nczonline.net/blog/2013/05/21/github-workflows-inside-of-a-company/)

- 在线学习git的环境：

    [branch教程](http://pcottle.github.io/learnGitBranching/)
    
    [code school和github联合推出的学习平台](https://try.github.io/levels/1/challenges/1)

- git官方命令不够？没关系，牛人已经封装了更多git实用命令，总有一款适合你：[去看看](https://github.com/visionmedia/git-extras)

- 一张图让你上手git：[点击查看大图](http://sfault-image.b0.upaiyun.com/37/92/37923f2478edc5709b36562b26c9e008)

- 阳志平老师教你如何玩溜github: [开始玩](http://www.yangzhiping.com/tech/github.html)

- GitHub和Git一些使用技巧：[在这](http://snowdream86.gitbooks.io/github-cheat-sheet/content/zh/index.html)


----------- EOF ---------------
