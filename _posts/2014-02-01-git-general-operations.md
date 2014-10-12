# Git 常用操作

git 是一个**分布式**的版本控制工具，每个开发人员从git版本库check out的时候会在自己的机器上也克隆一个版本库。在没网络的情况下，也能提交文件，查看log，查看历史版本，创建分支等。

Git主分支的名字，默认叫做Master。它是自动建立的，版本库初始化以后，默认就是在主分支在进行开发。

### 不同于svn，git在本地的状态有三个：

- 工作目录(working dir): 持有的实际文件
- 暂存区(index): 通过add命令，临时保存的改动
- Head: 指向最后一次提交(commit)的结果


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
	git commit -m ‘first commit’		# 将更改记录成快照
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
	# 查看分支
	git branch
	
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

## 其他常用命令
	# 查看本地库状态
	git status [-s]
	
	# 添加文件到暂存区
	git add [-A]
	
	# 提交暂存区文件到本地库
	git commit -m "msg"
	
	# 等价于add，加commit操作：
	git commit -am "msg"	
	

## 扩展
[git-extras](https://github.com/visionmedia/git-extras)

[一些操作图示](http://sfault-image.b0.upaiyun.com/37/92/37923f2478edc5709b36562b26c9e008)

----------- EOF ---------------