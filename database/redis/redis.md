# 1.redis入门

## 1.1Redis 简介

**概念**：Redis (REmote DIctionary Server) 是用 C 语言开发的一个开源的高性能键值对（key-value）数据库。
**特征**：

1. 数据间没有必然的关联关系
2. 内部采用单线程机制进行工作
3. 高性能。官方提供测试数据，50个并发执行100000 个请求,读的速度是110000 次/s,写的速度是81000次/s。
4. 多数据类型支持
   * 字符串类型 string
   * 列表类型 list
   * 散列类型 hash
   *  集合类型 set
   *  有序集合类型 sorted_set
5. 持久化支持。可以进行数据灾难恢复

**应用**：

1. 为热点数据加速查询（主要场景），如热点商品、热点新闻、热点资讯、推广类等高访问量信息等
2.  任务队列，如秒杀、抢购、购票排队等
3.  即时信息查询，如各位排行榜、各类网站访问统计、公交到站信息、在线人数信息（聊天室、网站）、设
   备信号等 
4. 时效性信息控制，如验证码控制、投票控制等
5.  分布式数据共享，如分布式集群架构中的 session 分离
6.  消息队列
7.  分布式锁

## 1.2Redis 的下载与安装

### 1.2.1下载

1. Linux 版（适用于企业级开发）
   * Redis 高级开始使用
   * 以4.0 版本作为主版本

2. Windows 版本（适合零基础学习）
   *  Redis 入门使用
   *  以 3.2 版本作为主版本
   * 下载地址：https://github.com/MSOpenTech/redis/tags

### 1.2.2安装 

​	下载后解压即可使用，无需安装

1. 核心文件：
   * redis-server.exe 服务器启动命令
   * redis-cli.exe  命令行客户端
   * redis.windows.conf redis核心配置文件
   * redis-benchmark.exe  性能测试工具
   * redis-check-aof.exe AOF文件修复工具
   * redis-check-dump.exe RDB文件检查工具（快照持久化文件）

### 1.2.3启动 

1. 服务器启动
   * 双击redis-server.exe即可启动
   * 端口：6379
   * PID：随机生成
2. 客户端连接
   * 双击redis-cli.exe即可启动

## 1.3Redis 的基本操作

1. 信息添加
   *  功能：设置 key，value 数据
   *  命令：set key value
   * 范例：set name itheima
2. 信息查询
   * 功能：根据 key 查询对应的 value，如果不存在，返回空（nil）
   * 命令：get key
   *  范例：get name
3. 清除屏幕信息
   * 功能：清除屏幕中的信息
   * 命令：clear
4. 退出客户端
   * 功能：清除屏幕中的信息
   * 命令：`quit` `exit` `<ESC>`
5. 帮助
   * 功能：获取命令帮助文档，获取组中所有命令信息名称
   * 命令：`help 命令名称` `help @组名`
   * 

# 2.redis 数据类型

## 2.1Redis 数据类型（5种常用）

| 数据类型   | JAVA数据类型 |
| ---------- | ------------ |
| string     | String       |
| hash       | HashMap      |
| list       | LinkedList   |
| set        | LinkedList   |
| sorted_set | TreeSet      |

redis 数据存储格式：

*  redis 自身是一个 Map，其中所有的数据都是采用 key : value 的形式存储
* 数据类型指的是存储的数据的类型，也就是 value 部分的类型，key 部分永远都是字符串

## 2.2string

### 2.2.1string简介

*  存储的数据：单个数据，最简单的数据存储类型，也是最常用的数据存储类型
*  存储数据的格式：一个存储空间保存一个数据
* 存储内容：通常使用字符串，如果字符串以整数的形式展示，可以作为数字操作使用

### 2.2.2string 类型数据的基本操作

| 操作                                                       | 命令                           |
| ---------------------------------------------------------- | ------------------------------ |
| 添加/修改数据                                              | set key value                  |
| 获取数据                                                   | get key                        |
| 删除数据                                                   | del key                        |
| 添加/修改多个数据                                          | mset key1 value1 key2 value2 … |
| 获取多个数据                                               | mget key1 key2 …               |
| 获取数据字符个数（字符串长度）                             | strlen key                     |
| 追加信息到原始信息后部（如果原始信息存在就追加，否则新建） | append key value               |

