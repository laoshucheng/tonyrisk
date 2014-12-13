---
layout: post
title: "互联网协议基础笔记"
description: ""
category: 
tags: []
image:
  feature: posts.jpg
---

## 网络系统结构

**OSI七层结构** 将网络通信功能分为7个层次

| OSI层 | 功能 | 标准/协议/应用 |
|:---:|:---:|:---:|
| 应用层 | 文件传输，电子邮件，文件服务 | HTTP，SNMP，FTP，SMTP，DNS，Telnet |
| 表示层 | 数据表示法问题(如PC的ASCII和IBM的EBCDIC编码之间的转换) | 数据的压缩和解压缩， 加密和解密等 |
| 会话层 | 建立和维持会话 | 如服务器验证用户登陆 |
| 传输层 | 提供端对端可靠的接口(到哪个端口去) | TCP,UDP |
| 网络层 | '数据包'路由选择 | IP,ARP等 |
| 数据链路层 | 确定0和1的分组（帧）,以及对帧顺序和错误的控制 | ISO1745--1975等，网卡属于这一层 |
| 物理层 | 以二进制形式在物理媒介中传输数据 | ISO2110等传输标准 |

<!--break-->

越靠近应用层就和用户越接近，相反物理层就和机器相关性更大

`物理层` 把二进制数据传给 `数据链路层`，`链路层`封装成帧后给`网络层`，`网络层`封装成数据包，经过路由选择，传给 `传输层`，`传输层`经过对报文解包，把数据传输给响应端口的服务应用，`会话层`以上就对这个数据包进行业务逻辑的处理

一次简单的数据层面的传输就是这样

## HTTP 协议

在`应用层`中的 Http 协议是 Web 开发的基础，主要需要知道：

1. request / response 的结构
2. 浏览器缓存
3. 认识[状态码](http://baike.baidu.com/link?url=VNa-zDXuWlgAIofZ3oigXOeYCYcPusYrfMzj_5IQKye_j0dul_H0mvPV8d60vmZ-_oJXL5M2rZJUkWRQTnV8c_)
4. cookie

----------- EOF ---------------
