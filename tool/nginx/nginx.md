Nginx与服务器集群

[视频教程链接](https://www.bilibili.com/video/BV1Xb411E7qf?p=17)

[笔记参考链接](https://www.cnblogs.com/zhaobingqing/p/7488660.html)

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

　　192.168.25.148 www.taobao.com

　　192.168.25.148 www.baidu.com