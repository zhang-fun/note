# 1.redis入门

## 1.1Redis简介

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

## 1.2Redis的下载与安装

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

## 1.3Redis的基本操作

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

# 2.redis数据类型

## 2.1Redis数据类型（5种常用）

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

### 2.2.2string基本操作

| 操作                                                       | 命令                           |
| ---------------------------------------------------------- | ------------------------------ |
| 添加/修改数据                                              | set key value                  |
| 获取数据                                                   | get key                        |
| 删除数据                                                   | del key                        |
| 添加/修改多个数据                                          | mset key1 value1 key2 value2 … |
| 获取多个数据                                               | mget key1 key2 …               |
| 获取数据字符个数（字符串长度）                             | strlen key                     |
| 追加信息到原始信息后部（如果原始信息存在就追加，否则新建） | append key value               |

### 2.2.3string扩展操作

1. 设置数值数据增加指定范围的值

   ```redis
   incr key 
   incrby key increment
   incrbyfloat key increment
   ```

   注意：

   * string在redis内部存储默认就是一个字符串，当遇到增减类操作incr，decr时会转成数值型进行计算。
   * redis所有的操作都是原子性的，采用单线程处理所有业务，命令是一个一个执行的，因此无需考虑并发
     带来的数据影响。
   * 注意：按数值进行操作的数据，如果原始数据不能转成数值，或超越了redis 数值上限范围，将报错。
     9223372036854775807（java中long型数据最大值，Long.MAX_VALUE）

2. 设置数值数据减少指定范围的值

   ```redis
   decr key 
   decrby key increment
   ```

   注意：

   * redis用于控制数据库表主键id，为数据库表主键提供生成策略，保障数据库表的主键唯一性

   * 此方案适用于所有数据库，且支持数据库集群

3. 设置数据具有指定的生命周期

   ```
   setex key seconds value 
   psetex key milliseconds value
   ```

   redis 控制数据的生命周期，通过数据是否失效控制业务行为，适用于所有具有时效性限定控制的操作

### 2.2.4string注意事项

1.  数据操作不成功的反馈与数据正常操作之间的差异

   * 表示运行结果是否成功

     (integer) 0 → false 失败

      (integer) 1 → true  成功

   * 表示运行结果值

     (integer) 3 → 3  3个 

     (integer) 1 → 1 1个

2. 数据未获取到

   （nil）等同于null

3.  数据最大存储量

   512MB

4.  数值计算最大范围（java中的long的最大值）

   9223372036854775807

### 2.2.5string应用场景

redis应用于各种结构型和非结构型高热度数据访问加速

1.  在redis中为大V用户设定用户信息，以用户主键和属性值作为key，后台设定定时刷新策略即可

   ```json
   eg:  user:id:3506728370:fans  → 12210947
   eg:  user:id:3506728370:blogs  → 6164
   eg:  user:id:3506728370:focuss  → 83
   ```

2. 在redis中以json格式存储大V用户信息，定时刷新（也可以使用hash类型）

   ```json
   eg:  user:id:3506728370 → 
   {"id":3506728370,"name":"春晚","fans":12210862,"blogs":6164, "focus":83}
   ```

3. key 的设置约定

   数据库中的热点数据key命名惯例

   ```redis
   表名	:	主键名	:	主键值		:	字段名
   order:	 id	   :   29437595  :	 name
   equip:	 id	   :   390472345 :   type
   news :   id    :   202004150 :   title
   ```

## 3.3hash

### 3.3.1hash简介

*  新的存储需求：对一系列存储的数据进行编组，方便管理，典型应用存储对象信息
*   需要的存储结构：一个存储空间保存多个键值对数据
*   hash类型：底层使用哈希表结构实现数据存储
*  hash存储结构优化：如果field数量较少，存储结构优化为类数组结构； 如果field数量较多，存储结构使用HashMap结构

### 3.3.2hash基本操作

| 操作                           | 命令                                    |
| ------------------------------ | --------------------------------------- |
| 添加/修改数据                  | hset key field value                    |
| 获取数据                       | `hget key field` `hgetall key`          |
| 删除数据                       | hdel key field1 [field2]                |
| 添加/修改多个数据              | hmset key field1 value1 field2 value2 … |
| 获取多个数据                   | hmget key field1 field2 …               |
| 获取哈希表中字段的数量         | hlen key                                |
| 获取哈希表中是否存在指定的字段 | hexists key field                       |



### 3.3.3hash扩展操作

1. 获取哈希表中所有的字段名或字段值

   ```redis
   hkeys key
   hvals key
   ```

2. 设置指定字段的数值数据增加指定范围的值

   ```redis
   hincrby key field increment
   hincrbyfloat key field increment
   ```

### 3.3.4hash注意事项

1. hash类型下的value只能存储字符串，不允许存储其他数据类型，不存在嵌套现象。如果数据未获取到，
   对应的值为（nil）
2.  每个 hash 可以存储 2 32 - 1 个键值对
3.  hash类型十分贴近对象的数据存储形式，并且可以灵活添加删除对象属性。但hash设计初衷不是为了存
   储大量对象而设计的，切记不可滥用，更不可以将hash作为对象列表使用
4.  hgetall 操作可以获取全部属性，如果内部field过多，遍历整体数据效率就很会低，有可能成为数据访问
   瓶颈

### 3.3.5hash应用场景

1. 电商网站购物车设计与实现

   解决方案

   * 以客户id作为key，每位客户创建一个hash存储结构存储对应的购物车信息

   * 将商品编号作为field，购买数量作为value进行存储
   * 添加商品：追加全新的field与value
   * 浏览：遍历hash
   * 更改数量：自增/自减，设置value值
   * 删除商品：删除field
   * 清空：删除key
   * 此处仅讨论购物车中的模型设计
   * 购物车与数据库间持久化同步、购物车与订单间关系、未登录用户购物车信息存储不进行讨论

2. 加速了购物车的呈现

   * 每条购物车中的商品记录保存成两条field
   * field1专用于保存购买数量
     命名格式：商品id:nums
     保存数据：数值
   * field2专用于保存购物车中显示的信息，包含文字描述，图片地址，所属商家信息等
     命名格式：商品id:info
     保存数据：json
     ``hsetnx key field value``

3. 手机充值卡抢购活动

   redis 应用于抢购，限购类、限量发放优惠卷、激活码等业务的数据存储设计

   * 以商家id作为key
   * 将参与抢购的商品id作为field
   * 将参与抢购的商品数量作为对应的value
   * 抢购时使用降值的方式控制产品数量
   * 实际业务中还有超卖等实际问题，这里不做讨论

## 3.4list