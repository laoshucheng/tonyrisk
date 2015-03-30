---
layout: post
title: "谈谈 Restful Api"
tags: []
image:
  feature: posts.jpg
---

# 概述
Representational State Transfer（REST，表现层资源状态转化），是Roy Thomas Fielding提出的互联网软件的架构原则。

满足这个原则的架构，就被叫做 Restful 架构。

1. 在 http 中也存在着 CURD(create, update, read, delete) 的操作，那就是：get, post, put, delete

2. 网络资源一般指上的一个实体，或者说网络上的一个具体信息，一般可以是一段文本，一张图片，一个音频等等

3. 对外的网络服务中，资源一般是系统内部的对象，通常就是数据库中的'表'，数据的交流最好使用 json 格式

<!--break-->

所以结合三点一般的 API 设计就是：
- get '/users' ：获得用户列表
- post '/users' ：创建一个用户
- get '/users/:id' ：获得具体用户信息
- get '/users/:id/messages' ：获得具体用户的消息列表
- get '/users/:id/messages/:mid' ：获得具体用户具体消息内容
- put '/users/:id' ：更新用户信息
- delete '/users/:id' ：删除用户

所有 URL 都是名词，动作都在 HTTP 方法中

有时候会有排序等需求，就直接跟在 URL中，如
    get '/users?order=name&page=1'

# 一些建议
1. 如果是对外的 Api 服务，尽量采用 https, 身份认证应该使用 OAuth 2.0 框架
2. api.xxx.com 尽量把 api 作为专有域名，最次也要写成 www.xxx.com/api/
3. 版本可以跟在 url 中： api.xxx.com/v1/ 或 www.xxx.com/api/v1/
4. 所有资源名词都为复数

----------- EOF ---------------
