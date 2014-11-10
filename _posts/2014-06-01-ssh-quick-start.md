---
layout: post
title: "SSH简单使用介绍"
tags: []
image:
  feature: posts.jpg
---

如果接触过服务器开发，如果自己有过服务器，那么ssh登陆这个功能就非认识不可（并且之后就会知道实在是非常方便好用）。

严格来说，SSH只是一种网络协议，而我们常用的使用软件是OpenSSH。

ssh是linux和MacOS操作系统的标配命令，而windows可以使用轻量级软件putty。

## 登陆

    # 用户名为 user 通过服务器上端口 2222 ，登陆到host主机（可以是ip或域名）
    $ssh -p 2222 user@host
    
    # 用户名为 user 通过服务器上默认端口 22 ，登陆到host主机（可以是ip或域名）
    $ssh user@host
    
    # 用户名为 当前本地用户名 通过服务器上默认端口 22，登陆到host主机（可以是ip或域名）
    $ssh host
    
<!--break-->

如果本地机器第一次登陆 host，那么输入命令后会出现：

    $ ssh user@host
    The authenticity of host 'host (12.18.429.21)' can't be established.
    RSA key fingerprint is 98:2e:d7:e0:de:9f:ac:67:28:c2:42:2d:37:16:58:4d.
    Are you sure you want to continue connecting (yes/no)?

表示现在有一台主机响应你的 ssh 请求，其公钥指纹为`98:2e:d7:e0:de:9f:ac:67:28:c2:42:2d:37:16:58:4d`，是否确定连接。

为什么要这个提示呢？因为有可能ssh请求会被其他人拦截，然后伪造成你要访问的主机，劫持你以后的输入，所以让你确定主机信息。

一般只能把发来的公钥指纹和真正主机上的公钥指纹进行比较，如果匹配上那么就是真实的主机。

### - 使用密码登陆

默认，当确定主机后，输入主机上用户`user`的登陆密码，就可以以用户`user`的身份登陆到远程主机了。

### - 使用公钥登陆

使用密码登陆，会每次连接都要输入密码，比较麻烦，所以也可以使用公钥登陆。

主机收到ssh请求后会 **随机发送一字符串** 给用户，用户用 **本地私钥** 加密后发送给主机，主机用 **用户放在主机上的公钥** 解密，匹配成功则ssh登陆成功。

1. 生成公钥

        $ssh-keygen -t rsa -C "your_email@example.com"

    这个命令会在 HOME/.ssh/ 文件夹下生成 **id_rsa.pub** 和 **id_rsa**。前者是你的公钥，后者是你的私钥。

2. 把公钥放到主机上

        # 在本地执行
        $ssh user@host 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub

好了，从此你再登录，就不需要输入密码了。

如果还是不行，就打开远程主机的`/etc/ssh/sshd_config`这个文件，检查下面几行前面"#"注释是否取掉。

    RSAAuthentication yes
    PubkeyAuthentication yes
    AuthorizedKeysFile .ssh/authorized_keys
    
改了config之后需要重启ssh服务，比如ubuntu系统：

    $sudo service ssh restart

### - 使用用户配置文件
如果有多个主机，并且每个主机用户名、端口等其他配置可能都不一样；
每次输入都很麻烦，记忆也不方面，所以ssh提供`~/.ssh/config`（没有就创建一个）文件来帮助管理各个ssh会话。

一个会话的配置，基本如下：

    Host            myvps             # 别名
        HostName        10.0.0.1      # 主机名
        Port            2222          # 端口
        User            tonyrisk      # 用户名
        IdentityFile    ~/.ssh/id_rsa #密钥文件的路径

以上设置后可以直接执行下面的命令来建立ssh回话了：

    ssh myvps

## 使用SSH代理

    ssh -qTfnNC user@host -p 22 -D localhost:8088

- `-q` 安静模式，忽略一切对话和错误提示。
- `-T` Disable pseudo-tty allocation. 不占用 shell 了。
- `-f` Requests ssh to go to background just before command execution. 后台运行，并推荐加上 -n 参数。
- `-n` Redirects stdin from /dev/null (actually, prevents reading from stdin).
- `-N` 不执行远程命令
- `-C` 压缩
- `-D` 绑定本地地址和端口

## 交换远程文件

    # 把 本地文件 拷贝到远程主机，remote_location可以是文件名，也可以是路径
    scp local_file user@host:remote_location

    # 把 本地文件夹 拷贝到远程主机
    scp -r local_folder user@host:remote_location

    # 把 远程文件 拷贝到本地
    scp user@host:remote_file local_location

    # 把 远程文件夹 拷贝到本地
    scp -r user@host:remote_folder local_location

----------- EOF ---------------
