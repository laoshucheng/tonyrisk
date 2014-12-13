---

layout: post
title: "谈谈用户密码存储"
description: ""
category: 
tags: []
image:
  feature: posts.jpg

---

# 引子

以前在开发游戏的时候，玩家的密码经常被我们明文保存在数据库中:)，但是想到在其他游戏内或者网站中，他们也如此对待我的密码，思之极恐啊 :( 。因为大部分人一个密码走天下，如果在一个地方密码泄露了，那么你的微博，微信，qq，邮箱等等全部沦陷。

而最近我正好在搭建电商网站，于是就涉及到相关问题，今天就好好来理理这个问题。

<!--break-->

对密码处理呢，一般处于三种考虑

1. 保证用户数据安全，比如一些网银，密码太重要了！一个不小心就是经济损失
2. 我们是正经人，是君子，虽然我们能看到你的密码，但是我们绝对不看，所以我们经过一定算法产生无意义的字符串后存储。
3. 万一我们技不如人，或者被竞争对手攻击导致资料外泄，那么别人拿到的密码，也猜不出用户的原码，所以对用户还是安全的。有木有很负责啊！

先看下业务模型：

- a. 用户注册时在网页上输入密码（此时常常显示***，其实只是安慰用户，实际上只是显示为*而已，只是显示）

- b. 用户点击确定，前端就通过post方法将密码发送到服务器（众多周知用get会在地址栏中看到明文密码。但是post报文中只要用一些能查看http request的工具还是能看到，比如chrome自带的开发者工具）

- c. 服务器收到密码后存储（有良心的，对密码加密下，否则只要有数据库权限的人都能看到每个用户的密码，甚至如果数据库被黑了，泄漏了，那就使得所有用户的密码红果果地暴露在光天化日之下啊）

所以针对上面的流程，安全的做法应该是：

- a. 使用浏览器密码控件，保证输入安全

- b. 有别于http协议（http协议是明文）使用https协议，保证网络传输安全

- c. 对密码加密后存储

浏览器插件和https协议此文不详细展开，这里主要看看怎么加密。

现在比较流行的是md5，sha-1或者两者结合，再安全一点就配合salt一起。

md5，sha1，salt都是啥啊？嗯，其实我也不太清楚，最近看到过这些字母是在微信开发api中，所以我特意去了解了下。

严格来说md5，sha1都不是加密技术，只是哈希算法，具体解释请继续阅读：

# MD5
MD5，全称Message Digest Algorithm 5（中文叫消息摘要算法第五版，所以有md2，md3，md4各个历史版本）。
`基础原理是将数据（比如一段文字）运算后变为一固定长度（128位）的值。`
经过md5算法的过程是不可逆的，即知道结果字符串和md5的算法也不能倒推出原来的数据是什么。
两个不一样的数据经过md5算法后产生的结果如果一致，那么就是’哈希冲突’。
在2004年之前（后文会说明这个时间点），一致认为md5产生的值是唯一的，可当作‘数字签名’(数字指纹)。

**用法一：**用来确保资料在传输过程中的完整性。比如服务器预先提供一个MD5校验和，用户下载完文件以后，用MD5算法计算下载文件的MD5校验和，然后通过检查这两个校验和是否一致，就能判断下载的文件是否出错。

**用法二：**广泛用于操作系统的登陆认证上。如在Unix系统中用户的密码是以MD5（或其它类似的算法）经Hash运算后存储在文件系统中。当用户登录的时候，系统把用户输入的密码进行MD5 Hash运算，然后再去和保存在文件系统中的MD5值进行比较，进而确定输入的密码是否正确。通过这样的步骤，系统在并不知道用户密码的明码的情况下就可以确定用户登录系统的合法性。

值得骄傲的是2004年，我国的王小云教授和她的团队公布了MD系列算法的哈希冲突，即不同的数据能够产生相同的Hash值，也就是说，可以找到两份具有相同数字手印的不同电子文件。从理论上说明md5的不安全性，但是实际中md5产生相同的概率极低。

# SHA-1
SHA，全称Secure Hash Algorithm（安全哈希算法），对于长度小于2^64位的消息，SHA1会产生一个160位的消息摘要。用法和原理与MD5类似，也是不可逆的，都是用于数字签名，判断数据完整性。SHA1曾被视为是MD5的后继者，不过王小云教授还是证明虽然较为困难，但是还是出现了哈希碰撞的发生。
但是目前还没有SHA2（SHA-224, SHA-256, SHA-384和SHA-512，它们生成的摘要密文分别就是224,256,384,512位）SHA2的破解新闻。

# MD5和SHA1
md5和sha1被证明不同的数据能产生同一个值的影响是什么呢？最直接的就是签名的不安全，比如有人可以伪造我的密码登陆系统。在实际应用过程中，其实没有太多意义，你想啊，这和猜你的密码有啥区别，还不如试着破解你的密码来的高效，应该大部分人的密码都是有规律的，什么姓名生日等的组合。

现在通行的破解做法是穷举字典暴力破解法，通过把字典中罗列的密码经过md5算法处理后得到的字符串和目标对比倒推出原文。进阶一点的把常用密码的常见组合进行单向哈希，得到一个摘要组合来对比，这个组合就是俗称的彩虹表。

md5，sha1，sha2因为结果位数越来越长，安全性也越来越高，当然消耗的计算量也是越来越大，所以一般的密码使用md5已经是够了。

综上，还算安全的做法是产生一个固定较长的随机数salt1，和随机salt2（比如主键），和用户密码一起，经过md5的计算。比如密码是123456，salt1是x1y1z1，sal2是234355，组成字符串’123456x1y1z1234355’，再经过个几次（apache迭代了1000次）md5运算基本就已经算是安全了，当然也要确保salt避免被泄漏。当然还要加强应用安全，如输错三次就暂时锁定等。
目前大部分的网站都是用此种方式，而知乎用的是bcrypt。

#bcrypt

bcrypt是专门为密码存储而设计的算法，基于Blowfish加密算法变形而来，由Niels Provos和David Mazières发表于1999年的USENIX。
bcrypt最大的好处是有一个参数（work factor)，可用于调整计算强度，而且work factor是包括在输出的摘要中的。随着攻击者计算能力的提高，使用者可以逐步增大work factor，而且不会影响已有用户的登陆。
bcrypt经过了很多安全专家的仔细分析，使用在以安全著称的OpenBSD中，一般认为它比PBKDF2更能承受随着计算能力加强而带来的风险。bcrypt也有广泛的函数库支持，因此我们建议使用这种方式存储密码。

但是！bcrypt比md5和sha1的消耗都要大，如果用默认的work factor＝10，计算一次将消耗0.3秒。

----------- EOF ---------------