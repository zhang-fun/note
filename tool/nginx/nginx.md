Nginx与服务器集群

[视频教程链接](https://www.bilibili.com/video/BV1Xb411E7qf?p=17)

[笔记参考链接](https://www.cnblogs.com/zhaobingqing/p/7488660.html)
目录：
- [1.什么是Nginx](#1%e4%bb%80%e4%b9%88%e6%98%afnginx)
- [2.应用场景](#2%e5%ba%94%e7%94%a8%e5%9c%ba%e6%99%af)
- [3.Nginx安装](#3nginx%e5%ae%89%e8%a3%85)
  - [3.1安装](#31%e5%ae%89%e8%a3%85)
  - [3.2配置](#32%e9%85%8d%e7%bd%ae)
  - [3.3启动](#33%e5%90%af%e5%8a%a8)
  - [3.4安装完成常用命令](#34%e5%ae%89%e8%a3%85%e5%ae%8c%e6%88%90%e5%b8%b8%e7%94%a8%e5%91%bd%e4%bb%a4)
- [4.nginx配置虚拟主机](#4nginx%e9%85%8d%e7%bd%ae%e8%99%9a%e6%8b%9f%e4%b8%bb%e6%9c%ba)
- [5.反向代理和负载均衡](#5%e5%8f%8d%e5%90%91%e4%bb%a3%e7%90%86%e5%92%8c%e8%b4%9f%e8%bd%bd%e5%9d%87%e8%a1%a1)
- [6.nginx负载均衡高可用](#6nginx%e8%b4%9f%e8%bd%bd%e5%9d%87%e8%a1%a1%e9%ab%98%e5%8f%af%e7%94%a8)
  - [6.1什么是负载均衡高可用](#61%e4%bb%80%e4%b9%88%e6%98%af%e8%b4%9f%e8%bd%bd%e5%9d%87%e8%a1%a1%e9%ab%98%e5%8f%af%e7%94%a8)
  - [6.2keepalived+nginx实现主备](#62keepalivednginx%e5%ae%9e%e7%8e%b0%e4%b8%bb%e5%a4%87)
    - [6.2.1 什么是keepalived](#621-%e4%bb%80%e4%b9%88%e6%98%afkeepalived)
    - [6.2.2 keepalived工作原理](#622-keepalived%e5%b7%a5%e4%bd%9c%e5%8e%9f%e7%90%86)
    - [6.2.3 keepalived+nginx实现主备过程](#623-keepalivednginx%e5%ae%9e%e7%8e%b0%e4%b8%bb%e5%a4%87%e8%bf%87%e7%a8%8b)
      - [6.2.3.1     初始状态](#6231-%e5%88%9d%e5%a7%8b%e7%8a%b6%e6%80%81)
      - [6.2.3.2     主机宕机](#6232-%e4%b8%bb%e6%9c%ba%e5%ae%95%e6%9c%ba)
      - [1.2.3.3     主机恢复](#1233-%e4%b8%bb%e6%9c%ba%e6%81%a2%e5%a4%8d)
    - [1.2.4 高可用环境](#124-%e9%ab%98%e5%8f%af%e7%94%a8%e7%8e%af%e5%a2%83)
    - [1.2.5 安装keepalived](#125-%e5%ae%89%e8%a3%85keepalived)
    - [1.2.6 配置keepalived](#126-%e9%85%8d%e7%bd%aekeepalived)
      - [1.2.6.1     主nginx](#1261-%e4%b8%bbnginx)
      - [1.2.6.2     备nginx](#1262-%e5%a4%87nginx)
    - [1.2.7 测试](#127-%e6%b5%8b%e8%af%95)
      - [1.2.7.1     初始状态](#1271-%e5%88%9d%e5%a7%8b%e7%8a%b6%e6%80%81)
      - [1.2.7.2     主机宕机](#1272-%e4%b8%bb%e6%9c%ba%e5%ae%95%e6%9c%ba)
      - [1.2.7.3     主机恢复](#1273-%e4%b8%bb%e6%9c%ba%e6%81%a2%e5%a4%8d)
    - [1.2.8 解决nginx进程和keepalived不同时存在问题](#128-%e8%a7%a3%e5%86%b3nginx%e8%bf%9b%e7%a8%8b%e5%92%8ckeepalived%e4%b8%8d%e5%90%8c%e6%97%b6%e5%ad%98%e5%9c%a8%e9%97%ae%e9%a2%98)
      - [1.2.8.1     问题描述](#1281-%e9%97%ae%e9%a2%98%e6%8f%8f%e8%bf%b0)
      - [1.2.8.2     nginx进程检测脚本](#1282-nginx%e8%bf%9b%e7%a8%8b%e6%a3%80%e6%b5%8b%e8%84%9a%e6%9c%ac)
      - [1.2.8.3     修改keepalived.conf](#1283-%e4%bf%ae%e6%94%b9keepalivedconf)
      - [1.2.8.4     测试](#1284-%e6%b5%8b%e8%af%95)
# 1.什么是Nginx

Nginx是一款高性能的http 服务器/反向代理服务器及电子邮件（IMAP/POP3）代理服务器。由俄罗斯的程序设计师Igor Sysoev所开发，官方测试nginx能够支支撑5万并发链接，并且cpu、内存等资源消耗却非常低，运行非常稳定

# 2.应用场景

1. http服务器。Nginx是一个http服务可以独立提供http服务。可以做网页静态服务器。
2. 虚拟主机。可以实现在一台服务器虚拟出多个网站。例如个人网站使用的虚拟主机。
3. 反向代理，负载均衡。当网站的访问量达到一定程度后，单台服务器不能满足用户的请求时，需要用多台服务器集群可以使用nginx做反向代理。并且多台服务器可以平均分担负载，不会因为某台服务器负载高宕机而某台服务器闲 的情况。

# 3.Nginx安装

## 3.1安装

1. 安装依赖包

   ```bash
   #一键安装上面四个依赖
   yum -y install gcc zlib zlib-devel pcre-devel openssl openssl-devel
   ```

   >   Gcc：yum install gcc c++                      （用于编译c、c++代码）
   >
   >   Pcre：yum install -y pcre pcre-devel              （用c语言编写的正则表达式函数库）
   >
   >   Zlib：yum install -y zlib zlib-devel                （用于数据压缩的函式库）
   >
   >   OpenSSL：yum install -y openssl openssl-devel      （安全套接字层密码库）

   2.下载并解压安装包

   ```bash
   #创建一个文件夹
   cd /usr/local
   mkdir nginx
   cd nginx
   #下载tar包
   wget http://nginx.org/download/nginx-1.13.7.tar.gz
   tar -xvf nginx-1.13.7.tar.gz
   ```

   3.安装nginx

   ```bash
   #进入nginx目录
   cd /usr/local/nginx
   #进入目录
   cd nginx-1.13.7
   #使用configure命令创建一makeFile文件
   ./configure \
   --prefix=/usr/local/nginx \
   --pid-path=/var/run/nginx/nginx.pid \
   --lock-path=/var/lock/nginx.lock \
   --error-log-path=/var/log/nginx/error.log \
   --http-log-path=/var/log/nginx/access.log \
   --with-http_gzip_static_module \
   --http-client-body-temp-path=/var/temp/nginx/client \
   --http-proxy-temp-path=/var/temp/nginx/proxy \
   --http-fastcgi-temp-path=/var/temp/nginx/fastcgi \
   --http-uwsgi-temp-path=/var/temp/nginx/uwsgi \
   --http-scgi-temp-path=/var/temp/nginx/scgi
   #发现创建了一个Makefile
   #注意：在启动nginx之前。上边将临时文件目录指定为/var/temp/nginx,需要在/var下创建temp及nginx目录。
   mkdir /var/temp/nginx/client -p
   #执行make命令：编译
   make
   #执行make install命令：安装
   make install
   ```

## 3.2配置

配置nginx.conf

```bash
# 打开配置文件
vi /usr/local/nginx/conf/nginx.conf
```

将端口号改成8089，因为可能apeache占用80端口，apeache端口尽量不要修改，我们选择修改nginx端口。

localhost修改为你服务器ip地址。

![image-20200524040748031](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524040748031.png)

## 3.3启动

```bash
/usr/local/nginx/sbin/nginx -s reload
```

>  如果出现报错：nginx: [error] open() ＂/usr/local/nginx/logs/nginx.pid＂ failed

则运行： 

```bash
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
```

再次启动即可！

**查看nginx进程是否启动**

ps -ef | grep nginx

![image-20200524040905731](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524040905731.png)

 

若想使用外部主机连接上虚拟机访问端口192.168.131.2，需要关闭虚拟机的防火墙：

centOS6及以前版本使用命令： systemctl stop iptables.service

centOS7关闭防火墙命令： systemctl stop firewalld.service

随后访问该ip即可看到nginx界面。

访问服务器ip查看（备注，由于我监听的仍是80端口，所以ip后面的端口号被省略）

## 3.4安装完成常用命令

进入安装目录中

命令： cd /usr/local/nginx/sbin

启动，关闭，重启，命令：

./nginx 启动

./nginx -s stop 关闭

./nginx -s reload 重启

# 4.nginx配置虚拟主机

就是在一台服务器启动多个网站

如何区分不同的网站：

* 域名不同
* 端口不同

**通过端口区分不同主机**

　Nginx配置文件：

```
/usr/local/nginx/conf/nginx.conf
```

```json
server {
        listen       80;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html;
            index  index.html index.htm;
        }
 }
```

　　一个server节点就是一个虚拟主机，可以配置多个server。添加完server后需要重新加载配置文件：

小知识：

```bash
#递归复制文件夹
cp html html81 -r
```

重载配置

```bash
sbin/nginx -s reload
```

**通过域名区分虚拟主机**

　　一个域名对应一个IP地址，一个IP地址可以被多个域名绑定。

![image-20200524042523946](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524042523946.png)

　　本地测试可以通过修改hosts文件，修改window的hosts文件：（C:\Windows\System32\drivers\etc）可以配置域名和ip的映射关系，如果hosts文件中配置了域名和ip的对应关系，不需要走dns服务器。

Nginx配置

```bash
  server {
        listen       80;
        server_name  www.taobao.com;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html-taobao;
            index  index.html index.htm;
        }
    }
    server {
        listen       80;
        server_name  www.baidu.com;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html-baidu;
            index  index.html index.htm;
        }
    }
```

　　域名配置，修改hosts文件：

```
192.168.25.148 www.taobao.com

192.168.25.148 www.baidu.com
```

# 5.反向代理和负载均衡

1. 什么是反向代理

   * 正向代理

   <img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524045412808.png" alt="image-20200524045412808" style="zoom:67%;" />

   * 反向代理

     <img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524045958689.png" alt="image-20200524045958689" style="zoom:67%;" />

　　反向代理服务器决定哪台服务器提供服务。反向代理服务器只提供请求的转发。

2. Nginx实现反向代理

　两个域名指向同一台nginx服务器，用户访问不同的域名显示不同的网页内容。

　两个域名是www.sina.com和www.souhu.com

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200524194650649.png" alt="image-20200524194650649" style="zoom: 67%;" />

第一步：安装两个tomcat，分别运行在8080和8081端口。

```bash
#不推荐，下载速度比较慢
wget https://downloads.apache.org/tomcat/tomcat-7/v7.0.104/bin/apache-tomcat-7.0.104.tar.gz
#可以windows手动下载下面这个国内链接，官方的太慢,下载后解压rar可以看到apache-tomcat-7.0.82.tar.gz
#https://download.csdn.net/download/qqch111111/10140427
#然后把apache-tomcat-7.0.82.tar.gz上传到linux
#linux解压后即可，视版本而定，我下载的是apache-tomcat-7.0.82.tar.gz，然后再复制一个tomcat
tar -xvf apache-tomcat-7.0.82.tar.gz
cp apache-tomcat-7.0.82.tar.gz tomcat7.0-1
mv apache-tomcat-7.0.82.tar.gz tomcat7.0-2
```

修改端口号

进入tomcat的conf目录

```bash
vim server.xml
```

第二步：启动两个tomcat。

进入tomcat的bin目录

```bash
./startup.sh
```

第三步：反向代理服务器的配置　

```json
upstream tomcat1 {
    server 192.168.25.148:8080;
    }
    server {
        listen       80;
        server_name  www.sina.com;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {#通过http://tomcat1关联upstream tomcat1
            proxy_pass   http://tomcat1;
            index  index.html index.htm;
        }
    }
    upstream tomcat2 {
    server 192.168.25.148:8081;
    }
    server {
        listen       80;
        server_name  www.souhu.com;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            proxy_pass   http://tomcat2;
            index  index.html index.htm;
        }
    }
```

第四步：nginx重新加载配置文件

```bash
/usr/local/nginx/sbin/nginx -s reload
```

第五步：配置域名

在hosts文件中添加域名和ip的映射关系

> 192.168.25.148 www.sina.com
>
> 192.168.25.148 www.souhu.com

3. **负载均衡**

　如果一个服务由多条服务器提供，需要把负载分配到不同的服务器处理，需要负载均衡。

```json
upstream tomcat2 {
  server 192.168.25.148:8081;
  server 192.168.25.148:8082;
 }
```

 可以根据服务器的实际情况调整服务器权重。权重越高分配的请求越多，权重越低，请求越少。默认是都是1

```json
upstream tomcat2 {
	server 192.168.25.148:8081;
	server 192.168.25.148:8082 weight=2;
}
```

负载均衡的5种策略

* 轮询（默认）
  每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器down掉，能自动剔除。 

* 指定权重

  指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的情况。 

* IP绑定 ip_hash

  每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。

* fair（第三方）

  按后端服务器的响应时间来分配请求，响应时间短的优先分配。 

* url_hash（第三方）

  按访问url的hash结果来分配请求，使每个url定向到同一个后端服务器，后端服务器为缓存时比较有效。

# 6.nginx负载均衡高可用

[参考教程链接](https://www.cnblogs.com/chinaifae/p/10576046.html)

##  6.1什么是负载均衡高可用

nginx作为负载均衡器，所有请求都到了nginx，可见nginx处于非常重点的位置，如果nginx服务器宕机后端web服务将无法提供服务，影响严重。

​     为了屏蔽负载均衡服务器的宕机，需要建立一个备份机。主服务器和备份机上都运行高可用（High Availability）监控程序，通过传送诸如“I am alive”这样的信息来监控对方的运行状况。当备份机不能在一定的时间内收到这样的信息时，它就接管主服务器的服务IP并继续提供负载均衡服务；当备份管理器又从主管理器收到“I am alive”这样的信息时，它就释放服务IP地址，这样的主服务器就开始再次提供负载均衡服务。

## 6.2keepalived+nginx实现主备

### 6.2.1 什么是keepalived

​     keepalived是集群管理中保证集群高可用的一个服务软件，用来防止单点故障。

​    Keepalived的作用是检测web服务器的状态，如果有一台web服务器死机，或工作出现故障，Keepalived将检测到，并将有故障的web服务器从系统中剔除，当web服务器工作正常后Keepalived自动将web服务器加入到服务器群中，这些工作全部自动完成，不需要人工干涉，需要人工做的只是修复故障的web服务器。

 

### 6.2.2 keepalived工作原理

​     keepalived是以VRRP协议为实现基础的，VRRP全称Virtual Router Redundancy Protocol，即虚拟路由冗余协议。

​     虚拟路由冗余协议，可以认为是实现路由器高可用的协议，即将N台提供相同功能的路由器组成一个路由器组，这个组里面有一个master和多个backup，master上面有一个对外提供服务的vip（VIP = Virtual IP Address，虚拟IP地址，该路由器所在局域网内其他机器的默认路由为该vip），master会发组播，当backup收不到VRRP包时就认为master宕掉了，这时就需要根据VRRP的优先级来选举一个backup当master。这样的话就可以保证路由器的高可用了。

​     keepalived主要有三个模块，分别是core、check和VRRP。core模块为keepalived的核心，负责主进程的启动、维护以及全局配置文件的加载和解析。check负责健康检查，包括常见的各种检查方式。VRRP模块是来实现VRRP协议的。

 

详细参考：Keepalived权威指南中文.pdf

 

### 6.2.3 keepalived+nginx实现主备过程

 

#### 6.2.3.1     初始状态

 

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322084134871-1710921278.png)

 

 

 

#### 6.2.3.2     主机宕机

 

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322084147321-428953105.png)

 

#### 1.2.3.3     主机恢复

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322084159355-468761131.png)

 

 

### 1.2.4 高可用环境

两台nginx，一主一备：192.168.101.3和192.168.101.4

两台tomcat服务器：192.168.101.5、192.168.101.6

 

 

### 1.2.5 安装keepalived

 

​     分别在主备nginx上安装keepalived，参考“安装手册”进行安装：

 

 

### 1.2.6 配置keepalived

#### 1.2.6.1     主nginx

修改主nginx下/etc/keepalived/keepalived.conf文件

 

! Configuration File for keepalived

 

\#全局配置

global_defs {

  notification_email { #指定keepalived在发生切换时需要发送email到的对象，一行一个

   XXX@XXX.com

  }

  notification_email_from XXX@XXX.com #指定发件人

  \#smtp_server XXX.smtp.com               #指定smtp服务器地址

  \#smtp_connect_timeout 30                #指定smtp连接超时时间

  router_id LVS_DEVEL                  #运行keepalived机器的一个标识

}

 

vrrp_instance VI_1 {

  state MASTER      #标示状态为MASTER 备份机为BACKUP

  interface eth0     #设置实例绑定的网卡

  virtual_router_id 51  #同一实例下virtual_router_id必须相同

  priority 100      #MASTER权重要高于BACKUP 比如BACKUP为99 

  advert_int 1      #MASTER与BACKUP负载均衡器之间同步检查的时间间隔，单位是秒

  authentication {    #设置认证

​    auth_type PASS   #主从服务器验证方式

​    auth_pass 8888

  }

  virtual_ipaddress {  #设置vip

​    192.168.101.100    #可以多个虚拟IP，换行即可

  }

}

 

 

#### 1.2.6.2     备nginx

修改备nginx下/etc/keepalived/keepalived.conf文件

**配置备nginx****时需要注意：需要修改state****为BACKUP , priority****比MASTER****低，virtual_router_id****和master****的值一致**

 

! Configuration File for keepalived

 

\#全局配置

global_defs {

  notification_email { #指定keepalived在发生切换时需要发送email到的对象，一行一个

  XXX@XXX.com

  }

  notification_email_from XXX@XXX.com                    #指定发件人

  \#smtp_server XXX.smtp.com               #指定smtp服务器地址

  \#smtp_connect_timeout 30                #指定smtp连接超时时间

  router_id LVS_DEVEL                  #运行keepalived机器的一个标识

}

 

vrrp_instance VI_1 {

  state BACKUP      #标示状态为MASTER 备份机为BACKUP

  interface eth0     #设置实例绑定的网卡

   virtual_router_id 51  #同一实例下virtual_router_id必须相同

  priority 99      #MASTER权重要高于BACKUP 比如BACKUP为99 

  advert_int 1      #MASTER与BACKUP负载均衡器之间同步检查的时间间隔，单位是秒

  authentication {    #设置认证

​    auth_type PASS   #主从服务器验证方式

​    auth_pass 8888

  }

  virtual_ipaddress {  #设置vip

​    192.168.101.100    #可以多个虚拟IP，换行即可

  }

}

 

### 1.2.7 测试

主备nginx都启动keepalived及nginx。

service keepalived start

./nginx

 

#### 1.2.7.1     初始状态

查看主nginx的eth0设置：

vip绑定在主nginx的eth0上。

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322085819802-1024552086.png)

 

 

查看备nginx的eth0设置：

vip没有绑定在备nginx的eth0上。

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322085834653-609538735.png)

 

 

访问ccc.test.com，可以访问。

 

#### 1.2.7.2     主机宕机

将主nginx的keepalived停止或将主nginx关机(相当于模拟宕机)，查看主nginx的eth0：

eth0没有绑定vip

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322085904753-2032053606.png)

 

注意这里模拟的是停止 keepalived进程没有模拟宕机，所以还要将nginx进程也停止表示主nginx服务无法提供。

 

查看备nginx的eth0：

vip已经漂移到备nginx。

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322085925219-601457404.png)

 

 

访问ccc.test.com，可以访问。

 

#### 1.2.7.3     主机恢复

将主nginx的keepalived和nginx都启动。

查看主nginx的eth0：

 

查看备nginx的eth0：

vip漂移到主nginx。

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322085958903-1395025710.png)

 

 

查看备nginx的eth0：

eth0没有绑定vip

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322090012845-770548687.png)

 

 

 

访问：ccc.test.com，正常访问。

**注意：主nginx****恢复时一定要将nginx****也启动（通常nginx****启动要加在开机启动中），否则即使vip****漂移到主nginx****也无法访问。**

 

### 1.2.8 解决nginx进程和keepalived不同时存在问题

#### 1.2.8.1     问题描述

​     keepalived是通过检测keepalived进程是否存在判断服务器是否宕机，如果keepalived进程在但是nginx进程不在了那么keepalived是不会做主备切换，所以我们需要写个脚本来监控nginx进程是否存在，如果nginx不存在就将keepalived进程杀掉。

 

#### 1.2.8.2     nginx进程检测脚本

​     在主nginx上需要编写nginx进程检测脚本（check_nginx.sh），判断nginx进程是否存在，如果nginx不存在就将keepalived进程杀掉，check_nginx.sh内容如下：

 

\#!/bin/bash

\# 如果进程中没有nginx则将keepalived进程kill掉

A=`ps -C nginx --no-header |wc -l`   ## 查看是否有 nginx进程 把值赋给变量A

if [ $A -eq 0 ];then          ## 如果没有进程值得为 零

​    service keepalived stop     ## 则结束 keepalived 进程

fi

 

将check_nginx.sh拷贝至/etc/keepalived下，

脚本测试：

将nginx停止，将keepalived启动，执行脚本：sh /etc/keepalived/check_nginx.sh

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322090112920-1486031264.png)

 

 

从执行可以看出自动将keepalived进程kill掉了。

 

#### 1.2.8.3     修改keepalived.conf

修改主nginx的keepalived.conf，添加脚本定义检测：

注意下边红色标识地方：

 

\#全局配置

global_defs {

  notification_email { #指定keepalived在发生切换时需要发送email到的对象，一行一个

   XXX@XXX.com

  }

  notification_email_from miaoruntu@itcast.cn #指定发件人

  \#smtp_server XXX.smtp.com               #指定smtp服务器地址

  \#smtp_connect_timeout 30                #指定smtp连接超时时间

  router_id LVS_DEVEL                  #运行keepalived机器的一个标识

}

vrrp_script check_nginx {

  script "/etc/keepalived/check_nginx.sh"     ##监控脚本

  interval 2                    ##时间间隔，2秒

  weight 2                    ##权重

}

vrrp_instance VI_1 {

  state MASTER      #标示状态为MASTER 备份机为BACKUP

  interface eth0     #设置实例绑定的网卡

  virtual_router_id 51  #同一实例下virtual_router_id必须相同

  priority 100      #MASTER权重要高于BACKUP 比如BACKUP为99

  advert_int 1      #MASTER与BACKUP负载均衡器之间同步检查的时间间隔，单位是秒

  authentication {    #设置认证

​    auth_type PASS   #主从服务器验证方式

​    auth_pass 8888

  }

  track_script {

​    check_nginx    #监控脚本

  }

  virtual_ipaddress {  #设置vip

​    192.168.101.100    #可以多个虚拟IP，换行即可

  }

 

}

 

修改后重启keepalived

 

#### 1.2.8.4     测试

回到负载均衡高可用的初始状态，保证主、备上的keepalived、nginx全部启动。

停止主nginx服务

 

观察keepalived日志：

tail -f /var/log/keepalived.log

 ![img](E:\我的坚果云\note\tool\nginx\nginx.assets\1248197-20190322090240393-339243265.png)

查看keepalived进程已经不存在。

查看eth0已经没有绑定vip。