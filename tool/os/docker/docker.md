[视频课程链接](https://www.bilibili.com/video/BV1YC4y1H715)

# 目录：
- [目录：](#%e7%9b%ae%e5%bd%95)
- [1.Docker简介](#1docker%e7%ae%80%e4%bb%8b)
  - [1.1什么是虚拟化](#11%e4%bb%80%e4%b9%88%e6%98%af%e8%99%9a%e6%8b%9f%e5%8c%96)
  - [1.2什么是Docker](#12%e4%bb%80%e4%b9%88%e6%98%afdocker)
  - [1.3为什么选择Docker](#13%e4%b8%ba%e4%bb%80%e4%b9%88%e9%80%89%e6%8b%a9docker)
  - [1.4虚拟化与docker的区别](#14%e8%99%9a%e6%8b%9f%e5%8c%96%e4%b8%8edocker%e7%9a%84%e5%8c%ba%e5%88%ab)
  - [1.5Docker组件](#15docker%e7%bb%84%e4%bb%b6)
    - [1.5.1Docker服务器与客户端](#151docker%e6%9c%8d%e5%8a%a1%e5%99%a8%e4%b8%8e%e5%ae%a2%e6%88%b7%e7%ab%af)
    - [1.5.2Docker镜像与容器](#152docker%e9%95%9c%e5%83%8f%e4%b8%8e%e5%ae%b9%e5%99%a8)
- [2.Docker的安装与启动](#2docker%e7%9a%84%e5%ae%89%e8%a3%85%e4%b8%8e%e5%90%af%e5%8a%a8)
  - [2.1安装Docker](#21%e5%ae%89%e8%a3%85docker)
  - [2.2设置ustc的镜像](#22%e8%ae%be%e7%bd%aeustc%e7%9a%84%e9%95%9c%e5%83%8f)
  - [2.4Docker的启动与停止](#24docker%e7%9a%84%e5%90%af%e5%8a%a8%e4%b8%8e%e5%81%9c%e6%ad%a2)
- [3.常用命令](#3%e5%b8%b8%e7%94%a8%e5%91%bd%e4%bb%a4)
  - [3.1镜像相关命令](#31%e9%95%9c%e5%83%8f%e7%9b%b8%e5%85%b3%e5%91%bd%e4%bb%a4)
    - [3.1.1查看镜像](#311%e6%9f%a5%e7%9c%8b%e9%95%9c%e5%83%8f)
    - [3.1.2搜索镜像](#312%e6%90%9c%e7%b4%a2%e9%95%9c%e5%83%8f)
    - [3.1.3拉取镜像](#313%e6%8b%89%e5%8f%96%e9%95%9c%e5%83%8f)
    - [3.1.4删除镜像](#314%e5%88%a0%e9%99%a4%e9%95%9c%e5%83%8f)
  - [3.2容器相关命令](#32%e5%ae%b9%e5%99%a8%e7%9b%b8%e5%85%b3%e5%91%bd%e4%bb%a4)
    - [3.2.1查看容器](#321%e6%9f%a5%e7%9c%8b%e5%ae%b9%e5%99%a8)
    - [3.2.2创建与启动容器](#322%e5%88%9b%e5%bb%ba%e4%b8%8e%e5%90%af%e5%8a%a8%e5%ae%b9%e5%99%a8)
    - [3.2.3创建与启动容器](#323%e5%88%9b%e5%bb%ba%e4%b8%8e%e5%90%af%e5%8a%a8%e5%ae%b9%e5%99%a8)
    - [3.2.4文件拷贝](#324%e6%96%87%e4%bb%b6%e6%8b%b7%e8%b4%9d)
    - [3.2.5目录挂载](#325%e7%9b%ae%e5%bd%95%e6%8c%82%e8%bd%bd)
    - [3.2.6查看容器ip地址](#326%e6%9f%a5%e7%9c%8b%e5%ae%b9%e5%99%a8ip%e5%9c%b0%e5%9d%80)
- [4.应用部署](#4%e5%ba%94%e7%94%a8%e9%83%a8%e7%bd%b2)
  - [4.1MySql部署](#41mysql%e9%83%a8%e7%bd%b2)
  - [4.2Tomcat部署](#42tomcat%e9%83%a8%e7%bd%b2)
  - [4.3Nginx部署](#43nginx%e9%83%a8%e7%bd%b2)
  - [4.4Redis部署](#44redis%e9%83%a8%e7%bd%b2)
- [5.备份与迁移](#5%e5%a4%87%e4%bb%bd%e4%b8%8e%e8%bf%81%e7%a7%bb)
  - [5.1容器保存为镜像](#51%e5%ae%b9%e5%99%a8%e4%bf%9d%e5%ad%98%e4%b8%ba%e9%95%9c%e5%83%8f)
  - [5.2镜像备份](#52%e9%95%9c%e5%83%8f%e5%a4%87%e4%bb%bd)
- [6.Dockerfile](#6dockerfile)
  - [6.1什么是Dockerfile](#61%e4%bb%80%e4%b9%88%e6%98%afdockerfile)
  - [6.2常用命令](#62%e5%b8%b8%e7%94%a8%e5%91%bd%e4%bb%a4)
  - [6.3使用脚本创建镜像](#63%e4%bd%bf%e7%94%a8%e8%84%9a%e6%9c%ac%e5%88%9b%e5%bb%ba%e9%95%9c%e5%83%8f)
- [7.Docker私有仓库](#7docker%e7%a7%81%e6%9c%89%e4%bb%93%e5%ba%93)
  - [7.1私有仓库搭建与配置](#71%e7%a7%81%e6%9c%89%e4%bb%93%e5%ba%93%e6%90%ad%e5%bb%ba%e4%b8%8e%e9%85%8d%e7%bd%ae)
  - [7.2镜像上传至私有仓库](#72%e9%95%9c%e5%83%8f%e4%b8%8a%e4%bc%a0%e8%87%b3%e7%a7%81%e6%9c%89%e4%bb%93%e5%ba%93)


# 1.Docker简介

## 1.1什么是虚拟化

顾名思义，虚拟化技术是将物理资源以某种技术虚拟成资源池的形式，主要有一虚多和多虚一两种形式，比如个人电脑安装Vmware软件，可以在这个软件上安装其他Win系统、MacOS、Linux系统等，实现一台电脑/笔记本承载多个系统的优点，目前苹果笔记本用户双系统解决方案也以虚拟机为主，普通Windows用户可能需求量不大，而技术人员基本是必备软件了。

## 1.2什么是Docker

Docker 最初是 dotCloud 公司创始人 Solomon Hykes 在法国期间发起的一个公司内部项目，它是基于 dotCloud 公司多年云服务技术的一次革新，并于 [2013 年 3 月以 Apache 2.0 授权协议开源](https://en.wikipedia.org/wiki/Docker_(software))，主要项目代码在 [GitHub](https://github.com/moby/moby) 上进行维护。Docker 项目后来还加入了 Linux 基金会，并成立推动 [开放容器联盟（OCI）](https://www.opencontainers.org/)。

Docker是一个提供集中式平台来执行应用程序的软件。 它将软件组件包装成一个完整的标准化单元，其中包含所有要运行的内容。 无论是代码，运行时环境，工具还是程序库。它保证软件能始终按预期那样运行。

Docker提供了一种称为容器的隔离环境中运行应用程序的功能。 您可以在给定的主机上同时运行多个容器。 它是轻量级的，可立即启动并使用较少的内存。 它是默认安全的，因为每个容器彼此隔离。

> **注意** - Docker 容器并不是针对某种特定的平台。 它可以在任何计算机，任何基础架构和云中运行。

其实docker和虚拟技术很像，但又有一些不同点，一方面是两个技术的层级上，虚拟机一般是底层硬件Hardware支撑，上层是虚拟管理系统Hypervisor层，在上层开启不同的VM业务，如果需要将这些业务进行隔离，需要每个VM启动客户机操作系统，非常消耗资源。

Docker完全不同，底层有硬件和Host OS系统支撑，比如Windows/MacOS/Linux，中间抛去了臃肿的系统，而是以Docker守护进程代替，上层建立不同的容器，不同的应用镜像打包在不同的容器中，他们互相隔离。

## 1.3为什么选择Docker

作为一种新兴的虚拟化方式，Docker 跟传统的虚拟化方式相比具有众多的优势。

1. 更高效的利用系统资源

   由于容器不需要进行硬件虚拟以及运行完整操作系统等额外开销，Docker 对系统资源的利用率更高。无论是应用执行速度、内存损耗或者文件存储速度，都要比传统虚拟机技术更高效。因此，相比虚拟机技术，一个相同配置的主机，往往可以运行更多数量的应用。

2. 更快速的启动时间

   传统的虚拟机技术启动应用服务往往需要数分钟，而 Docker 容器应用，由于直接运行于宿主内核，无需启动完整的操作系统，因此可以做到秒级、甚至毫秒级的启动时间。大大的节约了开发、测试、部署的时间。

3. 一致的运行环境

   开发过程中一个常见的问题是环境一致性问题。由于开发环境、测试环境、生产环境不一致，导致有些 bug 并未在开发过程中被发现。而 Docker 的镜像提供了除内核外完整的运行时环境，确保了应用运行环境一致性，从而不会再出现 *「这段代码在我机器上没问题啊」* 这类问题。

4. 持续交付和部署

   对开发和运维（[DevOps](https://zh.wikipedia.org/wiki/DevOps)）人员来说，最希望的就是一次创建或配置，可以在任意地方正常运行。

   使用 Docker 可以通过定制应用镜像来实现持续集成、持续交付、部署。开发人员可以通过 `Dockerfile` 来进行镜像构建，并结合 [持续集成(Continuous Integration)](https://en.wikipedia.org/wiki/Continuous_integration) 系统进行集成测试，而运维人员则可以直接在生产环境中快速部署该镜像，甚至结合 [持续部署(Continuous Delivery/Deployment)](https://en.wikipedia.org/wiki/Continuous_delivery) 系统进行自动部署。

   而且使用 `Dockerfile` 使镜像构建透明化，不仅仅开发团队可以理解应用运行环境，也方便运维团队理解应用运行所需条件，帮助更好的生产环境中部署该镜像。

5. 更轻松的迁移

   由于 Docker 确保了执行环境的一致性，使得应用的迁移更加容易。Docker 可以在很多平台上运行，无论是物理机、虚拟机、公有云、私有云，甚至是笔记本，其运行结果是一致的。因此用户可以很轻易的将在一个平台上运行的应用，迁移到另一个平台上，而不用担心运行环境的变化导致应用无法正常运行的情况。

6. 更轻松的维护和扩展

   Docker 使用的分层存储以及镜像的技术，使得应用重复部分的复用更为容易，也使得应用的维护更新更加简单，基于基础镜像进一步扩展镜像也变得非常简单。此外，Docker 团队同各个开源项目团队一起维护了一大批高质量的 [官方镜像](https://store.docker.com/search?q=&source=verified&type=image)，既可以直接在生产环境使用，又可以作为基础进一步定制，大大的降低了应用服务的镜像制作成本。

## 1.4虚拟化与docker的区别

docker设计小巧，部署迁移快速，运行高效，应用之间相互独立，管理人员可以看到所有容器的内容，虚拟化技术比较臃肿，不论什么应用都需要先创建新的系统，并且并非按照应用隔离，而是按照系统隔离，管理员无法看到系统内部信息。

举个例子，Docker就是手机中的各种APP，只需要一个系统就可以下载自己所需的应用，但是虚拟化技术相当于你的苹果手机安装一个庞大软件，这个软件上安装安卓系统、魅族系统等，每个系统上还要安装各类应用，比较麻烦。

对比传统虚拟机总结

| 特性       | 容器               | 虚拟机      |
| :--------- | :----------------- | :---------- |
| 启动       | 秒级               | 分钟级      |
| 硬盘使用   | 一般为 `MB`        | 一般为 `GB` |
| 性能       | 接近原生           | 弱于        |
| 系统支持量 | 单机支持上千个容器 | 一般几十个  |

## 1.5Docker组件

### 1.5.1Docker服务器与客户端

Docker 是一个客户端、服务端（C/S）架构的程序。Docker客户端只需向Docker服务器或守护进程发出请求，服务器或守护进程将完成所有工作并返回结果。Docker守护进程有时也称为Docker引擎。Docker提供了一个命令行工具docker以及一整套RESTful API来与守护进程交互。用户可以在同一台宿主机上运行Docker守护进程和客户端，也可以从本地的Docker客户端连接到运行在另一台宿主机上的远程Docker守护进程。

<img src="https://img2018.cnblogs.com/blog/692143/201812/692143-20181203205924330-1598663669.png" alt="img" style="zoom: 80%;" />

docker client是一个泛称，它可以是命令行docker，也可以是遵循了docker api规则的客户端，简单地说可以理解为一个用于交互/发送指令的接口。

### 1.5.2Docker镜像与容器

1. **Docker镜像**

我们都知道，操作系统分为内核和用户空间。对于 Linux 而言，内核启动后，会挂载 `root` 文件系统为其提供用户空间支持。而 Docker 镜像（Image），就相当于是一个 `root` 文件系统。比如官方镜像 `ubuntu:16.04` 就包含了完整的一套 Ubuntu 16.04 最小系统的 `root` 文件系统。

Docker 镜像是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像不包含任何动态数据，其内容在构建之后也不会被改变。

2. **分层存储**

因为镜像包含操作系统完整的 `root` 文件系统，其体积往往是庞大的，因此在 Docker 设计时，就充分利用 [Union FS](https://en.wikipedia.org/wiki/Union_mount) 的技术，将其设计为分层存储的架构。所以严格来说，镜像并非是像一个 ISO 那样的打包文件，镜像只是一个虚拟的概念，其实际体现并非由一个文件组成，而是由一组文件系统组成，或者说，由多层文件系统联合组成。

镜像构建时，会一层层构建，前一层是后一层的基础。每一层构建完就不会再发生改变，后一层上的任何改变只发生在自己这一层。比如，删除前一层文件的操作，实际不是真的删除前一层的文件，而是仅在当前层标记为该文件已删除。在最终容器运行的时候，虽然不会看到这个文件，但是实际上该文件会一直跟随镜像。因此，在构建镜像的时候，需要额外小心，每一层尽量只包含该层需要添加的东西，任何额外的东西应该在该层构建结束前清理掉。

分层存储的特征还使得镜像的复用、定制变的更为容易。甚至可以用之前构建好的镜像作为基础层，然后进一步添加新的层，以定制自己所需的内容，构建新的镜像。

3. **Docker 容器**

镜像（`Image`）和容器（`Container`）的关系，就像是面向对象程序设计中的 `类` 和 `实例` 一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。

容器的实质是进程，但与直接在宿主执行的进程不同，容器进程运行于属于自己的独立的 [命名空间](https://en.wikipedia.org/wiki/Linux_namespaces)。因此容器可以拥有自己的 `root` 文件系统、自己的网络配置、自己的进程空间，甚至自己的用户 ID 空间。容器内的进程是运行在一个隔离的环境里，使用起来，就好像是在一个独立于宿主的系统下操作一样。这种特性使得容器封装的应用比直接在宿主运行更加安全。也因为这种隔离的特性，很多人初学 Docker 时常常会混淆容器和虚拟机。

前面讲过镜像使用的是分层存储，容器也是如此。每一个容器运行时，是以镜像为基础层，在其上创建一个当前容器的存储层，我们可以称这个为容器运行时读写而准备的存储层为**容器存储层**。

容器存储层的生存周期和容器一样，容器消亡时，容器存储层也随之消亡。因此，任何保存于容器存储层的信息都会随容器删除而丢失。

按照 Docker 最佳实践的要求，容器不应该向其存储层内写入任何数据，容器存储层要保持无状态化。所有的文件写入操作，都应该使用 `数据卷（Volume）`、或者绑定宿主目录，在这些位置的读写会跳过容器存储层，直接对宿主（或网络存储）发生读写，其性能和稳定性更高。

数据卷的生存周期独立于容器，容器消亡，数据卷不会消亡。因此，使用数据卷后，容器删除或者重新运行之后，数据却不会丢失。

![img](http://www.yiibai.com/uploads/images/201706/0206/262150629_86976.png)

| 标题            | 说明                                                         |
| :-------------- | :----------------------------------------------------------- |
| 镜像(Images)    | Docker 镜像是用于创建 Docker 容器的模板。                    |
| 容器(Container) | 容器是独立运行的一个或一组应用。                             |
| 客户端(Client)  | Docker 客户端通过命令行或者其他工具使用 Docker API (https://docs.docker.com/reference/api/docker_remote_api) 与 Docker 的守护进程通信。 |
| 主机(Host)      | 一个物理或者虚拟的机器用于执行 Docker 守护进程和容器。       |
| 仓库(Registry)  | Docker 仓库用来保存镜像，可以理解为代码控制中的代码仓库。Docker Hub([https://hub.docker.com](https://hub.docker.com/)) 提供了庞大的镜像集合供使用。 |
| Docker Machine  | Docker Machine是一个简化Docker安装的命令行工具，通过一个简单的命令行即可在相应的平台上安装Docker，比如VirtualBox、 Digital Ocean、Microsoft Azure。 |

# 2.Docker的安装与启动

## 2.1安装Docker

1. 系统要求

   Docker CE 支持 64 位版本 CentOS 7，并且要求内核版本不低于 3.10。 CentOS 7 满足最低内核的要求，但由于内核版本比较低，部分功能（如 `overlay2` 存储层驱动）无法使用，并且部分功能可能不太稳定。

2. 卸载旧版本

   旧版本的 Docker 称为 `docker` 或者 `docker-engine`，使用以下命令卸载旧版本：

   ```sh
   $ sudo yum remove docker \
                     docker-client \
                     docker-client-latest \
                     docker-common \
                     docker-latest \
                     docker-latest-logrotate \
                     docker-logrotate \
                     docker-selinux \
                     docker-engine-selinux \
                     docker-engine
   ```

3. yum包更新到最新

   ```sh
   sudo yum update
   ```

4. 安装需要的软件包，yum-util提供yum-config-manager功能，另外两个是devicemapper驱动依赖的

   ```sh
   $ sudo yum install -y yum-utils \
              device-mapper-persistent-data \
              lvm2
   ```

5. 设置yum源为为阿里云

   ```sh
   sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
   # 官方源
   # $ sudo yum-config-manager \
   #     --add-repo \
   #     https://download.docker.com/linux/centos/docker-ce.repo 
   ```

6. 安装docker

   更新 `yum` 软件源缓存，并安装 `docker-ce`。

   ```sh
   sudo yum makecache fast
   sudo yum install docker-ce
   ```

7. 安装后查看docker版本

   ```sh
   docker -v
   ```

## 2.2设置ustc的镜像

docker 从 docker hub 拉取镜像，因为是从国外获取，速度较慢。可以通过配置国内镜像源的方式，从国内获取镜像，提高拉取速度。这里介绍使用[中国科学技术大学](https://www.baidu.com/s?wd=中国科学技术大学&tn=24004469_oem_dg&rsv_dl=gh_pl_sl_csd)（LUG@USTC）的开源镜像  **https://docker.mirrors.ustc.edu.cn**

需要先启动Docker，才能找到/etc/docker/文件夹，且里面有key.json，没有daemon.json，需要touch新建一个daemon.json文件

输入如下命令，编辑 docker 的 daemon.json 配置文件

```sh
vi /etc/docker/daemon.json
```

配置如下内容：

```json
{
    "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}
```

2.3设置阿里云镜像

ustc的镜像有时候也很慢，我们可以选择阿里云镜像

```ruby
[root@localhost ~]# sudo tee /etc/docker/daemon.json <<-'EOF'
> {
>   "registry-mirrors": ["https://9cpn8tt6.mirror.aliyuncs.com"]
> }
> EOF
{
  "registry-mirrors": ["https://9cpn8tt6.mirror.aliyuncs.com"]
}
[root@localhost ~]# systemctl daemon-reload
[root@localhost ~]# systemctl restart docker
```

## 2.4Docker的启动与停止

systemctl命令是系统服务管理器指令

1. 启动docker

   ```sh
   systemctl start docker
   ```

2. 停止docker

   ```sh
   systemctl stop docker
   ```

3. 重启docker

   ```sh
   systemctl restart docker
   ```

4. 查看docker状态

   ```sh
   systemctl status docker
   ```

5. 开机启动

   ```sh
   systemctl enable docker
   ```

6. 查看docker概要信息

   ```sh
   docker info
   ```

7. 查看docker帮助文档

   ```sh
   docker --help
   ```

# 3.常用命令

## 3.1镜像相关命令

### 3.1.1查看镜像

```sh
docker images
```

```sh
$ docker image ls
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
redis                latest              5f515359c7f8        5 days ago          183 MB
nginx                latest              05a60462f8ba        5 days ago          181 MB
mongo                3.2                 fe9198c04d62        5 days ago          342 MB
<none>               <none>              00285df0df87        5 days ago          342 MB
ubuntu               16.04               f753707788c5        4 weeks ago         127 MB
ubuntu               latest              f753707788c5        4 weeks ago         127 MB
ubuntu               14.04               1e0c3dd64ccd        4 weeks ago         188 MB
```

列表包含了 `仓库名`、`标签`、`镜像 ID`、`创建时间` 以及 `所占用的空间`。

**镜像 ID** 则是镜像的唯一标识，一个镜像可以对应多个**标签**。

这些镜像都存储在Docker宿主机的/var/lib/docker目录下

### 3.1.2搜索镜像

```
docker search 镜像名称
```

NAME ：镜像仓库

DESCRIPTION：镜像描述信息

STARS：镜像收藏数

OFFICIAL：是否为docker官方发布的镜像

AUTOMATED：是否为Docker Hub自动化构建的镜像

说明：

--no-trunc : 显示完整的镜像描述

-s : 列出收藏数不小于指定值的镜像。

--automated : 只列出 automated build类型的镜像；

### 3.1.3拉取镜像

拉取镜像就是从中央仓库下载镜像到本地

```shell
docker pull 镜像名称
```

例如我要下载centos7镜像

```shell
docker pull centos:7
```

默认拉取tag为最新版的镜像

### 3.1.4删除镜像

按照镜像ID删除镜像

```shell
docker rmi 镜像ID
```

删除所有镜像

```sh
docker rmi `docker images -q`
```

## 3.2容器相关命令

### 3.2.1查看容器

查看正在运行的容器

```shell
docker ps
```

查看所有容器

```shell
docker ps -a
```

查看最后一次运行的容器

```shell
docker ps -1
```

查看停止的容器

```shell
docker ps -f status=exited
```

### 3.2.2创建与启动容器

创建容器命令：docker run

参数说明：

| 参数  | 说明                                                         |
| ----- | ------------------------------------------------------------ |
| -i    | 表示运行容器                                                 |
| -t    | 表示容器启动后会进入命令行。容器创建就能登录进去，即分配一个伪终端 |
| -name | 为创建的容器命名                                             |
| -v    | 表示目录映射关系。前者是宿主机目录，后者是映射到宿主机上的目录，可以使用多个-v做多个目录或文件映射。注意：最好做目录映射，在宿主机上做修改，然后共享到容器上 |
| -d    | 表示创建一个守护式容器在后台运行。这样创建容器后不会自动登录容器，如果只加-i-t两个参数，创建后就会自动进入容器 |
| -p    | 表示端口映射，前者是宿主机端口，后者是容器内的映射端口。可以使用多个-p做多个端口映射 |

1. 交互式方式创建容器

   ```shell
   docker run -it --name=容器名称 镜像名称:标签 /bin/bash
   ```

   退出时我们通过ps命令查看，发现可以看到启动的容器，状态为启动状态

   ```shell
   docker ps
   ```

   | CONTAINER ID | IMAGE    | COMMAND     | CREATED       | STATUS            | PORTS | NAMES    |
   | ------------ | -------- | ----------- | ------------- | ----------------- | ----- | -------- |
   | 86237b96f25b | centos:7 | "/bin/bash" | 2 minutes ago | Up About a minute |       | mycentos |

   退出当前容器：

   ```shell
   exit
   ```

   交互式方式创建容器，exit命令会停止容器

   退出后的容器用下面的ps命令查看

   ```shell
   docker ps -a
   docker ps -f status=exited
   ```

2. 守护式方式创建容器

   ```shell
   docker run -di --name=容器名称 镜像名称:标签
   ```

   守护式方式创建容器，exit命令不会停止容器

   登录守护式容器方式：

   ```shell
   docker exec -it 容器名称（或者容器ID） /bin/bash
   ```

### 3.2.3创建与启动容器

1. 停止容器

   ```shell
   docker stop 容器名称（或者容器ID）
   ```

2. 启动容器

```shell
docker start 容器名称（或者容器ID）
```

### 3.2.4文件拷贝

1. 文件拷贝到容器

   ```shell
   docker cp 需要拷贝的文件或目录 容器名称:容器目录
   ```

2. 文件从容器内拷贝出来

```shell
docker cp 容器名称:容器目录 需要拷贝的文件或目录 
```

### 3.2.5目录挂载

我们可以在创建容器的时候，将宿主机的目录与容器内的目录进行映射，这样我们就可以实现宿主机和容器目录的双向自动同步

创建容器添加-v参数 后边位 宿主机目录:容器目录，例如

```shell
docker run -it -v /宿主机目录:/容器目录 镜像名
docker run -id -v /usr/local/myhtl:/usr/local/myhtml --name=mycentos3 centos:7
```

多目录挂载

```shell
docker run -it -v /宿主机目录:/容器目录 -v /宿主机目录2:/容器目录2 镜像名
```

注意：

如果你同步的是多级目录，可能会出现权限不足的提示；

这是因为Centos7中的安全模块selinux把权限禁掉了，我们需要添加 --privileged=true 来解决挂载的目录没有权限的问题；

### 3.2.6查看容器ip地址

1. 查看容器运行的各种数据

   ```shell
   docker inspect 容器名称（或者容器ID）
   ```

2. 直接输出ip地址

   ```shell
   docker inspect --format='{{.NetworkSettings.IPAddress}}' 容器名称（或者容器ID）
   ```

# 4.应用部署

## 4.1MySql部署

1. 拉取mysql镜像

   ```shell
   docker pull centos/mysql-57-centos7
   ```

2. 创建容器

   ```shell
   docker run -di --name=tensquare_mysql -p 33306:3306 -e MYSQL_ROOT_PASSWORD=123456 centos/mysql-57-centos7
   ```

   -p表示端口映射，格式为 宿主机端口:容器运行端口

   -e表示添加环境变量，MYSQL_ROOT_PASSWORD是root用户的登录密码

3. 进入mysql

   ```shell
   docker exec -it tensquare_mysql /bin/bash
   ```

4. 登录mysql

   ```shell
   mysql -u root -p
   ```

   报错：Access denied for user 'root'@'localhost' (using password: YES)

   解决方案：待解决

5. 远程登录mysql

## 4.2Tomcat部署

1. 拉取镜像

   ```shell
   docker pull tomcat:7-jre7
   ```

2. 创建容器

   ```shell
   docker run -di --name=mytomcat -p 9000:8080 -v /usr/local/webapps:/usr/local/tomcat/webapps tomcat:7-jre7
   ```

3. 上传war包项目，即可在浏览器访问项目

## 4.3Nginx部署

1. 拉取镜像

   ```shell
   docker pull nginx
   ```

2. 创建容器

```shell
docker run -di --name=mynginx -p 80:80 nginx
```

3. 进入容器

   ```shell
   docker exec -it mynginx /bin/bash
   ```

4. 上传项目

   在/etc/nginx/nginx.conf

   cat nginx.conf会发现/etc/nginx/conf.d/*.conf

   有个default.conf cat打开会发现root /usr/share/nginx/html

   在这里就可以上传项目到容器了

## 4.4Redis部署

1. 拉取镜像

   ```shell
   docker pull redis
   ```

2. 创建容器

```shell
docker run -di --name=myredis -p 6379:6379 redis
```

3. 进入容器

   ```shell
   
   ```

4. 远程连接

   windows下用cmd命令

   ```cmd
   redis-cli -h 宿主机ip
   ```

# 5.备份与迁移

## 5.1容器保存为镜像

```shell
docker commit mynginx mynginx_i
```

## 5.2镜像备份

备份：

```shell
docker save -o mynginx.tar mynginx_i 
```

导入：

```
docker load -i mynginx.tar
```

# 6.Dockerfile

## 6.1什么是Dockerfile

Dockerfile是由一系列命令和参数构成的脚本，这些命令应用于基础镜像并最终创建一个新的镜像。

1. 对于开发人员：可以为开发团队提供一个完全一致的开发环境；
2. 对于测试人员：可以直接拿开发时所构建的镜像或通过Dockerfile文件构建一个新的镜像开始工作了；
3. 对于运维人员：在部署时，可以实现应用的无缝移植。

## 6.2常用命令

| 命令                                | 作用                                                         |
| ----------------------------------- | ------------------------------------------------------------ |
| FROM image_ name:tag                | 定义了使用哪个基础镜像启动构建流程                           |
| MAINTAINER user name                | 声明镜像的创建者                                             |
| ENV key value                       | 设置环境变量(可以写多条)                                     |
| RUN command                         | 是Dockerfile的核心部分(可以写多条)                           |
| ADD source dir/file dest dir/file   | 将宿主机的文件复制到容器内，如果是一 个压缩文件，将会在复制后自动解压 |
| COPY source_ dir/file dest dir/file | 和ADD相似，但是如果有压缩文件并不能解压                      |
| WORKDIR path_ dir                   | WORKDIR path_ dir                                            |

## 6.3使用脚本创建镜像 

步骤：

1. 创建目录

   ```shell
   mkdir -p /usr/local/dockerjdk8
   ```

2. 下载jdk-8u171-linux-x64-.tar.gz并上传到服务器（虚拟机）中的/usr/local/dockerjdk8目录

3. 创建文件Dockerfile `vi Dockerfile`

   ```shell
   #依赖镜像名称和ID
   FROM centos:7
   #指定镜像创建者信息
   MAINTAINER ITCAST
   #切换工作目录
   WORKDIR /usr
   RUN mkdir /usr/local/java
   #ADD 是相对路径jar，把java添加到容器中
   ADD jdk-8u171-linux-x64-.tar.gz /usr/local/java/
   #配置环境变量
   ENV JAVA_HOME /usr/local/java/jdk1.8.0_171
   ENV JRE_HOME $JAVA_HOME/jre
   ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
   ENV PATH $JAVA_HOME/bin:$PATH
   ```

4. 执行命令构建镜像

   ```shell
   docker build -t='jdk1.8' .
   ```

   注意后边的空格和点，不要忽略

5. 查看镜像是否建立完成

   ```shell
   docker images
   ```

# 7.Docker私有仓库

## 7.1私有仓库搭建与配置

1. 拉取私有仓库镜像

   ```shell
   docker pull registry
   ```

2. 启动私有仓库容器

   ```
   docker run -id --name=registry -p 5000:5000 registry
   ```

3. 打开浏览器输入地址http://192.168.62.3:5000/v2/_catalog看到`{"repositories":[]}`表示私有仓库搭建成功，并且内容为空

4. 修改daemon.json

   ```shell
   vi /etc/docker/daemon.json
   ```

   添加一下内容，保存退出

   ```json
   {
       "insecure-registries":["192.168.62.3:5000"]
   }
   ```

   此步用于让docker信任私有仓库地址

5. 重启docker服务

   ```shell
   systemctl restart docker
   ```

## 7.2镜像上传至私有仓库

1. 如果registry没有启动需要重启

   ```shell
   docker start registry
   ```

2. 标记此镜像为私有仓库的镜像

   ```
   docker tag jdk1.8 192.168.62.3:5000/jdk1.8
   ```

3. 上传标记的镜像

   ```shell
   docker push 192.168.62.3:5000/jdk1.8
   ```

4. 打开浏览器输入地址http://192.168.62.3:5000/v2/_catalog看到`{"repositories":["jdk1.8"]}`