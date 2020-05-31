[视频课程链接](https://www.bilibili.com/video/BV11J411674t)

[参考笔记链接](https://www.bilibili.com/video/BV11J411674t/?p=22)

# 目录：

- [目录：](#目录)
- [1.Jenkins基本介绍](#1jenkins基本介绍)
  - [1.1Jenkins介绍](#11jenkins介绍)
- [2.Jenkins安装部署](#2jenkins安装部署)
  - [2.1Jenkins安装](#21jenkins安装)
  - [2.2汉化](#22汉化)
- [3.Jenkins插件管理](#3jenkins插件管理)
  - [3.1**jenkins插件下载镜像加速**](#31jenkins插件下载镜像加速)
  - [3.2手动安装](#32手动安装)
  - [3.3下载的插件直接装入linux中](#33下载的插件直接装入linux中)
- [4.Jenkins目录结构](#4jenkins目录结构)
- [5.Jenkins FreeStyle](#5jenkins-freestyle)
  - [5.1创建第一个freestyle](#51创建第一个freestyle)
- [6.jenkins整合gitlab](#6jenkins整合gitlab)
  - [6.1Jenkins获取Gitlab源代码](#61jenkins获取gitlab源代码)
- [7.jenkins自动部署html](#7jenkins自动部署html)
  - [7.1准备好环境 nginx + 2web节点](#71准备好环境-nginx--2web节点)
  - [7.2手动实现代码上线](#72手动实现代码上线)
  - [7.3将步骤写成SHell脚本](#73将步骤写成shell脚本)
  - [7.4将jenkins项目加入该脚本](#74将jenkins项目加入该脚本)
  - [7.5gitlab提交代码](#75gitlab提交代码)
  - [7.6tag包方式发布代码](#76tag包方式发布代码)
  - [7.7版本回退](#77版本回退)
- [8.jenkins 部署java项目](#8jenkins-部署java项目)
  - [8.1Java项目部署基本概述:](#81java项目部署基本概述)
  - [8.2手动部署Java项目至Web集群](#82手动部署java项目至web集群)
    - [8.2.1搭建Nginx+Tomcat集群架构](#821搭建nginxtomcat集群架构)
    - [8.2.2.开发提交Java源代码至gitlab仓库](#822开发提交java源代码至gitlab仓库)
    - [8.2.3手动获取Java源代码，然后使用maven进行编译?](#823手动获取java源代码然后使用maven进行编译)
    - [8.2.4将编译后的war包部署至Tomcat集群](#824将编译后的war包部署至tomcat集群)
    - [8.2.5最后通过浏览器访问测试，检测项目是否部署OK](#825最后通过浏览器访问测试检测项目是否部署ok)
  - [!img8.3自动部署Java项目至Web集群](#img-srce5ce68891e79a84e59d9ae69e9ce4ba915cnote5ctool5cjenkins5cjenkinsassets5c50dd0165dec60af49201b38afc809951_7f0131fd-d1c3-4957-82f2-cafbd51af622png-altimg83自动部署java项目至web集群)
    - [8.3.1Jenkins安装Maven插件](#831jenkins安装maven插件)
    - [8.3.2Jenkins配置JDK路径以及Manven路径](#832jenkins配置jdk路径以及manven路径)
    - [8.3.3创建Manven项目](#833创建manven项目)
- [9.Jenkins集成SonarQube代码质检](#9jenkins集成sonarqube代码质检)
  - [9.1SonarQube基本概述](#91sonarqube基本概述)
  - [9.2SonarQube服务安装](#92sonarqube服务安装)
    - [9.2.1环境规划](#921环境规划)
    - [9.2.2环境准备](#922环境准备)
  - [9.3SonarQube插件管理](#93sonarqube插件管理)
    - [9.31安装中文汉化插件](#931安装中文汉化插件)
    - [9.3.2安装代码检查插件](#932安装代码检查插件)
    - [9.3.3离线安装插件](#933离线安装插件)
  - [9.4SonarQube项目分析实践](#94sonarqube项目分析实践)
    - [9.4.1分析Java项目](#941分析java项目)
  - [9.5Jenkins集成SonarQube](#95jenkins集成sonarqube)
  - [9.6配置FreeStyle集成SonarQube](#96配置freestyle集成sonarqube)
  - [9.7配置Maven项目集成SonarQube](#97配置maven项目集成sonarqube)
- [10.Jenkins集成钉钉通知](#10jenkins集成钉钉通知)
- [11.Jenkins集成Pipenline流水线](#11jenkins集成pipenline流水线)
  - [11.1Pipenline基本概述](#111pipenline基本概述)
  - [11.2Pipenline语法示例](#112pipenline语法示例)
  - [11.3Pipenline 初次体验](#113pipenline-初次体验)
  - [11.4Pipeline构建html](#114pipeline构建html)
  - [11.5BlueOcan可视化](#115blueocan可视化)
- [12.Jenkins分布式构建](#12jenkins分布式构建)

# 1.Jenkins基本介绍

## 1.1Jenkins介绍

JENKINS 是一个用 JAVA 编写的开源的持续集成工具。

在与 ORACLE 发生争执后，项目从HUDSON 项目独立出来。 JENKINS 提供了软件开发的持续集成服务。

它运行在 SERVLET 容器中（例如 APACHE ，TOMCAT）。

它支持软件配置管理（SCM）工具（包括 ACCUREV SCM、CVS、SUBVERSION、GIT、PERFORCE、CLEARCASE 和 RTC） ，可以执行基于 APACHE ANT 和 APACHE MAVEN的项目，以及任意的 SHELL 脚本和 WINDOWS 批处理命令。JENKINS 的主要开发者是川口耕介。

JENKINS 是在 MIT 许可证下发布的自由软件。
官方网站：https://jenkins.io/
清华镜像地址：https://mirrors.tuna.tsinghua.edu.cn/jenkins/

# 2.Jenkins安装部署

## 2.1Jenkins安装

环境准备
小硬件需求：256M 内存、1G 磁盘空间，通常根据需要 Jenkins 服务器至少 1G+ 内存，50G+磁盘空间。

软件需求：由于 jenkins 是使用 java 语言编写的，所以需要安装 java 运行时环境（jdk）

**安装 jdk**

可以使用 YUM 方式安装安装 open JDK1.8 版本

```bash
yum install java -y
java -version#查看是否安装成功
```

 **安装 jenkins**

[参考教程链接](https://blog.csdn.net/qiuyeyijian/article/details/104570642)

下载rpm包

这是目前最新 jenkins LTS版本: 可以在去 [清华大学镜像站](https://mirrors.tuna.tsinghua.edu.cn/jenkins/redhat-stable/) 看一下，替换成最新的链接

```bash
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/redhat-stable/jenkins-2.204.3-1.1.noarch.rpm
```

**安装**

```bash
sudo yum install jenkins-2.204.3-1.1.noarch.rpm
```

**修改端口**
jenkins 默认8080端口，如果和别的程序冲突，可以修改端口号

```bash
vim /etc/sysconfig/jenkins
```

![image-20200531191345616](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531191345616.png)

可以看到已经修改了端口号

```bash
ps -ef | grep jenkins
```

**开启服务**

```
systemctl start jenkins.service
```

获取访问秘钥，复制下来，接下来要验证

```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```

**修改默认镜像源**

```
vim /var/lib/jenkins/hudson.model.UpdateCenter.xml
```

将 url 修改为 清华大学官方镜像：https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json

```xml
<?xml version='1.1' encoding='UTF-8'?>
<sites>
  <site>
    <id>default</id>
    <url>https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json</url>
  </site>
</sites>
```

**访问**
http://ip地址:端口号
例如我这台机器：http://192.168.155.130:10240

**配置 jenkins**

在搭建Jenkins环境时，由于系统JAVA_HOME配置的问题，导致tomcat启动不起来，报了如下错误。

原因是我的JAVA_HOME配置有问题。

因为当时是通过yum install java安装的，虽然说不用配置环境变量，但是有的应用如tomcat是需要依赖JAVA_HOME等环境变量的，这就涉及到一个问题，如何找到正确的JAVA_HOME位置。

```
[root@localhost apache-tomcat-7.0.78]# which java
/usr/bin/java
[root@localhost apache-tomcat-7.0.78]# ls -lrt /usr/bin/java
lrwxrwxrwx. 1 root root 22 7月  23 14:43 /usr/bin/java -> /etc/alternatives/java
[root@localhost apache-tomcat-7.0.78]# ls -lrt /etc/alternatives/java
lrwxrwxrwx. 1 root root 73 7月  23 14:43 /etc/alternatives/java -> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre/bin/java
```

可以看到，都是一系列的软连接，最终我们配置如下环境变量，vi /etc/profile

追加：

```bash
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

使配置生效.

```bash
source /etc/profile
```

查看当前Java的环境变量  

```bash
echo $JAVA_HOME
#/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.el7_8.x86_64
```

 编辑/etc/init.d/jenkins文件

```bash
vim /etc/init.d/jenkins
```



**设置开机自启**

```bash
[root@ci-node2 src]# systemctl enable jenkins
```

Jenkins 默认监听 8080，服务启动后我们可以在浏览器中输入 http://您服务器的 ip地址:8080 访问 jenkins 服务

**安装完jenkins无法访问的问题**

[参考教程链接](https://www.cnblogs.com/Ivan-Wu/p/10451376.html)

![image-20200531191450957](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531191450957.png)



当我们兴高采烈的安装完jenkins的时候，然后发现并不能访问，真是气死了。

这个时候就要一步一步检测问题出在哪。

首先我们需要确定jenkins是否启动了，可以通过

```bash
systemctl status jenkins
```

查看jenkins的状态：

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1461475-20190228161350029-7125828.png)

这里jenkins的状态是正在运行的，那么既然是运行的，为何无法访问呢。

下一步就是检查防火墙了，

```
systemctl status firewalld
```

这里发现防火墙正运行，应该是没有开放jenkins的端口：

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1461475-20190228162441345-1427657656.png)

我们先用下面的代码来查看有没有开放我们设置的jenkins的端口：

```
firewall-cmd --list-ports
```

如果发现没有jenkins的端口，则用

```
firewall-cmd --permanent --zone=public --add-port=8080/tcp
```

开启已经配置好的jenkins的端口，然后在重启防火墙，注意一定要重启防火墙！

```
systemctl reload firewalld
```

然后继续访问jenkins，发现还是不可以访问，这里博主用的是阿里云的服务器，会自带防火墙，需要去阿里云-》控制台=》轻量应用服务器-》防火墙 中开放端口才可以访问：

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1461475-20190228163603024-555421978.png" alt="img" style="zoom:67%;" />

其他服务器不知道有没有这种设定，阿里云需要设置，如果使用的是云服务器ecs，则需要进入安全组进行配置。

**需要解锁jenkins**

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406185302570-115789958.png" alt="img" style="zoom:50%;" />

**获取访问秘钥**

```bash
[root@ci-node2 src]# cat /var/lib/jenkins/secrets/initialAdminPassword
d329e9ec1a4a42adba9122562c0b8186
```

根据页面提示，服务器对应的位置找到初始化的密码，复制密码粘贴在此页面的文本框中，点击 continue 按钮继续

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406185516959-1400050522.png" alt="img" style="zoom:50%;" />

 

 

 

 <img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406185734171-661194646.png" alt="img" style="zoom:50%;" />

此页面要用户选择初始化安装的插件，这两种方式我们都不用，我们选择跳过此步，后面我们采用其他方式安装插件。
<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406190307807-1452138565.png" alt="img" style="zoom: 50%;" />

点击完成 jenkins 安装配置， 

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406190541215-1540053537.png" alt="img" style="zoom:50%;" />

进入 Jenkins 主页面

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406190652010-671345240.png)

 

 

 由于默认 jenkins 的密码较复杂，所以我首先更改 admin 用户的密码。 

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406190837077-1438272587.png)

 



 

点击右上解用户，下拉选择设置选项，进入用户设置页面、

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406191053565-849505580.png)

 



 重复输入新密码后，点击 save 保存更改。

## 2.2汉化

Jenkins 及其插件的简体中文语言，搜索关键词localization，装完这个插件无需设置重启后即可以了

https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/localization-zh-cn/latest/localization-zh-cn.hpi

# 3.Jenkins插件管理

## 3.1**jenkins插件下载镜像加速**

[参考教程链接](https://blog.csdn.net/you227/article/details/81076032)

jenkins插件清华大学镜像地址

```
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
```

更换地址方法

进入jenkins系统管理

进入插件管理

![image-20200531191921292](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531191921292.png)

点击高级，修改升级站点的地址为清华大学镜像地址

![image-20200531192045279](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531192045279.png)

有的时候更换镜像之后下载插件还是走的官方地址

原因：配置了清华的镜像之后他还是走的jenkins官方去拉取的，是因为清华镜像的配置文件里面的插件下载地址并不是指向的清华镜像，仍然指向的是jenkins官方的地址，我的解决方案是把jenkins官方的地址通过nginx吞掉直接转发到清华镜像去。

host配置

```bash
127.0.0.1 updates.jenkins-ci.org
```

nginx配置

```bash
rewrite ^/download/plugins/(.*)$ https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/$1? last;
```

或

```bash
location /download/plugins
{
    proxy_next_upstream http_502 http_504 error timeout invalid_header;
    proxy_set_header Host mirrors.tuna.tsinghua.edu.cn;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; 
    rewrite /download/plugins(.*) /jenkins/plugins/$1 break;
    proxy_pass https://mirrors.tuna.tsinghua.edu.cn;
}
```

解决：可以通过在nginx上配置代理，将官方的插件下载地址映射到 `https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/`
这样下载插件也会从镜像网站下载

## 3.2手动安装

除了上面的插件安装方法，Jenkins 还为我们提供了手工安装插件的方式，特别是在国内，由于网络的原因，有时候我们使用上述方法安装插件会经常不成功，所以我们可以采用下载插件，然后再上传的方式来安装插件。
官方的插件下载地址：http://updates.jenkins-ci.org/
国内的源：https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/

如果是在官方网站下载插件，好下载与你 jenkins 版本对应的插件，

如果是在清华镜像下载插件，则不存在版本的问题。下载后得到的一个以.hpi 为扩展名的文件，

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406232015049-1212613561.png)

 下载 backup.hpi 后，我们手动安装 backup 插件，进入到插件管理页面

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200406232835003-719708940.png)

按上图提示，上传完成后，重新启动 jenkins，完成插件的安装。

## 3.3下载的插件直接装入linux中

[参考教程链接](https://www.cnblogs.com/zzzynx/p/10920169.html)

```
ls /var/lib/jenkins/plugins/
```

下面这个链接已经包含了jenkins常用的插件，如果想自己下载的话也可以去官网自己下载：
链接：https://pan.baidu.com/s/1kjuN4IYdRp7WgkT5wau5Aw 提取码：tv7l
官网插件链接：https://plugins.jenkins.io/

```bash
tar xf plugins-2.138.3.tar.gz
mv plugins/* /var/lib/jenkins/plugins/
chown -R jenkins.jenkins /var/lib/jenkins/
```

重启jenkins

```bash
systemctl restart jenkins
```

查看日志

```bash
tail -f /var/log/jenkins/jenkins.log
```

# 4.Jenkins目录结构

[参考教程链接](https://blog.csdn.net/lijing742180/article/details/88544279)

> 参考书籍：《jenkins权威指南》

Jenkins 的所有重要数据都存放在它的主目录中，即 JENKINS_HOME。

1. **JENKINS_HOME**

* 默认位于当前用户主目录下的 .jenkins 隐藏目录中，即 ~/.jenkins。
* 可通过修改环境变量 JENKINS_HOME 的值，来更改 jenkins 主目录。
* 其中存储了关于构建服务器的配置信息、构建作业、构建产物、插件和其它有用的信息。
* 这个目录将会占用大量的磁盘空间。

2. **JENKINS_HOME 目录结构**

（此处只对 JENKINS_HOME 中的重要目录进行说明，并未完全列出。）

.jenkins：

config.xml：jenkins 的核心配置文件

hudson.tasks.Maven.xml： Maven 的安装细节

....xml： 其它各种工具的配置信息

fingerprints

跟踪人工操作的痕迹
jobs：构建作业的配置细节，及构建产物和数据

workspace：jenkins 对当前作业进行构建的地方

包含 jenkins 检验过的源码、构建本身生成的所有文件
builds：包含当前作业的构建历史

config.xml：存放当前作业的所有配置细节

nextBuildNumber：下一次构建的 number

lastStable：最后一个稳定构建的链接（成功的构建）

lastSuccessful：最近成功的构建链接（没有任何编译错误）

plugins：存放所有已安装的插件

更新 jenkins 不需要重新安装插件
users：当使用 jenkins 本地用户数据库时，用户信息会存放在这个目录下

updates：存放可用的插件更新

userContent：存放用户自己为 jenkins 服务器定制化的一些内容

war：存放扩展的 web 应用程序，当以单机应用程序的形式运行 jenkins 时，会把 web 应用程序解压到这个目录。

# 5.Jenkins FreeStyle

## 5.1创建第一个freestyle

新建任务 -->> 输入一个任务名称 -->> 构建一个自由风格的软件项目 --->> 确定 -->>

丢弃旧的构建：保持构建的最大个数10

 构建 -->> 执行Shell

```
echo "Build is ok"
touch file
```

应用 -->> 保存

返回主页-->> 立即构建

# 6.jenkins整合gitlab

[参考教程链接](https://www.cnblogs.com/mingerlcm/p/12681286.html)

## 6.1Jenkins获取Gitlab源代码

做jobs拉取gitlab源代码 部署到生产环境上

点配置

在gitlab上创建一个仓库 以html代码仓库的

我们这次通过导入方式，从别的地方导入仓库进来 

我们从码云 拿到项目的url地址导入 拿到url回到gitlab

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411171954357-568493461.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411173818571-840813325.png)

 选择私有 点击创建仓库

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411173917477-168033937.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411174238240-1252980020.png)

仓库创建好了以后，就有地址了，使用jenkins把这个仓库地址拉到jenkins上去，然后在jenkins 把HTML代码部署到指定的服务器上 跑起来

最终目的：gitlab仓库上的代码拉到我们jenkins上，然后用jenkins发到另外一台服务器上去进行部署

我们使用上面的 job 进行配置，在"源码管理"部分配置拉取 Gitlab 上的 monitor 仓库，该仓库是一个纯 html 代码项目，首先在 Gitlab 上复制仓库地址
![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411175339925-1218682436.png)

然后回到 Jenkins 上 My-freestyle-job 配置页面，下拉到"源码管理"部分，勾选 git选项
![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411180115662-762215824.png)

 

如果遇到这种错误

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411213931057-348962235.png)

jenkins服务器 要安装git

 粘贴完仓库地址后，出现如下图所示错误提示， 

 ![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411225120399-82488658.png)

根据提示信息显示为 key 认证失败，因为我们使用的 SSH 方式连接仓库，所以需要配置SSH认证，jenkins这台机器没有做和gitlab的认证，没有做认证，实际上在前面我们学习Gitlab的时候，我们已经配置了ci-node2这台机子的root用户的公钥在 Gitlab 上的 dev 用户

，为什么我们这里还需要认证？下面我们来查看一下Jenkins 服务的启动用户，

```
[root@ci-node2 ~]# ps aux |grep jenkins
root      72936  0.0  0.1 112712   964 pts/0    R+   00:50   0:00 grep --color=auto jenkins
jenkins  108096  0.1 55.4 2339100 370532 ?      Ssl  Apr07   6:01 /etc/alternatives/java -Dcom.sun.akuma.Daemon=daemonized -Djava.awt.headless=true -DJENKINS_HOME=/var/lib/jenkins -jar /usr/lib/jenkins/jenkins.war --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war --daemon --httpPort=8080 --debug=5 --handlerCountMax=100 --handlerCountMaxIdle=20
```

[配置ssh密钥教程链接]([https://github.com/zxc054/note/blob/master/tool/git/gitLab.md#531%e9%85%8d%e7%bd%ae-sshkey](https://github.com/zxc054/note/blob/master/tool/git/gitLab.md#531配置-sshkey))

而我们在Gitlab上配置的root用户的公钥，现在我们有两种方式解决认证失败的问题，
1、在jenkins上配置使用root用户的私钥连接Gitlab，

2、配置使用root用户启动jenkins。
下面我们先来看第一种方式

**在jenkins上配置使用root用户的私钥连接Gitlab**

把ci-node2主机的公钥配给gitlab 的ssh key上 （把之前gitlab ci-node2绑定dev用户的key删除），绑定gitlab的root用户上 ，gitlab 一个用户可以配多个key

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411230913761-70184309.png)

如果配不上就是 之前添加过了，不让重复添加，一个可以在gitlab是唯一的

现在ci-node2和gitlab 配置好权限了 把root权限打通

还会出现key认证失败，因为以jenkins用户启动jenkins

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411233551283-423938946.png)

 

进入认证添加页面

让jenkins拿着root用户私钥去和gitlab 公钥对

```bash
#输入密钥获取私钥，然后复制
cat /root/.ssh/id_rsa
```

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411235619528-1021790110.png)

根据提示添加用户认证后，回到配置仓库页面，选择认证方式为新添加的认证，错误消失。 认证通过了
![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200411235800381-1888152627.png)

如果还报错，有可能是你的linux上没有安装git

```bash
git clone git@192.168.62.3:testgroup/monitor.git
```

重新选择认证方式为新添加的认证，稍等几秒钟，错误消失

第二种方法：以root用户启动jenkins**

接下来我们更改 Jenkins 服务的启动用户为 root，编辑/etc/sysconfig/jenkins 文件，
配置 Jenkins 的启动用户为 root，然后重启 Jenkins 服务

```
[root@ci-node2 ~]# cat /etc/sysconfig/jenkins |grep -v "^#" |grep -v ^$
JENKINS_HOME="/var/lib/jenkins"
JENKINS_JAVA_CMD=""
JENKINS_USER="root"
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true"
JENKINS_PORT="8080"
JENKINS_LISTEN_ADDRESS=""
JENKINS_HTTPS_PORT=""
JENKINS_HTTPS_KEYSTORE=""
JENKINS_HTTPS_KEYSTORE_PASSWORD=""
JENKINS_HTTPS_LISTEN_ADDRESS=""
JENKINS_DEBUG_LEVEL="5"
JENKINS_ENABLE_ACCESS_LOG="no"
JENKINS_HANDLER_MAX="100"
JENKINS_HANDLER_IDLE="20"
JENKINS_ARGS=""
```



```
[root@ci-node2 ~]# ps aux |grep jenkins
root     121117  1.8 54.8 2333688 366280 ?      Ssl  Apr11   0:40 /etc/alternatives/java -Dcom.sun.akuma.Daemon=daemonized -Djava.awt.headless=true -DJENKINS_HOME=/var/lib/jenkins -jar /usr/lib/jenkins/jenkins.war --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war --daemon --httpPort=8080 --debug=5 --handlerCountMax=100 --handlerCountMaxIdle=20
root     123127  0.0  0.1 112712   968 pts/0    R+   00:16   0:00 grep --color=auto jenkins
```

 

回到 job 的源码配置页面

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200412002153334-320062673.png)

 



我们看到不选择任何认证，也不会出现报错。

总结： 

配置git仓库认证一般报两种错误

1.没有安装git 报git命令执行错误

2.权限认证错误

 

而我们在Gitlab上配置的root用户的公钥，现在我们有两种方式解决认证失败的问题，
1、在jenkins上配置使用root用户的私钥连接Gitlab，

2、配置使用root用户启动jenkins。

 

配置完成选择保存

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200412000718081-1425042677.png)

 

 

保存配置后，回到 job 主页面，点击"立即构建"，构建完成后，我们在工作空间内可以看到从 Gitlab 仓库拉到的代码



![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200412003045729-906582178.png)

 

 同时我们在"console output"页面可以看到整个控制台输出内容 

 

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1137246-20200412003238270-1475453484.png)

 



 我们去客户端 去workspace 工作区目录看看

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531192621337-1590924931274.png)

 代码都拉到了

# 7.jenkins自动部署html

[参考教程链接](https://blog.csdn.net/chengyinwu/article/details/103056605)

## 7.1准备好环境 nginx + 2web节点

查看是否安装nginx

```bash
#rpm -ql nginx
#查看是否安装nginx
#用ps -ef列出进程列表，然后通过grep过滤
ps -ef | grep nginx
#查看nginx的进程id
ps -C nginx -o pid
```

若没有，请安装nginx，[安装教程传送门]([https://github.com/zxc054/note/blob/master/tool/nginx/nginx.md#31%e5%ae%89%e8%a3%85](https://github.com/zxc054/note/blob/master/tool/nginx/nginx.md#31安装))

或者直接yum安装

```bash
yum install nginx -y
```

## 7.2手动实现代码上线 

**提炼步骤**

```bash
1.git 克隆代码
2.进入项目目录给代码进行打包 web     web_2019xx.tar.gz  
3.使用scp推送到web集群
4.登录web集群机器，创建代码存放的目录，然后解压
5.执行软连接操作
6.需要重载服务
```

**手动搭建**

```bash
tar czf /opt/web_monitor_$(date +%F).tar.gz ./*
for host in {7..8};do scp /opt/web_monitor_2019-11-13.tar.gz  root@172.16.1.${host}:/opt ; done      #建议做免密

cd /opt
mkdir web_monitor_2019-11-13
tar xf web_monitor_2019-11-13.tar.gz -C web_monitor_2019-11-13/
rm -rf /code/web/
ln -s /opt/web_monitor_2019-11-13 /code/web
systemctl restart nginx
```

## 7.3将步骤写成SHell脚本

先将192.168.62.3机器的公钥拷贝过来

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.62.3
```

编写shell脚本

```bash
mkdir /scripts
vim /scripts/deploy_html.sh
```

```bash
#!/usr/bin/bash
Date=$(date +%F-%H-%M)
project_name=monitor
pkg_name=${project_name}-web-${Date}
source_dir=/opt
target_dir=/data/nginx
#空格加多个ip
web_server="192.168.62.3"

tar_code (){
#1.进入到代码的目录
#2.打包
cd $WORKSPACE && \
tar czf ${source_dir}/${pkg_name}.tar.gz ./*	
}

scp_code (){
#3.使用scp推送代码至web集群
for i in ${web_server}
do
	scp -rp ${source_dir}/${pkg_name}.tar.gz root@${i}:${target_dir}
	ssh root@${i} "cd ${target_dir} && \
	mkdir -p ${pkg_name} && \
	rm -f ${target_dir}/${project_name} && \
	tar xf ${pkg_name}.tar.gz -C ${pkg_name} && \
	ln -s ${target_dir}/${pkg_name} ${target_dir}/${project_name}" 
done
}

deploy (){
	tar_code
	scp_code
}
	deploy
#chmod +x /scripts/deploy_html.sh 
```

## 7.4将jenkins项目加入该脚本

```bash
#修改jenkins用户为root
ps aux|grep jenkins
vim /etc/sysconfig/jenkins
#JENKINS_USER="root"
systemctl restart jenkins
#重启的过程很慢，可以查看一下日志，出现Jenkins is fully up and running，表示启动成功
tail -f /var/log/jenkins/jenkins.log
#jenkins将私钥推送至web集群，实现免密登录
```

jenkins上项目配置如下命令

```bash
sh -x /scripts/deploy_html.sh
```

![image-20200529001346644](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200529001346644.png)

## 7.5gitlab提交代码

自动触发构建（自动发布代码）

![image-20200528182939380](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200528182939380.png)

![image-20200528220828868](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200528220828868.png)

![image-20200528221032259](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200528221032259.png)

![image-20200528182654760](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200528182654760.png)

![image-20200528221142776](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200528221142776.png)

```bash
windows测试自动构建效果：
vim index.html   修改网站标题
git add .
git commit -m "第一次修改"
git push -u origin master
这时发现jenkins不用手动构建就可以实现代码发布！！！
```

## 7.6tag包方式发布代码

安装Git Parameter，我们直接搜索Git Parameter安装，重启即可

构建Git Parameter参数

![image-20200530144151052](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530144151052.png)

![image-20200530144609400](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530144609400.png)

Git添加构建的参数

![image-20200530144805534](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530144805534.png)

用Git给项目打tag

```bash
git pull origin master
git tag -a "V1.1" -m "增加V1.1标签"
git tag
git push origin V1.1
```

![image-20200530150155928](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530150155928.png)

## 7.7版本回退

![image-20200530150442382](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530150442382.png)

优化脚本

```bash
[root@jenkins scripts]# vim html_deploy_tag_rollback.sh     #优化脚本，支持回退
#!/bin/bash
DATE=$(date +%Y-%m-%d-%H-%M-%S)
web_server="192.168.1.8"
Sdir=/opt
Ddir=/code
Name=${DATE}-${git_version}                 #${git_version}是在jenkins界面定义的变量

#1)进入项目目录，将内容进行打包
#${WORKSPACE}是Jenkins的内置变量，表示构建目录的绝对路径
get_code(){
        cd ${WORKSPACE} && \
        tar zcf ${Sdir}/web-${Name}.tar.gz ./*
}
#2）将内容通过scp复制到web网页目录
scp_web_server(){
for hosts in ${web_server}
do
        scp ${Sdir}/web-${Name}.tar.gz root@${hosts}:/opt
        ssh root@${hosts} "mkdir -p ${Ddir}/web-${Name} && \
                        tar zxf ${Sdir}/web-${Name}.tar.gz -C ${Ddir}/web-${Name}
                        rm -rf ${Ddir}/web && \
                        ln -s ${Ddir}/web-${Name} ${Ddir}/web"
done
}

rollback(){
back_file=$(ssh root@${web_server} "find /code/ -maxdepth 1 -type d -name "web-*-${git_version}"")
for hosts in ${web_server}
do
        ssh root@${hosts} "rm -rf ${Ddir}/web && \
           ln -s ${back_file} ${Ddir}/web"
done
}

deploy(){
        get_code
        scp_web_server
}
#判断之前是否部署过该版本的commit，如果没有部署则部署，如果有则提示已经部署过然后退出
#如果是回退，则不受限制
if [ ${deploy_env} == "deploy" ];then
        if [ ${GIT_COMMIT} == ${GIT_PREVIOUS_SUCCESSFUL_COMMIT} ];then
                echo "你已经部署过该${git_version}版本"
                exit 1
        else
                deploy
        fi

elif  [ ${deploy_env} == "rollback" ];then
        rollback
fi
[root@jenkins scripts]# chmod +x html_deploy_tag_rollback.sh 
```

![image-20200530151417358](E:\我的坚果云\note\tool\jenkins\jenkins.assets\image-20200530151417358.png)

![image-20200530152155832](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530152155832.png)

![image-20200530152307174](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530152307174.png)

# 8.jenkins 部署java项目

[参考教程链接](http://www.mamicode.com/info-detail-2817295.html)

[参考教程链接](https://blog.chenjiangfeng.cn/?p=531)

## 8.1Java项目部署基本概述:

1. 什么是Java项目

   简单来说就是使用Java编写的代码，我们将其称为Java项目。

2. 为什么Java项目需要使用Maven编译

   由于Java编写的代码是无法直接在服务器上运行，需要使用maven工具进行打包。

   简单理解：Java源代码就像汽车的一堆散件，必须组装才是一辆完整的汽车。这里的组装汽车可以理解是Maven编译的过程。

3. 手动实现Java项目构建

   首先大家对Java项目不熟悉，其次要想实现自动化发布代码，必须先会手动。所以我们会先拿到源代码，然后提交至gitlab，使用maven手动构建最后推送war包至Tomcat发布

4. 手动实现Java项目架构图

   ![image-20200530200903080](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200530200903080.png)

**源码包  jar包 war包**
   1.JAVA源码包--编译--> war --编译的过程中需要依赖--> jar包
   2.JAVA源码包也可以编译生成 jar包 (需要被依赖才会启用  -->不能独立运行)
   3.有的jar可以独立运行  java -jar xx.jar

## 8.2手动部署Java项目至Web集群

环境准备

| 操作系统  | IP地址        | 主机名 | 备注         |
| --------- | ------------- | ------ | ------------ |
| Centos7.6 | 192.168.1.100 | lb01   | nginx        |
| Centos7.6 | 192.168.1.101 | web01  | nginx+tomcat |
| Centos7.6 | 192.168.1.102 | web02  | nginx+tomcat |
| Centos7.6 | 192.168.1.104 | mysql  | mariadb      |

### 8.2.1搭建Nginx+Tomcat集群架构

配置负载均衡

```bash
vim /etc/nginx/conf.d/proxy_java.chenjf.com.conf 
```

```bash
upstream java {
   server 192.168.1.101:8080;
   server 192.168.1.102:8080;
}
server {
    listen 80;
    server_name java.chenjf.com;
    location / {
        proxy_pass http://java;
        proxy_set_header Host $http_host;
    }
}
```

启动服务

```bash
systemctl restart nginx
systemctl enable nginx
```

安装nginx+tomcat软件

```bash
yum -y install java-1.8.0-openjdk
mkdir /soft  &&\ cd /soft
wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz
tar xf apache-tomcat-9.0.24.tar.gz 
ln -s /soft/apache-tomcat-9.0.24 /soft/tomcat
 /soft/tomcat/bin/startup.sh 
```

安装数据库

```bash
yum -y install mariadb
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation 
mysql -u root -p 
```

### 8.2.2.开发提交Java源代码至gitlab仓库  

1. 首先在gitlab创建项目仓库

   ![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_2d092f0a-5ea2-4c3b-8837-26d736e1f192.png)

   ![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_b00c1d9a-9f65-473e-b7b1-9218909e2456.png)

   程序员上传代码

   ```bash
   [root@gitlab hello-world-war]# git init 
   [root@gitlab hello-world-war]# git remote add origin git@gitlab.chenjf.com:devops/hello-world.git
   [root@gitlab hello-world-war]# git add .
   [root@gitlab hello-world-war]# git commit -m "Inital commit"
   ```

   刷新查看远程仓库

   ![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_cfc8662a-3bbc-4ce6-bd46-b16d94478ef3.png)

### 8.2.3手动获取Java源代码，然后使用maven进行编译?

1. 由于maven编译工具需要依赖Java，所以需要先安装JDK

```bash
yum -y install  java-1.8.0-openjdk
```

2. 安装maven编译打包工具

```bash
yum install maven java -y
```

如果需要高版本maven按如下步骤操作：

```bash
#1.下载maven软件包
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
#2.安装maven软件包
tar xf apache-maven-3.6.2-bin.tar.gz
ln -s apache-maven-3.6.2-bin /usr/local/maven
/usr/local/maven/bin/mvn -v
#3.配置环境变量
export PATH=apache-maven-3.6.2-bin/bin/:$PATH
mvn -v
```

拉取gitlab代码，然后手动编译成war包（需要确保主机有获取代码权限）

```bash
[root@jenkins ~]# git clone git@gitlab.chenjf.com:devops/hello-world.git

[root@jenkins ~]# cd hello-world/

[root@jenkins hello-world]# mvn package -Dmaven.test.skip=ture  ##跳过测试用例
```

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_874eb13d-a376-43f8-8bd1-259cb023e785.png)

Java项目在编译过程中，需要安装很多依赖，依赖都会上Maven官方下载。如果项目依赖的jar包很多，网络较差，那么需要很久的时间。建议将下载地址调整为阿里云，具体操作如下：

查看下maven安装位置下的 conf/settings.xml 

```bash
#查找maven安装位置，可以看到为/usr/share/maven
rpm -ql maven
vim /usr/share/maven/conf/settings.xml
```

在159行上面添加如下内容，在`</mirrors>`标签上面添加如下内容，maven配置为阿里云国内仓库

```xml
  <mirror>
   <id>alimaven</id>
   <name>aliyun maven</name>
   <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
   <mirrorOf>central</mirrorOf>
  </mirror>
```

```bash
mvn clean package -Dmaven.test.skip=true#跳过测试
```

### 8.2.4将编译后的war包部署至Tomcat集群

1. 推送war包

```bash
[root@jenkins hello-world]# for i in {101..102};do scp target/hello-world-war-1.0.0.war root@192.168.1.$i:/soft/tomcat/webapps/ROOT.war;done
```

2. 重启两台tomcat

```bash
[root@web01 ~]# /soft/tomcat/bin/shutdown.sh && /soft/tomcat/bin/startup.sh 

[root@web02 ~]# /soft/tomcat/bin/shutdown.sh && /soft/tomcat/bin/startup.sh 
```

### 8.2.5最后通过浏览器访问测试，检测项目是否部署OK

## ![img](E:\我的坚果云\note\tool\jenkins\jenkins.assets\50dd0165dec60af49201b38afc809951_7f0131fd-d1c3-4957-82f2-cafbd51af622.png)8.3自动部署Java项目至Web集群

前面我们简单的了解了手动如何发布Maven项目，不难发现这个过程非常机械化。所以接下来看看如何通过Jenkins实现Maven自动化发布。

部署流程如下图所示：

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_0237055f-24dc-40ba-8e83-cdc2322b1a1e.jpg)

### 8.3.1Jenkins安装Maven插件

安装Maven Integration插件，这样才能使用Jenkins构建一个Maven的项目

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_bf4832f1-fda9-4eb4-8720-7d32cfdb5709.png)

### 8.3.2Jenkins配置JDK路径以及Manven路径

Jenkins配置JDK路径（注意我的JDK是使用yum安装的，所有路径有差异） 系统管理–>全局工具配置

使用mvn –version查看JAVA_HOME

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_e1032eab-2458-4160-876d-bb6f1cd4669f.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_7688a9c9-3cab-448c-a8ee-d0361436fed0.png)

Jenkins配置Maven路径（注意我的maven是使用yum安装的，所有路径有差异）

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_015854ef-9e4f-4276-8fa6-1ce26b65c0f1.png)

### 8.3.3创建Manven项目

创建一个任务名称

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_efa477af-6a5a-4ab0-9717-5e18f7dfddde.png)

添加描述信息

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_ec661466-965d-44fc-974f-1227eb85fccb.png)

配置参数化构建过程

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_0f002858-8396-45be-b7af-882e04c714b0.png)

配置源码管理–>Java项目地址

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_18d0bb0b-0731-42c0-b094-ac11dc5121d8.png)

配置构建后的操作，并配置Build–>maven构建项目，然后保存尝试构建测试是否能生成war包。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_98b6bfc7-935c-4ff4-b971-0f7b1d676eb5.png)

修改页面代码

```bash
[root@gitlab hello-world-war]# vim src/main/webapp/index.jsp 

[root@gitlab hello-world-war]# git add .

[root@gitlab hello-world-war]# git commit -m "v1.1"

[root@gitlab hello-world-war]# git push -u origin master 

[root@gitlab hello-world-war]# git tag -a v1.1 -m "v1.1"

[root@gitlab hello-world-war]# git push origin v1.1
```

在打一个标签

```bash
[root@gitlab hello-world-war]# vim src/main/webapp/index.jsp 

[root@gitlab hello-world-war]# git add .

[root@gitlab hello-world-war]# git commit -m "哆啦A峰 V1.2"

[root@gitlab hello-world-war]# git push -u origin master 

[root@gitlab hello-world-war]# git tag -a V1.2 -m "V1.2"

[root@gitlab hello-world-war]# git push origin V1.2
```

基于版本发布代码

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_78d76a4d-330e-4ad3-8bb3-750a1fc24b87.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_863882ad-bdcb-416a-9657-96b9a02920f3.png)

构建成功

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_b1a24ea1-6c79-4a43-8bc4-5fab4f03c19a.png)

web测试

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_94b957a7-2983-4977-89ed-e94e659ec330.png)

回退编写脚本

```bash
[root@jenkins scripts]# cat java_jenkins_tag_rollback.sh
```

```bash
# !/usr/bin/bash
DATE=$(date +%Y-%m-%d-%H-%M-%S)
WEB_SERVER="192.168.1.101 192.168.1.102"
Sdir="/opt"
Ddir="/soft/tomcat/webapps"
Name="${DATE}-${git_version}"
#1.将代码进行打包
get_code_tar() {
  cd ${WORKSPACE} 
}
#2.将代码推送至web服务器，解压，然后软链接
scp_code_web(){
  for host in $WEB_SERVER
  do
#将Jenkins上打包好的压缩包拷贝至web服务器组
scp target/*.war root@${host}:${Sdir}/ROOT-${Name}.war
ssh root@${host} "mkdir -p ${Ddir}/ROOT-${Name} &&\
 unzip /opt/ROOT-${Name}.war -d ${Ddir}/ROOT-${Name} && \
 rm -rf ${Ddir}/ROOT && \
 ln -s ${Ddir}/ROOT-${Name} /${Ddir}/ROOT && \
 /soft/tomcat/bin/shutdown.sh && /soft/tomcat/bin/startup.sh"
done
}
rollback() {
rollback_file=$(ssh root@192.168.1.101 "find ${Ddir} -maxdepth 1 -type d -name "ROOT-*-${git_version}"")
for host in $WEB_SERVER
do
	 ssh root@${host} "rm -rf ${Ddir}/ROOT && \
     	 			  ln -s ${Ddir}/ROOT-${Name} /${Ddir}/ROOT && \
   					  /soft/tomcat/bin/shutdown.sh && /soft/tomcat/bin/startup.sh"
done
}
deploy () {
  get_code_tar
  scp_code_web
}
if [ ${deploy_env} == "deploy" ]; then

 	if [ ${GIT_COMMIT} == ${GIT_PREVIOUS_SUCCESSFUL_COMMIT} ];then
 		echo "您已经发布过该版本 ${git_version} 版本。"
 		exit 1
 	else
 		deploy
    fi
elif [ ${deploy_env} == "rollback" ]; then
 		rollback
fi
```

Jenkins添加选项参数

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_7a82eddc-d385-462f-8c66-be8e62db5f10.png)

测试部署

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_e108f3b5-6016-4d81-9f28-ec8641f87b30.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_ffd76fd9-fbd4-48e0-b5d1-3f8199fdfd50.png)

回退到1.3版本

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_248ce488-78f1-40e6-b095-0de215cc3824.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_4a5b72b4-6f26-47c6-aa73-e38d51d29125.png)

再次部署V1.4版本

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_6ec823a7-8695-405d-ae62-4f517b02c09f.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/50dd0165dec60af49201b38afc809951_1953e420-e87e-4426-a3c1-0da55624940f.png)

# 9.Jenkins集成SonarQube代码质检

[参考教程链接](https://blog.chenjiangfeng.cn/?p=567)

## 9.1SonarQube基本概述

1. 什么是SonarQube

   SonarQube是一个开源的代码质量管理系统，用于检测代码中的错误，漏洞和代码规范。他可以和现有的gitlab，Jenkins集成，以便在项目拉取后进行连续的代码检查。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_d099ff87-7d2e-4f26-baa1-03a56ffc54c8.jpg)

2. 使用SonarQube前提
   * SonarQube基于Java开发，所以需要安装Open JDK8版本
   * SonarQube需要依赖MySQL数据库，至少5.6版本以上
   * SonarQube的小型实例至少需要4GB内存，如果是大型实例需要16GB

## 9.2SonarQube服务安装

### 9.2.1环境规划

| 操作系统  | IP地址        | 主机名    | 备注 |
| --------- | ------------- | --------- | ---- |
| Centos7.6 | 192.168.1.107 | SonarQube |      |

### 9.2.2环境准备

关闭防火墙

```bash
systemctl stop firewalld
systemctl disable firewalld
setenforce 0
```

关闭selinux

安装SonarQube依赖工具

```bash
yum -y install git java unzip wget
```

下载安装MySQL

```bash
yum -y install mysql-community-*
```

启动数据库

```bash
systemctl start mysqld
systemctl enable mysqld
```

配置数据库密码

```bash
mysql_secure_installation 
mysqladmin password chenjf
```

创建一个sohar库

```bash
mysql -uroot -pchenjf -e "CREATE DATABASE sonar DEFAULT CHARACTER SET utf8;"
mysql -uroot -pchenjf -e "SHOW databases;"
+——————–+
|   Database     |
+——————–+
| information_schema |
| mysql |
| performance_schema |
| sonar |
+——————–+
[root@sonarqube ~]# 
```

下载sonarqube，并解压至/usr/local

```bash
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.9.1.zip
unzip sonarqube-7.9.1.zip -d /usr/local/
useradd sonar
chown -R sonar.sonar /usr/local/sonarqube-7.9.1/
ln -s /usr/local/sonarqube-7.9.1/ /usr/local/sonarqube
```

修改sonarqube连接数据库配置文件

```bash
vim /usr/local/sonarqube/conf/sonar.properties 
```

```properties
sonar.jdbc.username=root
sonar.jdbc.password=chenjf
sonar.jdbc.url=jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false
```

启动sonarqube服务（由于ES必须普通用户启动，所以不能使用root用户，否则启动失败）

```bash
su – sonar -c "/usr/local/sonarqube/bin/linux-x86-64/sonar.sh start"
```

```bash
#查看日志
tail -f /usr/local/sonarqube/logs/sonar.log
#查看端口,启动成功会有sonar的9000端口
netstat -lntp
```

访问sonarqube界面访问

通过浏览器访问http//hostname:9000，点击登录输入用户名：admin；用户密码：admin

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_18e10a10-6292-45af-af42-a018622be89a.png)

初始化配置

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_c6b7ecf4-f13d-491b-9530-fffc0442c6c4.png)

sonarqube初始化操作，配置认证token令牌。（如果有人使用该token访问sonar则无需输入密码）

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_8e590472-71d8-4229-b5f9-8afebe0c5e3a.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_3e9ecc85-f6ec-4115-8284-b23e5d411d05.png)

```properties
chenjf: c94746867abfe91f73c47fecef5ab50acde2a26d		
```

如何使用sonarqube质量分析，如果是Java代码直接安装maven3版本以上实现质检。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_84588e87-515e-412f-99e8-90a099634170.png)

Java代码

```bash
mvn sonar:sonar \
 -Dsonar.host.url=http://sonarqube.chenjf.com:9000 \
 -Dsonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d
```

如何使用sonarqube质量分析，如果是非Java代码，则需要使用sonar-scanner工具实现代码质检。

sonar-scanner下载地址：https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_9bc6238d-913f-4ae8-a271-2ce681dd1f31.png)

PHP代码

```bash
sonar-scanner \
 -Dsonar.projectKey=php \
 -Dsonar.sources=. \
 -Dsonar.host.url=http://sonarqube.chenjf.com:9000 \
 -Dsonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d
```

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_46b37b37-2b4a-48f1-b16a-2c928b7d668c.png)

HTML代码

```bash
/usr/local/sonar-scanner/bin/sonar-scanner \
 -Dsonar.projectKey=html \
 -Dsonar.sources=. \
 -Dsonar.host.url=http://sonarqube.chenjf.com:9000 \
 -Dsonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d
```

现在不着急进行代码质量检测，还是需要安装一些插件在开始我们的工作

## 9.3SonarQube插件管理

### 9.31安装中文汉化插件

1. 页面上找到administration –>Marketplace –>搜索款搜索Chinese，出现一个Chinese Pack ，然后点击install

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_6d1ac097-00c5-4a53-b09b-6d51905cd4f7.png)

2. 界面会提示reset重启SonarQube服务，重启再次打开则为汉化

```bash
su – sonar -c "/usr/local/sonarqube/bin/linux-x86-64/sonar.sh restart"
```

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_1d537778-ba2f-4599-8c53-2c245c538cda.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_cb751cd6-06d4-47db-8158-cab93ec4b8f6.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_0b25b1b1-7c6d-473d-af00-d26ad4526347.png)

### 9.3.2安装代码检查插件

默认已经安装C Java Python Php Js等代码的质量分析工具。可以根据项目自行安装html css go

PS：一个项目如果使用了Java css js html，那么默认情况下仅会检测，Java、js等代码的漏洞和dug

如果安装了html、css等插件，那么则会检查该项目代码中Java js html css等代码的漏洞和bug

### 9.3.3离线安装插件

1. SonarQube插件安装可能需要很长时间，所以可以选择之前已安装过得插件，直接导入plugins目录

```bash
mv /usr/local/sonarqube/extensions/plugins/ /usr/local/sonarqube/extensions/plugins_bak
tar -xf sonar_plugins.tar.gz -C /usr/local/sonarqube/extensions/
chown -R sonar.sonar /usr/local/sonarqube-7.0/
su – sonar -c "/usr/local/sonarqube/bin/linux-x86-64/sonar.sh restart"
```

2. 导入插件重启后，可以上应用市场查看已安装过的插件

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_60d49787-a609-4767-a769-76fb0e49fad9.png)

## 9.4SonarQube项目分析实践

前面已经将SonarQube安装完成，所以接下来只需要对代码进行分析测试即可（要保证手动测试完成）

1. 分析html、PHP、Python等项目

   如上项目依赖于sonar-scrnner命令，所以需要安装sonar-scanner工具

   下载地址：https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip

```bash
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
unzip sonar-scanner-cli-4.0.0.1744-linux.zip -d /usr/local/
ln -s /usr/local/sonar-scanner-4.0.0.1744-linux/ /usr/local/sonar-scanner
```

2. 配置sonar-scanner客户端只想SonarQube服务端，以及认证的token

```bash
vim /usr/local/sonar-scanner/conf/sonar-scanner.properties
```

```properties
sonar.host.url=http://sonarqube.chenjf.com:9000
sonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d
sonar.sourceEncoding=UTF-8
```

3. 服务端开启用户认证

![img](E:\我的坚果云\note\tool\jenkins\jenkins.assets\91ce9332ab79cc2603967dd1bcb074af_5852093f-3088-40e7-a504-35b1af252d51.png)

4. 手动从gitlab仓库获取代码，进入项目目录，使用Sconar-scanner进行代码扫描

记得做域名解析

```bash
vim /etc/hosts
```

```bash
[root@jenkins ~]# cd /var/lib/jenkins/workspace/monitor-freestyle/
#-X表示调试模式
[root@jenkins monitor-freestyle]# /usr/local/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=html -Dsonar.sources=. -X
```

5. 登录SonarQube查看项目的质量检测情况

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_1724f29b-6f40-4ade-ba7f-056cf221a88b.png)

### 9.4.1分析Java项目

1. Java项目可以通过maven进行代码质检，无需使用Sconar-scanner工具，安装maven工具即可

```bash
yum -y install maven
```

2. 手动从gitlab仓库获取Java代码，进入项目目录，使用maven进行代码扫描

```bash
[root@jenkins~]# cd /var/lib/jenkins/workspace/Maven-Hello-World

[root@jenkins Maven-Hello-World]# mvn sonar:sonar \
\> -Dsonar.host.url=http://sonarqube.chenjf.com:9000 \

\> -Dsonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d

\## -Dsonar.java.binaries=target/sonar
```

3. 检查SonarQube结果

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_89f01857-56e9-40f0-86cb-b3ba7b086e1e.png)

4. 使用客户端工具扫描

```bash
[root@jenkins Maven-Hello-World]# /usr/local/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=java -Dsonar.sources=.
```

5. 检查结果

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_0593acff-0c61-4f3e-a2d9-4991c927f7b8.png)

## 9.5Jenkins集成SonarQube

1. Jenkins安装SonarQube Scanner for Jenkins插件

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_ec24dba5-978b-4d14-b044-0b57c8ea79d1.png)

2. 需要在Jenkins上配置SonarQube服务端

   系统管理–> 系统设置–> SonarQube (告诉Jenkins SonarQube server服务端地址)

   * Nmae：课随便填写
   * URL：添加SonarQube 的地址
   * token：添加一个Secret text填写之前安装SonarQube的Token

PS：如果SonarQube没有在配置–>权限–>启用Force user authentication 则课忽略进行token验证操作。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_6ed2683c-b18c-4f99-a1e5-a9c0cdb45750.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_d34da1a3-6753-4a9b-a41c-13dda9590315.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_58edcf3e-5407-4278-88c1-806b8c93e02d.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_bf8209cf-d80c-4e11-b18f-579d561423c2.png)

3. 在Jenkins上配置Sonar-Scanner工具路径

   系统管理–>全局工具配置（告诉Jenkins Sonar-Scanner在本地那个路径）

   * Name：可以随便填写，但是最好有规范
   * SONAR_RUNNER_HOME：填写Sonar-Scanner本地那个路径

PS：如果不配置Sonar-Scanner路径，则无法进行扫描

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_7a8da206-5a74-4d1b-9042-789354216b43.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_b6410212-ea25-458b-9dba-7c64c2d32d98.png)

## 9.6配置FreeStyle集成SonarQube

1. 找到此前的frestyle项目，然后修改配置，新增如下配置

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_214513c5-b2ab-41c3-b3ac-d0ed58233dfa.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_6fc5bc0f-4154-4193-b29c-7f53e0850e90.png)

2. 使用的参数如下

   ```properties
   sonar.projectName=${JOB_NAME}     ##项目在SonarQube上显示的名称
   sonar.projectKey=html              ##项目的唯一标识，不能重复
   sonar.sources=.                    ##扫描那个项目的源码
   ```

3. 更新代码版本

   ```bash
   [root@gitlab monitor]# vim index.html 
   [root@gitlab monitor]# git add .
   [root@gitlab monitor]# git commit -m "v1.3"
   [root@gitlab monitor]# git push origin master 
   [root@gitlab monitor]# git tag -a "v1.3" -m "v1.3"
   [root@gitlab monitor]# git push origin v1.3
   ```

4. 构建项目测试

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_14d6339b-6db0-4c18-b7fc-e244f0011127.png)

5. 检查SonarQube质检结果

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_efff8668-b732-4f6e-8e52-a2be8ec4f50f.png)

6. 浏览器访问页面

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_777dd7bc-9452-4549-a7cc-2123db66b5db.jpg)

## 9.7配置Maven项目集成SonarQube

maven项目可以通过使用Sonar-Scanner工具，也可以使用maven的方式进行检测，两种方式任选其一即可。

第一种方式，通过Sonar-Scanner方式进行代码质检。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_076f13c1-4607-4bc0-a5ec-378272537e71.png)

参数如下：

```properties
sonar.projectName=${JOB_NAME}     ##项目在SonarQube上显示的名称
sonar.projectKey=html              ##项目的唯一标识，不能重复
sonar.sources=.                    ##扫描那个项目的源码
sonar.java.binaries=target/sonar
```

第二种方式：通过调用maven方式进行代码质检

![img](E:\我的坚果云\note\tool\jenkins\jenkins.assets\91ce9332ab79cc2603967dd1bcb074af_2402b062-4a16-4cc8-980b-50e2eeff5dd1.png)

参数如下：

```bash
clean
verify
sonar:sonar 
 -Dsonar.host.url=http://sonarqube.chenjf.com:9000
 -Dsonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d
```

提交更新代码

```bash
[root@gitlab ~]# cd ~/hello-world-war/
[root@gitlab hello-world-war]# vim src/main/webapp/index.jsp 
[root@gitlab hello-world-war]# git add .
[root@gitlab hello-world-war]# git commit -m "v1.5"
[root@gitlab hello-world-war]# git push origin master 
[root@gitlab hello-world-war]# git tag -a "v1.5" -m "v1.5"
[root@gitlab hello-world-war]# git push origin v1.5
```

发布代码

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_278ffd11-3fb7-4272-b33c-5d1f368b3627.png)

查看质检结果

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_6b4cb0ec-59f9-4692-a460-bca6f12312af.png)

查看页面信息

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/91ce9332ab79cc2603967dd1bcb074af_b03ccb6c-dcc9-4fef-9cc0-961d81edde8b.png)

# 10.Jenkins集成钉钉通知

[参考教程](https://blog.chenjiangfeng.cn/?p=579)

**1、Jenkins集成钉钉概述**

1. Jenkins为什么要有通知

   Jenkins进行自动化部署代码后，项目发布的成功或失败，都没有响应的通知，运维人员无法及时发现项目的部署情况，需要人为查看，比较麻烦。所以考虑项目部署后通过钉钉的方式将结果发送到钉钉的群聊中。

2. 使用钉钉推送消息的优势

1. 实现简单
2. 实时提醒
3. 便于查看

3. 为什么不使用邮件通知，而使用钉钉通知？

1. 邮件配置复杂
2. 邮件容易被拒收
3. 

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_597b7d78-d2cf-47d6-8b7e-0764647240b6.jpg)

**2、钉钉配置发消息机器人**

1. 打开钉钉群组，点击群机器人。（如果你不是群主，且群主开启了仅群主可管理，那么将无法创建机器人）

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_4b90670a-56f6-46b3-a7d8-a4cc2399cfaf.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_9f4570d8-fa5a-4cc2-9201-b935dbd16bf6.jpg)

2. 添加一个自定义机器人

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_51970f83-8195-41a2-9f9a-ebfd7bead963.jpg)

修改机器人名称，以及机器人的名字（自行修改）

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_6ed84535-eea8-4507-9326-5231e6860480.jpg)

机器人修改完成后，会给一个webhook地址。（此处的webhook后续Jenkins需要使用）

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_399604b5-8078-4d29-9df6-c5ee8f8c5bc8.jpg)

https://oapi.dingtalk.com/robot/send?access_token=d75b0fbaa39ac88f9ebe09ca6c70ea8cdfefde5bf536eb06f4d7204f77db5b80

**3、配置Jenkins**

1. 安装钉钉插件

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_81a1d09d-4273-44c4-aebf-c02ac177c85e.png)2. 配置项目构建后操作

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_6d0e996c-bd13-4ca5-8118-4be75706de4f.png)

开始构建项目

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_1ae84bd6-0b22-4e60-b74a-b7af1706feb2.png)

查看钉钉消息

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/740be0c830e63bebf9e15f22ea52a3ec_55ebe4be-93b4-4b76-9dae-687c4971c360.jpg)

# 11.Jenkins集成Pipenline流水线

[参考教程链接](https://blog.chenjiangfeng.cn/?p=600)

## 11.1Pipenline基本概述

1. 什么是Pipenline？

   可以理解将我们开发部署环境生态链的每一步骤都通过Pipenline流水线串联起来，并代码化，使得我们开发人员一键就能将本地的代码发布到测试环境进行测试发布，最终实现持续集成持续发布。

2. 为什么要使用Pipenline

   之前传统的开发部署流程，每一步都需要人为干预，迁移到Pipenline能够实现每一步自动化，无需要人为干预，所有的流程都可以通过代码自动化。

3. 迁移Pipenline有什么好处

   可以实现持续集成持续部署，节省产品发布时间，优化部署策略，节省人力成本，自动化脚本复用等等

## 11.2Pipenline语法示例

Pipenline基础语法

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_a7b1d897-9623-488e-ab41-0c55f91ff8b9.jpg)

Pipenline是固定格式，必须遵循

## 11.3Pipenline 初次体验

1. 通过Jenkins创建一个流水线项目

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_806d8e84-177e-49f5-87e7-1041d650698f.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_26a44089-3ddc-4eb1-9f99-a04c2f4e8b56.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_a1ce3668-5ab3-441a-9adf-02fed2babbd0.png)

构建项目

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_972c6f14-cf7d-47b7-824f-82448c82295b.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_9bc17acb-1a7f-4723-9c57-be47bb77035e.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_4d3c1a2f-429d-4760-b0ad-f6f6bf4f62e0.png)

第二种方式：

配置Jenkins流水线

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_b4d1036b-c602-4b7c-a95b-64a07b95671e.png)

在代码中添加Jenkinsfile

```bash
[root@gitlab hello-world-war]# vim Jenkinsfile
```

```bash
	pipeline {
	agent any
	stages {
		stage ('代码获取'){
			steps {
				echo "get code is ok"
			}
		}
		stage ('代码质检'){
			steps {
				echo "check code is ok"
			}
		}
		stage ('代码构建'){
			steps {
				echo "build is ok"
			}
		}
		stage ('代码部署'){
			steps {
				echo "deploy is ok"
			}
		}
	}
```

```bash
[root@gitlab hello-world-war]# git add .
[root@gitlab hello-world-war]# git commit -m "jenkinsfile"
[root@gitlab hello-world-war]# git push origin master 
```

点击立即构建测试，可以看到整个流水线，每个阶段的内容以及花费的时长。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_e5d10911-52e3-47f6-b99e-89e19d89d604.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_f349dc61-8821-412d-a01d-fe8de7fee640.png)

## 11.4Pipeline构建html

代码拉取–>代码检测–>代码构建–>代码部署–>消息通知

1. 配置pipeline基本信息，选择参数化构建

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_390cb231-ac44-447b-ad4a-01af54a88603.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_736a0e61-68b7-4c80-901a-9294c5efedbf.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_56d6f02b-152a-4a5e-b038-1c703e07d12a.png)2. 流水线配置如下

**代码获取语法生成**

![image-20200531173624480](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531173624480.png)

![image-20200531173940670](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531173940670.png)

然后复制语法就是`获取代码`的脚本

**代码质检语法生成**

![image-20200531174758405](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531174758405.png)

**质检通知钉钉语法生成**

![image-20200531175414851](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531175414851.png)

```bash
pipeline {
	agent any 
	
	stages {
		stage ('代码获取'){
			steps {
				checkout([$class: 'GitSCM', branches: [[name: '${git_version}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '79b0bf28-49f8-45ea-bc0e-4857773f3022', url: 'git@gitlab.chenjf.com:devops/monitor.git']]])
			}
		}
		stage('代码质检'){
			steps {
				withSonarQubeEnv('SonarQube') {//生成SonarQube图标
					sh '/usr/local/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=html -Dsonar.projectName=${JOB_NAME} -Dsonar.sources=.'
				}
			}
		}
		stage ('代码构建'){
			steps {
				echo '部署完成，等待部署'
			}
		}
		stage ('代码部署'){
			steps {
				sh '/scripts/pipenline_html_deploy.sh'
			}
		}
	}
	post {		//stages所有任务执行后出发post
		failure {	//构建失败通知
			dingTalk accessToken: 'd75b0fbaa39ac88f9ebe09ca6c70ea8cdfefde5bf536eb06f4d7204f77db5b80', imageUrl: 'http://pic160.nipic.com/pic/20180405/26925690_110716450034_4.jpg', jenkinsUrl: 'http://jenkins.chenjf.com:8080', message: '代码部署失败', notifyPeople: '15939609636'
		}
		success {	//构建成功通知
			dingTalk accessToken: 'd75b0fbaa39ac88f9ebe09ca6c70ea8cdfefde5bf536eb06f4d7204f77db5b80', imageUrl: 'http://pic231.nipic.com/pic/20190728/10731594_171211559000_4.jpg', jenkinsUrl: 'http://jenkins.chenjf.com:8080', message: '代码部署成功', notifyPeople: '15939609636'
		}
	}
}
```

把上述脚本放到流水线脚本里

![image-20200531180403689](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531180403689.png)

pipeline构建html项目时调用的部署脚本如下

```bash
[root@jenkins ~]# vim /scripts/pipenline_jenkins_html_tag.sh
#!/usr/bin/bash
DATE=$(date +%Y-%m-%d-%H-%M-%S)
WEB_DIR="/code"
WEB_SERVER="192.168.1.101 192.168.1.102"

#1.将代码进行打包
get_code_tar() {
	cd ${WORKSPACE}  && \
    tar czf /opt/web-${DATE}-${git_version}.tar.gz ./*
    }

#2.将代码推送至web服务器,解压，然后软连接
scp_code_web() {
  for host in $WEB_SERVER
  do
####将Jenkins上打好的压缩包拷贝至web服务组
     scp /opt/web-${DATE}-${git_version}.tar.gz  root@$host:$WEB_DIR

####通过ssh链接对端主机，然后创建目录并解压内容
     ssh root@$host "cd $WEB_DIR && mkdir -p web-${DATE}-${git_version} && \
     tar xf web-${DATE}-${git_version}.tar.gz -C web-${DATE}-${git_version} && rm -f web-${DATE}-${git_v
ersion}.tar.gz"
####将文件做好对应的软链接
     ssh root@$host "rm -rf $WEB_DIR/web  && \
                     ln -s $WEB_DIR/web-${DATE}-${git_version}  $WEB_DIR/web"
done
}

deploy(){
    get_code_tar
    scp_code_web
}

if [ ${GIT_COMMIT} == ${GIT_PREVIOUS_SUCCESSFUL_COMMIT} ];then
		echo "您已经部署过该${git_version}版本。"
		exit 1
	else
		deploy
fi
```

开始构建项目

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_32fab1b5-2439-443a-8993-dbb7d0248102.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_73c8bfd2-40cf-43cf-8006-65b584fe2b21.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_f1d499d7-36af-4f59-932d-c7e3da6ce2b2.jpg)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_c1a9cb3d-f706-4677-8df6-0423a70fc3cb.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_f0903b85-776c-4f8b-a681-6ef8339b84b1.png)

**实现代码质检失败停止任务**

![image-20200531181155507](https://cdn.jsdelivr.net/gh/zxc054/static/img/image-20200531181155507.png)

语法如下：

```bash
      script {
             timeout(1) {
              //这里设置超时时间1分钟，不会出现一直卡在检查状态
              //利用sonar webhook功能通知pipeline代码检测结果，未通过质量阈，pipeline将会fail
              def qg = waitForQualityGate('sonar')
              //注意：这里waitForQualityGate()中的参数也要与之前SonarQube servers中Name的配置相同
              if (qg.status != 'OK') {
                  error "未通过Sonarqube的代码质量阈检查，请及时修改！failure: ${qg.status}"
               }
             }
         }
```

## 11.5BlueOcan可视化

​    Blue Ocan为开发人员提供了更具有乐趣的Jenkins使用方式，它是从基础开始构建的，实现了一种全新的、现代化的用户界面，有助于实现持续交付。

1. Blue Ocean功能

   编辑器：用户可通过直观的方式创建pipeline流水线项目

   可视化：对流水线的可视化表示，提高了持续交付过程的清晰度

   可诊断：通过图形快速定位问题，无需持续扫描日志或关注多个屏幕。

   仪表盘：用户可以自定义仪表盘，至显示与自身相关的流水线。

2. Blue Ocean安装

* 系统管理–管理插件–可选插件–搜索Blue Ocean
* 安装成功后，左侧会出现个"Open Blue Ocean"，点进去
* 如果Jenkins成功构建了你的应用程序，Blue Ocean界面会变成绿色。

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/de5f74a01e52266bede55c91b0ee47bb_7c25edf5-fb39-4631-af88-a79ae9a48e17.jpg)

# 12.Jenkins分布式构建

[参考教程链接](https://blog.chenjiangfeng.cn/?p=617)

项目规划

| 操作系统  | IP地址        | 主机名        | 备注 |
| --------- | ------------- | ------------- | ---- |
| Centos7.6 | 192.168.1.100 | lb01          |      |
| Centos7.6 | 192.168.1.101 | web01         |      |
| Centos7.6 | 192.168.1.102 | web02         |      |
| Centos7.6 | 192.168.1.103 | gitlab        |      |
| Centos7.6 | 192.168.1.104 | Jenkins       |      |
| Centos7.6 | 192.168.1.105 | Jenkins-slave |      |
| Centos7.6 | 192.168.1.106 | sonarqube     |      |

**基础配置**

关闭防火墙

关闭selinux

分发自己的公钥

配置hosts解析

```bash
[root@jenkins-slave01 ~]# vim /etc/hosts
```

```properties
192.168.1.103 gitlab.chenjf.com
192.168.1.104 jenkins.chenjf.com
192.168.1.107 sonarqube.chenjf.com
```

**Jenkins-slave配置**

**安装JDK Git sonar-scanner maven**

```bash
[root@jenkins-slave01 ~]# yum -y install java git maven
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
unzip sonar-scanner-cli-4.0.0.1744-linux.zip -d /usr/local/
ln -s /usr/local/sonar-scanner-4.0.0.1744-linux/ /usr/local/sonar-scanner
```

配置sonar-scanner

```bash
vim /usr/local/sonar-scanner/conf/sonar-scanner.properties 

[root@jenkins-slave01 local]# vim sonar-scanner/conf/sonar-scanner.properties 

sonar.host.url=http://sonarqube.chenjf.com:9000

sonar.login=c94746867abfe91f73c47fecef5ab50acde2a26d

sonar.sourceEncoding=UTF-8
```

命令位置：（此处我的git,jdk,maven）

```properties
git：/usr/libexec/git-core/git

jdk：/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el7_6.x86_64/

maven：/usr/share/maven

sonar-scanner：/usr/local/sonar-scanner/bin/sonar-scanner
```

配置脚本文件

```bash
[root@jenkins ~]# cat /scripts/pipenline_html_deploy.sh
```

```bash
\#!/usr/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M-%S)

WEB_DIR=”/code”

WEB_SERVER=”192.168.1.101 192.168.1.102″

\#1.将代码进行打包

get_code_tar() {

 cd ${WORKSPACE} && \

  tar czf /opt/web-${DATE}-${git_version}.tar.gz ./*

}
\#2.将代码推送至web服务器,解压，然后软连接

scp_code_web() {

 for host in $WEB_SERVER

 do

  \#将Jenkins上打好的压缩包拷贝至web服务组

   scp /opt/web-${DATE}-${git_version}.tar.gz root@$host:$WEB_DIR

  \#通过ssh链接对端主机，然后创建目录并解压内容

   ssh root@$host “cd $WEB_DIR && mkdir -p web-${DATE}-${git_version} && \

   tar xf web-${DATE}-${git_version}.tar.gz -C web-${DATE}-${git_version} && rm -f web-${DATE}-${git_v

ersion}.tar.gz”

   \#将文件做好对应的软链接

   ssh root@$host “rm -rf $WEB_DIR/web && \

           ln -s $WEB_DIR/web-${DATE}-${git_version} $WEB_DIR/web”

done

}

deploy(){

  get_code_tar

  scp_code_web

}

  deploy
```



**Jenkins-master上配置**

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_690c8e37-b86f-4700-8186-6334b1b225fb.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_170a9d90-bdfb-4432-ba5e-d13a71ad4a1d.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_9a5859a4-67ab-4df1-8912-2f64d0b4f77e.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_16bc8ae5-db31-4441-9733-b0b5a265b59f.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_e7a6a18b-0766-4dd1-81d4-4f866d25039d.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_c9df5e4f-2849-4491-abe4-9320dadea356.png)

<img src="https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_9f9dd660-8313-46f7-a463-8c0fcccf269a.png" alt="img"  />

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_96da78cf-e258-4f7f-93ba-c0215eb0e174.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_3c2b5036-33da-4270-b4a5-6ca152d8306d.png)

修改流水线语法

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_24cd9afb-50da-4343-8fb2-133090053449.png)

代码如下

```bash
pipeline {

 // agent any 

 agent { label 'slave-01' }

 stages {

 stage ('代码获取'){

  steps {

  checkout([$class: 'GitSCM', branches: [[name: '${git_version}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '79b0bf28-49f8-45ea-bc0e-4857773f3022', url: 'git@gitlab.chenjf.com:devops/monitor.git']]])

  }

 }

 stage('代码质检'){

  steps {

  withSonarQubeEnv('SonarQube') {

   sh '/usr/local/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=html -Dsonar.projectName=${JOB_NAME} -Dsonar.sources=.'

  }

  }

 }

 stage ('代码构建'){

  steps {

  echo '部署完成，等待部署'

  }

 }

 stage ('代码部署'){

  steps {

  sh '/scripts/pipenline_html_deploy.sh'

  }

 }

 }

 post { //stages所有任务执行后出发post

 failure { //构建失败通知

  dingTalk accessToken: 'd75b0fbaa39ac88f9ebe09ca6c70ea8cdfefde5bf536eb06f4d7204f77db5b80', imageUrl: 'http://pic160.nipic.com/pic/20180405/26925690_110716450034_4.jpg', jenkinsUrl: 'http://jenkins.chenjf.com:8080', message: '代码部署失败', notifyPeople: '15939609636'

 }

 success { //构建成功通知

  dingTalk accessToken: 'd75b0fbaa39ac88f9ebe09ca6c70ea8cdfefde5bf536eb06f4d7204f77db5b80', imageUrl: 'http://pic231.nipic.com/pic/20190728/10731594_171211559000_4.jpg', jenkinsUrl: 'http://jenkins.chenjf.com:8080', message: '代码部署成功', notifyPeople: '15939609636'

 }

 }

}
```

构建一个

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_48b541b3-0f94-4297-949f-d99b55314f00.png)

查看是由哪个主机构建

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_0ec4affd-5463-4b72-b6af-182640456178.png)

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_3ee321b0-cc35-4ee7-90fd-b1083e3f6901.png)

查看web页面信息

![img](https://cdn.jsdelivr.net/gh/zxc054/static/img/1f9c9d509fb58b5d87058c52e703ef77_e1e679a8-28eb-4297-b34c-f2b14d569662.jpg)