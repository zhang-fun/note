[视频教程链接](https://www.bilibili.com/video/BV11J411674t?p=14)

[笔记参考链接1](https://blog.csdn.net/weixin_43876317/article/details/103511379)

[笔记参考链接2](https://www.cnblogs.com/mingerlcm/category/976091.html)

# 目录

- [目录](#%e7%9b%ae%e5%bd%95)
- [1.GitLab简介](#1gitlab%e7%ae%80%e4%bb%8b)
  - [1.1什么是gitlab](#11%e4%bb%80%e4%b9%88%e6%98%afgitlab)
  - [1.2gitlab和github有什么不同](#12gitlab%e5%92%8cgithub%e6%9c%89%e4%bb%80%e4%b9%88%e4%b8%8d%e5%90%8c)
  - [1.3gitlab优势和使用场景](#13gitlab%e4%bc%98%e5%8a%bf%e5%92%8c%e4%bd%bf%e7%94%a8%e5%9c%ba%e6%99%af)
- [2.GitLab服务组成](#2gitlab%e6%9c%8d%e5%8a%a1%e7%bb%84%e6%88%90)
- [3.GitLab安装配置](#3gitlab%e5%ae%89%e8%a3%85%e9%85%8d%e7%bd%ae)
  - [3.1windows安装gitlab](#31windows%e5%ae%89%e8%a3%85gitlab)
  - [3.2linux安装gitlab](#32linux%e5%ae%89%e8%a3%85gitlab)
    - [3.2.1安装](#321%e5%ae%89%e8%a3%85)
    - [3.2.2汉化](#322%e6%b1%89%e5%8c%96)
    - [3.2.3邮箱配置](#323%e9%82%ae%e7%ae%b1%e9%85%8d%e7%bd%ae)
  - [3.3gitlab常用命令](#33gitlab%e5%b8%b8%e7%94%a8%e5%91%bd%e4%bb%a4)
- [5.GitLab日常使用](#5gitlab%e6%97%a5%e5%b8%b8%e4%bd%bf%e7%94%a8)
  - [5.1用户、用户组、项目仓管之间的关系](#51%e7%94%a8%e6%88%b7%e7%94%a8%e6%88%b7%e7%bb%84%e9%a1%b9%e7%9b%ae%e4%bb%93%e7%ae%a1%e4%b9%8b%e9%97%b4%e7%9a%84%e5%85%b3%e7%b3%bb)
  - [5.2如何创建用户、用户组、项目](#52%e5%a6%82%e4%bd%95%e5%88%9b%e5%bb%ba%e7%94%a8%e6%88%b7%e7%94%a8%e6%88%b7%e7%bb%84%e9%a1%b9%e7%9b%ae)
  - [5.3推送项目](#53%e6%8e%a8%e9%80%81%e9%a1%b9%e7%9b%ae)
    - [5.3.1配置 SSHKEY](#531%e9%85%8d%e7%bd%ae-sshkey)
    - [5.3.2推送本地仓库到 GitLab](#532%e6%8e%a8%e9%80%81%e6%9c%ac%e5%9c%b0%e4%bb%93%e5%ba%93%e5%88%b0-gitlab)
    - [5.3.3克隆 GitLab 仓库到本地客户端](#533%e5%85%8b%e9%9a%86-gitlab-%e4%bb%93%e5%ba%93%e5%88%b0%e6%9c%ac%e5%9c%b0%e5%ae%a2%e6%88%b7%e7%ab%af)
- [6.GitLab运维:备份、恢复、升级](#6gitlab%e8%bf%90%e7%bb%b4%e5%a4%87%e4%bb%bd%e6%81%a2%e5%a4%8d%e5%8d%87%e7%ba%a7)
    - [6.1备份配置](#61%e5%a4%87%e4%bb%bd%e9%85%8d%e7%bd%ae)
    - [6.2手动备份](#62%e6%89%8b%e5%8a%a8%e5%a4%87%e4%bb%bd)
    - [6.3定时备份](#63%e5%ae%9a%e6%97%b6%e5%a4%87%e4%bb%bd)
    - [6.4gitlab恢复实践](#64gitlab%e6%81%a2%e5%a4%8d%e5%ae%9e%e8%b7%b5)
    - [6.5升级](#65%e5%8d%87%e7%ba%a7)

# 1.GitLab简介

## 1.1什么是gitlab

学习gitlab之前建议先学习git：[git教程传送门](https://github.com/zxc054/note/blob/master/tool/git/git.md)

GitLab是一种类似github的服务，组织可以使用它来提供git存储库的内部管理。 它是一个自我托管的Git-repository管理系统，可以保持用户代码的私密性，并且可以轻松地部署代码的更改。

GitLab在2011年10月由Dmitriy Zaporozhets和Valery Sizov创建，用Ruby语言完成。它在MIT许可证下发布，稳定版GitLab在2018年1月22日发布。

## 1.2gitlab和github有什么不同

gitlab与github相同点：两者都是提供代码托管服务，在很大程度上gitlab是仿照github来完成的。

gitlab与github的不同点：最大的不同在于github创建私有仓库收费，而gitlab创建私有仓库是免费的。

PS：从代码私有性方面来看，公司不希员工获得全部的代码，这个时候gitlab无疑是最佳的选择。但对于开源项目而言，github依然是代码托管的首选平台。

## 1.3gitlab优势和使用场景

1. 开源免费，搭建简单，维护成本较低，适合中小型公司。

2. 权限管理，能实现代码对部分人可见，确保项目的安全性.

3. 离线同步，保证我们可以不实时依赖网络对代码提交

# 2.GitLab服务组成

gitlab作为一个分布式代码托管软件，它必然有相关的服务组件去支持这个庞大的系统。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019121216283759.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mzg3NjMxNw==,size_16,color_FFFFFF,t_70)

unicorn：gitlab的核心程序。

nginx，作为gitlab的proxy代理，处理http/https以及静态资源访问请求。

gitlab-workhorse：用于处理文件的上传和下载

gitlab-shell：用于处理git clone ，git pull，git push等命令。

Logrotate：用于处理保存所有的gitlab数据相关信息。

Postgresql：用于保存所有的gitlab数据相关信息

redis：用于数据库的缓存，加快前台访问速度，及读写速度。

postgresql:gitlab使用的数据库。

# 3.GitLab安装配置

## 3.1windows安装gitlab

**第1步:** 首先在系统中创建一个名为`'gitlab-runner'`的文件夹。 例如，可以在D盘驱动器中创建`D:\software\gitlab-runner`。

**第2步:** 现在下载[x86](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-386.exe)或[amd64](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe)的二进制文件并将其复制到创建的文件夹中。 将下载的二进制文件(这里我下载的是:`gitlab-runner-windows-amd64.exe`)重命名为`gitlab-runner.exe`。

**第3步:** 打开命令提示符并进入到上面创建的文件夹(`D:\software\gitlab-runner`)。现在输入下面的命令并按回车。

```shell
D:\software\gitlab-runner> gitlab-runner.exe register
Shell
```

**第4步:** 运行上述命令后，它会要求输入`gitlab-ci`协调器URL。

```shell
Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):
https://gitlab.com
Shell
```

**第5步:** 输入runner的`gitlab-ci`标记。

```shell
Please enter the gitlab-ci token for this runner:
xxxx-of-your-token
Shell
```

- 要获取令牌(`token`)，请登录到您的GitLab帐户，打开URL: https://gitlab.com/users/sign_in :
  ![img](http://www.yiibai.com/uploads/images/201804/1004/718090452_58307.png)
- 登录账号后，现在转到项目，并点击项目名称(如:*first-gitlab-project* ):
  ![img](http://www.yiibai.com/uploads/images/201804/1004/197090455_65801.png)
- 单击*Settings* 选项卡下的`CI/CD`选项并展开`runner`设置选项。
  ![img](http://www.yiibai.com/uploads/images/201804/1004/811090458_52505.jpg)
- 在`“Runners Settings”`部分下，将获得如下图所示的令牌:
  ![img](http://www.yiibai.com/uploads/images/201804/1004/301090459_74670.png)
  使用上面红圈中指定的token。

**第6步:** 接下来，输入`runner`的`gitlab-ci`描述。

```shell
Please enter the gitlab-ci description for this runner:
[Admin-PC]: Hello GitLab Runner
Shell
```

**第7步:** 它会要求输入`runner`的`gitlab-ci`标签。

```shell
Please enter the gitlab-ci tags for this runner (comma separated):
tag1,tag2
Shell
```

稍后可在GitLab的用户界面中更改这些标签。

**第8步:** 可以通过将`Runner`设置为`true`值，用来将Runner锁定到当前项目。

```shell
Whether to lock the Runner to current project [true/false]:
[true]: true
Shell
```

完成上述步骤后，您将看到成功的消息:“Registering runner… succeeded”。

**第9步:** 现在输入建立项目的`Runner`执行器。

```shell
Please enter the executor: parallels, shell, docker+machine, kubernetes, docker-
ssh+machine, docker, docker-ssh, ssh, virtualbox:
docker
Shell
```

使用选择器作为`'docker'`来创建构建环境并轻松地管理依赖项来开发项目。

**第10步:** 接下来，它会要求为 docker 选择器设置默认镜像。

```shell
Please enter the default Docker image (e.g. ruby:2.1):
alpine:latest
Shell
```

**第11步:** 完成上述步骤后，将显示“Runner registered successfully”。 下图将描述上述命令的工作流程:
![img](http://www.yiibai.com/uploads/images/201804/1004/821100404_76577.png)

**第12步:** 现在转到您的项目，单击设置部分下的`CI / CD`选项，将看到该项目的激活运行程序。
![img](http://www.yiibai.com/uploads/images/201804/1004/524100406_24281.png)
可以在GitLab-Runner文件夹下的`D:\software\gitlab-runner\config.toml`文件中看到GitLab Runner配置，如下所示:

```shell
concurrent = 1
check_interval = 0

[[runners]]
  name = "Hello GitLab Runner"
  url = "https://gitlab.com"
  token = "f12fa30b56c49dea3c356480027f7e"
  executor = "docker"
  [runners.docker]
    tls_verify = false
    image = "latest"
    privileged = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
  [runners.cache]
```

## 3.2linux安装gitlab

[参考教程链接1](https://blog.csdn.net/huo108/article/details/88825963)

[参考教程链接2](https://blog.csdn.net/wanghwang2008/article/details/75006599)

### 3.2.1安装

安装和配置必要的依赖项。

> 在CentOS上，以下命令也将在系统防火墙中打开HTTP和SSH访问。

```bash
sudo yum install -y curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo systemctl reload firewalld
```

> 接下来，安装Postfix以发送通知电子邮件。如果要使用其他解决方案发送电子邮件，请跳过此步骤， 并在安装GitLab之后[配置外部SMTP服务器](https://docs.gitlab.com/omnibus/settings/smtp.html)。

```bash
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
```

1. 配置yum源

   ```bash
   vim /etc/yum.repos.d/gitlab-ce.repo
   ```

   添加以下内容

   ```bash
   [gitlab-ce]
   name=gitlab-ce
   baseurl=http://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el6
   Repo_gpgcheck=0
   Enabled=1
   gpgcheck=0
   ```

2. 更新缓存

   ```bash
   #更新缓存失败可以先执行yum clean all 即可;若还是有问题 可以 yum check-update
   sudo yum makecache
   ```

3. 安装Gitlab社区版

   ```bash
   sudo yum intall gitlab-ce        #自动安装最新版
   sudo yum install gitlab-ce-x.x.x    #安装指定版本
   ```

   > Gitlab分为社区版(gitlab-ce)和企业版(gitlab-ee),企业版是收费的，所以我这边安装的是社区版

   通过上面三步，不出意外的话显示下面的界面，gitlab就已经安装完成了，接下来修改以下域名就可以访问了

   ```bash
   It looks like GitLab has not been configured yet; skipping the upgrade script.
   
          *.                  *.
         ***                 ***
        *****               *****
       .******             *******
       ********            ********
      ,,,,,,,,,***********,,,,,,,,,
     ,,,,,,,,,,,*********,,,,,,,,,,,
     .,,,,,,,,,,,*******,,,,,,,,,,,,
         ,,,,,,,,,*****,,,,,,,,,.
            ,,,,,,,****,,,,,,
               .,,,***,,,,
                   ,*,.
     
   
   
        _______ __  __          __
       / ____(_) /_/ /   ____ _/ /_
      / / __/ / __/ /   / __ `/ __ \
     / /_/ / / /_/ /___/ /_/ / /_/ /
     \____/_/\__/_____/\__,_/_.___/
     
   
   Thank you for installing GitLab!
   GitLab was unable to detect a valid hostname for your instance.
   Please configure a URL for your GitLab instance by setting `external_url`
   configuration in /etc/gitlab/gitlab.rb file.
   Then, you can start your GitLab instance by running the following command:
     sudo gitlab-ctl reconfigure
   
   For a comprehensive list of configuration options please see the Omnibus GitLab readme
   https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md
   
     Verifying  : gitlab-ce-12.10.6-ce.0.el6.x86_64                                                                                                              1/1 
   
   Installed:
     gitlab-ce.x86_64 0:12.10.6-ce.0.el6    
   ```

4. 修改域名访问

   ```bash
   vim  /etc/gitlab/gitlab.rb
   ```

   修改external_url值

   ```bash
   #在浏览器中通过这个地址就可以访问Gitlab页面了
   external_url 'http://192.168.0.100/gitlab'
   ```

   更新gitlab配置并启动服务

   ```bash
   gitlab-ctl reconfigure
   ```

   首次这一步耗时需要几分钟，耐心等待。。。

   注意：如果这一步出现卡住的现象（比如十几分钟没有反应了），可以通过以下步骤重新配置：

   1、按住CTRL+C强制结束；

   2、运行：sudo systemctl restart gitlab-runsvdir；

   3、再次执行：sudo gitlab-ctl reconfigure

5. 访问Gitlab页面

   在浏览器中输入“http://192.168.0.100/gitlab”打开页面：

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_01.png)

   首次打开需要设置密码，设置完成后即可以登录。

   至此，Gitlab的安装已经基本完成，不过这时候打开的页面是英文的，还需要进行汉化，如果不需要汉化的同学可以跳过；

   6. 问题

      [问题参考链接](https://blog.csdn.net/qq_36695400/article/details/82845746)

      gitlab默认的端口是8080，但当本地的8080端口被占用（如：已有运行的tomcat服务）时，是无法访问gitlab的，页面会出现502错误。这个时候就需要修改tomcat的默认端口或者修改gitlab的默认端口，而由于项目已在tomcat运行，所以我通过修改gitlab的端口解决问题（有需要的朋友可自行百度tomcat如何修改默认端口）。

      查看端口情况：netstat -ntpl

      这类问题其实网上有很多解决方法，而我搜索了一下发现无法解决我的问题。经过一段时间摸索后总结一下：
      1、修改nginx和unicorn服务的端口：
      网上的方法是修改其中一个服务的端口，但我修改后还是报502页面错误，所以我把两个服务的端口都修改了
      输入命令：vim /etc/gitlab/gitlab.rb
      键入/nginx['listen_port']找到
      ![nginx端口](https://img-blog.csdn.net/20180925212343374?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2Njk1NDAw/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

      在nil值一行下面添加8070端口；
      键入`/unicorn['port']`找到

      ![在这里插入图片描述](https://img-blog.csdn.net/20180925212653676?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2Njk1NDAw/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

      ![在这里插入图片描述](https://img-blog.csdn.net/20180925212653676?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2Njk1NDAw/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

      ```
      external_url 'http://192.168.1.1:8070'
      ```

保存修改:`:wq!`

理论上上述步骤就能解决端口冲突问题，如果还是不行，尝试下面操作：

* 检查`vim /var/opt/gitlab/nginx/conf/gitlab-http.conf`里监听的端口和server_name（你的虚拟机ip）是否和刚刚配置的一致。

![在这里插入图片描述](https://img-blog.csdn.net/20180925213820373?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2Njk1NDAw/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

* 有可能是防火墙的配置问题，输入：`firewall-cmd --zone=public --permanent --add-port=8070/tcp`

* 重启：`firewall-cmd --reload`

### 3.2.2汉化

1. 备份

   如果你是刚安装完Gitlab，此时汉化，则可以不需要备份，汉化出差了大不了重新再安装一遍；

   如果已经有重要数据了，此时汉化，怕汉化失败导致服务瘫痪，从而导致数据丢失，则在汉化前先做备份

   备份路径的配置文件路径：/etc/gitlab/gitlab.rb

   ```bash
   gitlab-rake gitlab:backup:create
   ```

2. 查看Gitlab版本

   这一步非常重要，因为版本不同对应不同的汉化版本，一旦版本对应不上，则容易导致Gitlab瘫痪

   查看版本方式：

   ```bash
   cat /opt/gitlab/embedded/service/gitlab-rails/VERSION
   或者
   rpm -q gitlab-ce
   ```

   运行结果：

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_02.png)

   我安装的版本是11.7.7，下面的步骤需要用到

3. 下载中文补丁

   这个下载需要看网速，耐心等待。。。

   ```bash
   git clone https://gitlab.com/xhang/gitlab.git 
   ```

4. 解压中文补丁

   ```bash
   tar xf gitlab-10-3-stable-zh.tar.bz2
   ```

   如果没有安装tar，可以通过以下命令安装

   ```bash
   yum install -y tar
   ```

5. 停止Gitlab服务

   这一步也可以放到第一步执行，汉化补丁打patch之前执行就可以

   ```bash
   gitlab-ctl stop
   ```

   切换到gitlab汉化补丁所在的目录

   ```bash
   cd /root/gitlab
   ```

6. patch文件生成

   ```bash
   git diff v11.7.7 v11.7.7-zh >../v11.7.7-zh.diff
   ```

   上面的版本号根据gitlab的版本修改，我的版本是11.7.7 所以上面使用11.7.7

   我们可以看一下生成的patch文件

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_03.png)

   如果还没有安装patch，可以先通过下面命令安装

   ```bash
   yum install patch
   ```

   看到Complate字样，则说明汉化成功；

7. 重启Gitlab

   ```
   gitlab-ctl reconfigure
   gitlab-ctl start
   ```

8. 打开Gitlab页面

   重启后需要等待一段时间，gitlab可能在加载东西，反正我的重启后立马去访问页面会502错误，过了一段时间后可以打开页面。

   在浏览器中刷新刚才那个页面（我的是：http://192.168.0.100/gitlab）
   
   可以看到上面有部分内容已经是中文的了，因为我的版本比较新，所以汉化程度还不够完善，
   旧的版本汉化应该会好一点，之后我再升级汉化包吧。。。

9. 页面面板不需要汉化，可以通过一下设置

   `点页面右上角头像那里`-->`Settings`-->`左面面板的Applications`-->`Language`-->`下拉框里选择语言`-->`Save changes`-->`刷新页面即可`

### 3.2.3邮箱配置

Gitlab新增用户有两种方式：

- 访问http://192.168.0.100/gitlab直接注册；
- 管理员通过设置页面添加用户，填入用户验证邮箱，用户收到邮件后设置密码；

通过第二种方式添加用户时，就需要配置gitlab的发送邮箱。

分为以下几个步骤：

1. 安装postfix

   ```bash
   yum -y install postfix
   ```

   安装完之后，启动postfix

   ```bash
   systemctl start postfix
   ```

   同时设置开机自启动

   ```bash
   systemctl enable postfix
   ```

   查看是否开启成功

   ```bash
   systemctl status postfix
   ```

   看到active (running)则说明启动成功

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_05.png)

2. 配置gitlab邮箱

   ```bash
   vim /etc/gitlab/gitlab.rb
   ```

   添加以下内容（以QQ邮箱为例）：

   ```bash
   ### Email Settings
    gitlab_rails['gitlab_email_enabled'] = true
    gitlab_rails['gitlab_email_from'] = '123456@qq.com'
    gitlab_rails['gitlab_email_display_name'] = 'admin_gitLab'
   ### GitLab email server settings
   gitlab_rails['smtp_enable'] = true
   gitlab_rails['smtp_address'] = "smtp.qq.com"
   gitlab_rails['smtp_port'] = 465
   gitlab_rails['smtp_user_name'] = "123456@qq.com"
   gitlab_rails['smtp_password'] = "你的发件邮箱授权密码"
   gitlab_rails['smtp_domain'] = "qq.com"
   gitlab_rails['smtp_authentication'] = "login"
   gitlab_rails['smtp_enable_starttls_auto'] = true
   gitlab_rails['smtp_tls'] = true
   #同时prometheus['enable'] 改为false,因为比较吃内存
   prometheus['enable'] = false
   ```

   添加以下内容（以企业微信邮箱为例）：

   ```bash
   gitlab_rails['smtp_enable'] = true
   gitlab_rails['smtp_address'] = "smtp.exmail.qq.com" #smtp设置
   gitlab_rails['smtp_port'] = 465
   gitlab_rails['smtp_user_name'] = "wu**@m**.com"  # 你自己企业微信邮箱账号
   gitlab_rails['smtp_password'] = "*************"    # 企业微信邮箱账号授权码
   gitlab_rails['smtp_domain'] = "smtp.exmail.qq.com"
   gitlab_rails['smtp_authentication'] = "login"
   gitlab_rails['smtp_enable_starttls_auto'] = true
   gitlab_rails['smtp_tls'] = true
   gitlab_rails['gitlab_email_from'] = 'wu**@m.com'   # 你自己企业微信邮箱账号
   #同时prometheus['enable'] 改为false,因为比较吃内存
   prometheus['enable'] = false
   ```

   关于smtp和授权码的设置：

   * 点开企业微信邮箱，点击上方的“设置”->“客户端设置”，就会看到如下页面

     ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_06.png)

   * smtp就设置：smtp.exmail.qq.com

   * 点击“获取授权密码”，将生成的授权密码填入即可；

3. 重启Gitlab

   ```bash
   gitlab-ctl reconfigure
   ```

4. 测试发送邮件

   重启成功后，测试一下是否能正常发送邮件

   进入gitlab控制台

   ```bash
   gitlab-rails console
   ```

   输入测试邮箱和内容

   ```bash
   Notify.test_email('wu**@m**.com', '邮件标题_test', '邮件正文_test').deliver_now
   ```

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_07.png)

5. ### gitlab上实际测试

   在gitlab上新增一个用户

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_08.png)

   输入用户名和邮箱

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_09.png)

   创建完成后观察是否已经收到邮箱

   ![image](https://ailianblog.oss-cn-shenzhen.aliyuncs.com/gitlab/bolg_gitlab_10.png)

   收到邮件说明我们配置成功！！！

## 3.3gitlab常用命令

| 命令功能                   | 执行命令                                       |
| -------------------------- | ---------------------------------------------- |
| 重启配置，并启动gitlab服务 | sudo gitlab-ctl reconfigure                    |
| 启动                       | sudo gitlab-ctl start                          |
| 重新启动GitLab             | sudo gitlab-ctl restart                        |
| 停止所有 gitlab            | sudo gitlab-ctl stop                           |
| 查看服务状态               | sudo gitlab-ctl status                         |
| 查看Gitlab日志             | sudo gitlab-ctl tail                           |
| 修改默认的配置文件         | sudo vim /etc/gitlab/gitlab.rb                 |
| 检查gitlab                 | gitlab-rake gitlab:check SANITIZE=true --trace |

# 5.GitLab日常使用

## 5.1用户、用户组、项目仓管之间的关系

GitLab 是通过组（group）的概念来统一管理仓库（project）和用户（user），通过创建组，在组下再创建仓库，再将用户加入到组，从而实现用户与仓库的权限管理



## 5.2如何创建用户、用户组、项目

[参考链接](https://www.cnblogs.com/mingerlcm/p/12589781.html)

创建仓库之前先创建组

1. 创建组 creategroup

   在管理员页面点击页面顶部的 Admin area 按钮，进入管理员区域

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328192105106-1078606443.png)

   在页面右侧点击绿色的 New group 按钮，进入创建组页面

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328222248306-1526711594.png)

   在创建组页面中，组路径和组名称为必填项，而且此两处内容好一致

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328224722887-1676879278.png)

   的路径和组的名称一致，组的描述可写可不写

   注：visibility Level：选择谁可以访问该组：我们默认选择 private 即可， 

   Private:只有授权的用户才可以看到 分配的用户
   Internal：只要是登录 gitlab 的用户就可以看到
   Public：只要可以访问 gitlab web 页面的人就可以看到

   
   点击页面下的 create group 按钮，完成组的创建，进入组管理页面

    ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328225816548-1801288828.png)

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328230209908-1295556518.png)

   在页面我们可为组添加用户。 默认有一个管理员用户

2. 创建用户 createuser

   在管理员页面点击页面顶部的 Admin area 按钮，进入管理员区域

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328192105106-1078606443.png)

    

   在页面右侧点击绿色的 New user 按钮，进入创建用户页面： 

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328230802384-601209797.png)

    

    

    在创建用户页面，输入用户名昵称、用户名、电子邮件、选择用户级别

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328233644562-2112870370.png)

    

    

    创建dev用户

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328234314672-394601462.png)

    

    

    

   点击页面下部的 create user 按钮，完成用户创建，进入用户管理页面 

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328235058085-1044984572.png)

    

    

    

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328235414262-1536225732.png)

    

    

    

   点击页面右上页的 Edit 按钮，为用户设置初始密码

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328235705021-216248213.png)

   在此页面也可同时修改用户注册信息。

   普通用户不让建组

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200328235919366-1748969732.png)

    

    

    按保存

    

   有模拟用户登录

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329000232537-853213032.png)

    

    

   模拟这个用户登录

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329000333286-1990801010.png)

3. 用户授权（grantuser）

   用户创建完成后，我们就需要对用户进行授权，从而使用户可以管理仓库，有两种方式，
   一 是将用户加入到组，这样用户可以管理组内的仓库，

   二 是直接授权用户管理仓库。通常我们采用的方式是将用户加入相应的组，并赋予不同的角色。GitLab 中用户的角色是系统定义好的，不能更改。这一点可能不符合我们正常的思维习惯。

   下面我们将刚创建的 dev 用户添加到我们的 test 组，将赋予 developer 权限

   

   在管理员区域，

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329001349527-1369844388.png)

    

    

    点击 test组，进入组管理页面:

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329002130777-959227984.png)

    

    

    

   选择我们刚创建的 dev 用户，选择 developer 角色，然后添加到组： 

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329002553201-163475418.png)

    

   Gitlab用户在组中有五种权限：
   Guest、Reporter、Developer、Master、Owner

   | 权限       | 翻译     | 说明                                                         |
   | ---------- | -------- | ------------------------------------------------------------ |
   | Guest      | 访客     | 可以创建issue、发表评论，不能读写版本库                      |
   | Reporter   | 报告者   | 可以克隆代码，不能提交，QA、PM可以赋予这个权限               |
   | Developer  | 开发人员 | 可以克隆代码、开发、提交、push，RD可以赋予这个权限           |
   | Maintainer | 主程序员 | 可以创建项目、添加tag、保护分支、添加项目成员、编辑项目，核心RD负责人可以赋予这个权限 |
   | Owner      | 所有者   | 可以设置项目访问权限 - Visibility Level、删除项目、迁移项目、管理组成员，开发组leader可以赋予这个权限 |

   添加了

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329002712793-1590266648.png)

    

    

    

   master 和owner是仓库管理者权限

   注：关于每一种角色对应的权限，可参见官方文档相关内容：
   https://docs.gitlab.com/ee/user/permissions.html

4. 创建仓库（createproject）

   在 GitLab 中，你可以创建 project 用来存储你的程序代码、作为一个问题跟踪器、用于代码协作、用于持续集成中的构建、测试和部署等。

   在**管理员区域**点击 New project 按钮，或者点击导航栏中的 选择 New project 选项，
   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329151254958-1668904092.png)

    

    

    进入到新建 project 页面，

   可以建立空仓库

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329160730468-1873477739.png)

    

    

   用模板建仓库

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329161228602-1285275028.png)

    

    

    ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329161348914-668647642.png)

    

    

    

    

   选择仓库所属的组，输入仓库名称、仓库描述，选择可见级别，即可完成仓库创建。

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329161944087-2142113518.png)

    

    

    

   权限级别和组的权限级别一样 

    

   注：visibility Level：选择谁可以访问该组：我们默认选择 private 即可， 

    

   Private:只有授权的用户才可以看到 分配的用户
   Internal：只要是登录 gitlab 的用户就可以看到
   Public：只要可以访问 gitlab web 页面的人就可以看到

    

    

   进入**仓库主页面**：页面左侧部分为仓库操作相关菜单栏，右侧空仓库下显示如何在命令行连接该仓库，非空时显示仓库内容。

   

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329163550880-1402174936.png)

    

    

    

    

   Command line instructions 命令行怎么处理

   **Git global setup** 全局配置

   ```bash
   git config --global user.name "Administrator"
   git config --global user.email "admin@example.com"
   ```

   **Create a new repository** 创建空的仓库

   如果新的仓库没有，本地没有仓库，可以克隆仓库到本地

   ```bash
   git clone http://192.168.31.11/test/git_test.git
   // 进入仓库
   cd git_test
   touch README.md
   git add README.md
   git commit -m "add README"
   git push -u origin master
   ```

   **Existing folder** 

   本地如果存在一个文件夹，不是存在一个仓库

   ```bash
   // 到这个文件夹
   cd existing_folder
   // 初始化仓库
   git init
   // 添加远程仓库
   git remote add origin http://192.168.31.11/test/git_test.git
   git add .
   git commit -m "Initial commit"
   git push -u origin master
   ```

   **Git repository**

   本地存在仓库

   ```bash
   // 进入到这个仓库
   cd existing_repo 
   // 添加远程仓库 到gitlab 的仓库
   git remote rename origin old-origin
   git remote add origin http://192.168.31.11/test/git_test.git
   git push -u origin --all
   git push -u origin --tags
   ```

   当把仓库加到组里面，组里面对应用户就可以管理这个组

   回到管理员区域 点击dev用户

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329165045238-1265528462.png)

   模拟dev用户登录

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329165022890-254492942.png)

    

   

    我们将 git_test 仓库加入到test 组后，组内的成员即可以看到该仓库，我们使用dev 用户登录，即可看到该仓库。

   ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329165320509-1786220490.png)

   这样就是基本完成一个仓库的创建，首先创建了组，创建了用户，把用户加入到这个组里面，然后创建了一个仓库，把仓库属于这个组

## 5.3推送项目

把本地的仓库推送到远程仓库 gitlab上

实现gitlab和本地之间进行推送仓库，首先要做ssh认证

[参考教程链接](https://www.cnblogs.com/mingerlcm/p/12593873.html)

### 5.3.1配置 SSHKEY

前面我们已经在 GitLab 创建了仓库，并且授权用户可以使用仓库，我们所有的操作都是在 WEB 页面进行，下在我们介绍如何使用客户端来连接我们的仓库。

我们的仓库是私有的，只有授权的用户才可以访问到该仓库，那么只要将客户端的用户与我们 GitLab 的用户绑定，客户端即可访问到 GitLab 上的仓库，

我们建议使用 SSH 方式实现客户端与 Gitlab 用户的绑定，具体配置如下：


在客户端生成 ssh 密钥对（注 windows 客户端下只能使用 rsa 加密方式）：

我们在本地客户端生成公钥，把公钥配到对应的gitlab用户的ssh key上

**linux生成SSHKEY**

```bash
[root@ci-node1 ~]# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:dKgV7ndo1haY4XeUseN/yjj7/2AWNH1wC2GpK/fLfuY root@ci-node1
The key's randomart image is:
+---[RSA 2048]----+
|        . .  +*o.|
|       . + +.oo=.|
|        = = + *.o|
|       = . = = o.|
|      . S = = o  |
|         = =   o |
|          o . + o|
|            o* =.|
|            +BOE+|
+----[SHA256]-----+
```

```bash
[root@ci-node1 ~]# ll .ssh/
total 8
-rw------- 1 root root 1679 Mar 29 17:55 id_rsa
-rw-r--r-- 1 root root  395 Mar 29 17:55 id_rsa.pub
```

```bash
[root@ci-node1 ~]# cat .ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCstYVepXE4/B85nKNU6gaVpPsjGXu6Ql2sKRgRDxsHGmuZVg+q0GD3c0Ml2XkzozswTRuKCcIhZjK/DEGbbgsBEH8q6HHrWCP6vAWb+7wIEvhtJVm6+5zOGA/AorFczEgnm9b2ekPkwAMV7qrOQ1KG9S94U+XRwAtjgNV0MuYx5S0liBr9KBEt8pQ7Fd2TMo95rF3328gGnWLZJWmETjtJaWpLKDgWnQ7BdlK89o6eyYBtdKJfZ5uYM3tgeX8GiRA+daR8fpEruOSpjuvRbyjRStf5ZXPIemL46lXcEDYurnQ4Uucv5F+paqTWnzYHziQOoKd3Jnxgqsh24TZeoEDP root@ci-node1
```

**windows生成SSHKEY**

在电脑上打开git Bash，输入下面命令

```bash
ssh-keygen.exe
#然后一直Enter即可
#下面命令查看公钥
cat /c/Users/Administrator/.ssh/id_rsa.pub
```

我们将该用户与 GitLab 的 用户绑定，复制用户的公钥，在 GitLab 主页面点击用户设置
![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329181802886-1623148722.png)

 

 

进入到用户设置页面，点击左侧菜单栏的 SSH KEYS

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329182211741-631938170.png)

 

进入到 SSH KEYS 管理页面

 ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329182641328-1104303872.png)

 

 

此处只能添加公钥，如果添加私钥系统将报错，此外一个公钥在整个 GitLab 系统中只能添加一次，但是一个 GitLab 用户可以添加多个公钥。



 

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329182756450-1968332766.png)

 

 

 配置完了，本地客户端和gitlab认证完成了

 

### 5.3.2推送本地仓库到 GitLab

把git_test仓库推到远程仓库 gitlab 

本地已经有git_test仓库

首先我们要将GitLab上的git_test仓库配置为ci-node1上git_test仓库的远程仓库，

 为他配置远程仓库

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329185943692-954571151.png)

 

 

 

```bash
#git remote -v	看看有没有http方式
#remote remove origin 有http方式的先删除，再添加ssh方式
[root@ci-node1 git_test]# git remote add gitlab git@192.168.31.11:test/git_test.git
```

其次，使用 git push 命令直接推送本地仓库的 master 分支到远程仓库

```bash
[root@ci-node1 git_test]# git push -u gitlab master
The authenticity of host '192.168.31.11 (192.168.31.11)' can't be established.
ECDSA key fingerprint is SHA256:Eal3aUwcGcxH1ZD9X799taSiGiCMFgAE7rnoY74f25U.
ECDSA key fingerprint is MD5:27:41:0f:5a:4c:ba:8f:23:bd:23:44:8d:18:53:e6:30.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.31.11' (ECDSA) to the list of known hosts.
Counting objects: 30, done.
Compressing objects: 100% (18/18), done.
Writing objects: 100% (30/30), 2.50 KiB | 0 bytes/s, done.
Total 30 (delta 2), reused 0 (delta 0)
To 192.168.31.11:test/git_test.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from gitlab.
```

提示推送功能，我们在 GitLab 上的 git_test 仓库就可以看到我们推送上来的内容， 

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329190534420-881030726.png)

 

 认证是正确的，现在实现了本地的仓库和远程gitlab的集成，能把仓库推上去

 

### 5.3.3克隆 GitLab 仓库到本地客户端

我们要把gitlab 的仓库 克隆到另外一台机器上

我们在另外一台机器上 ci-node2 安装git服务

参考这个帖子 源码安装git

https://www.cnblogs.com/mingerlcm/p/11403126.html

安装好git后 配置git全局配置 邮箱 name

https://www.cnblogs.com/mingerlcm/p/11403274.html

ci-node2客户端生成ssh 公钥 做ssh认证

```bash
[root@ci-node2 ~]# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:pCb3ozG5sS3ZrnkDUsLTD5RTSule2QxE6oCcmAlzKTU root@ci-node2
The key's randomart image is:
+---[RSA 2048]----+
|o.E.  .*+        |
|oB.+ .=o.        |
|+.+..+o..=       |
|    +o=oo o      |
|    .==+S        |
|    .+oo.        |
|     .=+o        |
|      oX+.       |
|      *=o.       |
+----[SHA256]-----+
```

把公钥配置到gitlab

```bash
[root@ci-node2 ~]# ll .ssh/
total 8
-rw------- 1 root root 1675 Mar 29 23:39 id_rsa
-rw-r--r-- 1 root root  395 Mar 29 23:39 id_rsa.pub
```

首先，我们配置 ci-node2 客户端与 GitLab 上 dev 用户绑定，

 把ci-node2 客户端的公钥配置到 gitlab 上的dev用户绑定

登录dev用户

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329234602863-1979345753.png)

 gitlab要求第一次登录dev用户需要重新修改默认密码

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329234749039-1516259733.png)

 把ci-node2 客户端的公钥配置到 gitlab 上的dev用户绑定

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329235232008-31880022.png)

 ![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200329235327333-774318659.png)

 现在认证已经做完了

第二，使用 git clone 命令克隆仓库到 ci-node2 本地

```bash
[root@ci-node2 data]# git clone git@192.168.31.11:test/git_test.git
Cloning into 'git_test'...
The authenticity of host '192.168.31.11 (192.168.31.11)' can't be established.
ECDSA key fingerprint is SHA256:Eal3aUwcGcxH1ZD9X799taSiGiCMFgAE7rnoY74f25U.
ECDSA key fingerprint is MD5:27:41:0f:5a:4c:ba:8f:23:bd:23:44:8d:18:53:e6:30.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.31.11' (ECDSA) to the list of known hosts.
remote: Counting objects: 30, done.
remote: Compressing objects: 100% (18/18), done.
remote: Total 30 (delta 2), reused 0 (delta 0)
Receiving objects: 100% (30/30), done.
Resolving deltas: 100% (2/2), done.
Checking connectivity... done.
```

我们可以看到已经将 GitLab 上的 git_test 仓库克隆到了 ci-node2 本地，同时为本地仓库添加了一个指向 GitLab 上 git_test 仓库的远程仓库。

执行git clone时候，会默认会仓库添加一个默认的远程仓库 就是gitlab

```bash
[root@ci-node2 data]# ll git_test/
total 4
-rw-r--r-- 1 root root 21 Mar 29 23:55 a
-rw-r--r-- 1 root root  0 Mar 29 23:55 master
-rw-r--r-- 1 root root  0 Mar 29 23:55 test

[root@ci-node2 data]# cd git_test/
[root@ci-node2 git_test]# 
[root@ci-node2 git_test]# git remote
origin
```

我们 ci-node2 的 git_test 上创建一个 dev 分支，并将 dev 分支，推送到 GitLab 上：

验证是否默认远程仓库 是否是gitlab 

建立dev分支

```bash
#建立dev分支
[root@ci-node2 git_test]# git branch dev
#切换到dev分支
[root@ci-node2 git_test]# git checkout dev
Switched to branch 'dev'
```

在dev分支，创建一个文件

```bash
[root@ci-node2 git_test]# touch dev
```

提交commit，需要先配置git全局配置

```bash
[root@ci-node2 git_test]# git add .
[root@ci-node2 git_test]# git commit -m "commit dev on dev branch"
[dev a0e7b8d] commit dev on dev branch
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 dev
```

把dev分支推到gitlab

```bash
[root@ci-node2 git_test]# git status
On branch dev
nothing to commit, working tree clean


[root@ci-node2 git_test]# git push -u origin dev
Counting objects: 2, done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 227 bytes | 0 bytes/s, done.
Total 2 (delta 1), reused 0 (delta 0)
remote: 
remote: To create a merge request for dev, visit:
remote:   http://192.168.31.11/test/git_test/merge_requests/new?merge_request%5Bsource_branch%5D=dev
remote: 
To 192.168.31.11:test/git_test.git
 * [new branch]      dev -> dev
Branch dev set up to track remote branch dev from origin.
```

完成后，我们在 GitLab 上可以看到我们刚推上来的 dev 分支

![img](https://img2020.cnblogs.com/blog/1137246/202003/1137246-20200330004109554-85380737.png)

5.3.4打标签tag

```bash
git tag -a "v1.0" -m "打v1.0标签"
git tag
git push origin v1.0
```

根据commitID打标签

```bash
git relog
git tag -a "v0.1" 7b339fe -m "打v0.1标签"
git tag
git push origin v0.1
```

# 6.GitLab运维:备份、恢复、升级

[参考链接](https://www.cnblogs.com/mingerlcm/p/12633720.html)

gitlab放着企业的源码，源码很重要 gitlab备份非常重要

对 gitlab 进行备份将会创建一个包含所有库和附件的归档文件。

对备份的恢复只能恢复到与备份时的 gitlab 相同的版本。

将 gitlab 迁移到另一台服务器上的最佳方法就是通过备份和还原。

gitlab 提供了一个简单的命令行来备份整个 gitlab，并且能灵活的满足需求



### 6.1备份配置

备 份 文 件 将 保 存 在 配 置 文 件 中 定 义 的 backup_path 中 ， 文 件 名 为
TIMESTAMP_gitlab_backup.tar,TIMESTAMP 为备份时的时间戳。TIMESTAMP 的格式为：
EPOCH_YYYY_MM_DD_Gitlab-version。


默认的备份文件目录为：/var/opt/gitlab/backups，如果自定义备份目录需要赋予目录 git 权限，具体操作如下：

配置文件/etc/gitlab/gitlab.rb

配置文件中加入路径

gitlab_rails['backup_path'] = '/data/backup/gitlab'  

gitlab_rails['backup_keep_time'] = 604800 #备份保留的时间（以秒为单位， 这个是七天默认值）

创建备份目录

```bash
[root@ci-node1 git_test]# mkdir -p /data/backup/gitlab
```

```bash
vim  /etc/gitlab/gitlab.rb
```

加到最后

```bash
#默认的gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"
gitlab_rails['backup_path'] = "/data/backup/gitlab"
gitlab_rails['backup_keep_time'] = 604800#备份保留七天
gitlab_rails['manage_backup_path'] = true
```

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405222519845-898880788.png)

 保存 wq退出

 改完配置执行gitlab-ctl reconfigure

```bash
[root@ci-node1 git_test]# gitlab-ctl reconfigure
```

如果自定义备份目录需要赋予目录 git 权限

```bash
chown -R git.git /data/backup/gitlab
```

执行完gitlab-ctl reconfigure 他会自动帮助我们创建好备份目录的

```bash
[root@ci-node1 git_test]# ll /data/backup/gitlab/
```

权限也不用改 创建的备份目录 和默认备份目录权限一样

```bash
[root@ci-node1 git_test]# ll /data/backup/
total 0
drwx------ 2 git root 6 Apr  5 22:26 gitlab

[root@ci-node1 git_test]# ls -dl /var/opt/gitlab/backups/
drwx------ 2 git root 6 Mar 22 23:25 /var/opt/gitlab/bakups/
```

### 6.2手动备份

在命令执行：/usr/bin/gitlab-rake gitlab:backup:create 生成一次备份

或者gitlab-rake gitlab:backup:create

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```bash
[root@ci-node1 git_test]# /usr/bin/gitlab-rake gitlab:backup:create
Dumping database ... 
Dumping PostgreSQL database gitlabhq_production ... [DONE]
done
Dumping repositories ...
 * test/git_test ... [DONE]
 * test/git_test.wiki ...  [SKIPPED]
done
Dumping uploads ... 
done
Dumping builds ... 
done
Dumping artifacts ... 
done
Dumping pages ... 
done
Dumping lfs objects ... 
done
Dumping container registry images ... 
[DISABLED]
Creating backup archive: 1586097870_2020_04_05_10.2.2_gitlab_backup.tar ... done
Uploading backup archive to remote storage  ... skipped
Deleting tmp directories ... done
done
done
done
done
done
done
done
Deleting old backups ... done. (0 removed)
```

```bash
[root@ci-node1 git_test]# ll /data/backup/gitlab/
total 72
-rw------- 1 git git 71680 Apr  5 22:44 1586097870_2020_04_05_10.2.2_gitlab_backup.tar　　　　　　　　　　　　　　　　　　　　　　　　
时间戳　　　　年月日  gitlab版本号
```

备份包括所有库，文档 打包成一个压缩包

我们看到在设定的目录中生成了对应的备份文件

### 6.3定时备份

定时任务crontab中加入

```bash
crontab -e
```

通过在定时任务里添加：

```bash
# * * * * * 
#分 时 日 月 周
0 2 * * * /opt/gitlab/bin/gitlab-rake gitlab:backup:create CRON=1
#或者00 02 * * * /opt/gitlab/bin/gitlab-rake gitlab:backup:create &>/dev/null
```

查看定时任务

```bash
crontab -l
```

我们来实现定时备份，由于代码是一个企业非常重要的资产，所以我们要重视 GitLab的备份工作。

至少做到每天备份一次，平时要注意检查备份的完整性。 至少每天一次全量的备份

环境变量 CRON=1 的作用是如果没有任何错误发生时， 抑制备份脚本的所有进度输出

备份不用去删除，默认保留7天 配置文件里面可以修改备份保留的时间

### 6.4gitlab恢复实践

在gitlab 试下删库，然后用备份恢复

进入仓库

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405232358756-381058424.png)

 

 

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405232533573-289620352.png)

点击

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405232613420-1295415957.png)

 输入仓库名称

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405232835956-565206816.png)

删除了

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405232915415-526313485.png)

GitLab 的恢复只能还原到与备份文件相同的 gitlab 版本的系统中，恢复时，停止连接
到数据库的进程（也就是停止数据写入服务），但是保持 GitLab 是运行的

停止数据写入服务

如果不停止数据写入，会有变恢复 边写数据 会乱

停止数据写入 执行这两条命令 停两个服务

gitlab-ctl stop unicorn

gitlab-ctl stop sidekiq

```bash
[root@ci-node1 git_test]# gitlab-ctl stop unicorn 
ok: down: unicorn: 0s, normally up
```

```bash
[root@ci-node1 git_test]# gitlab-ctl stop sidekiq
ok: down: sidekiq: 0s, normally up
```

确认一下

```bash
[root@ci-node1 git_test]# gitlab-ctl status
run: gitaly: (pid 6501) 501642s; run: log: (pid 6494) 501642s
run: gitlab-monitor: (pid 6492) 501642s; run: log: (pid 6487) 501642s
run: gitlab-workhorse: (pid 6491) 501642s; run: log: (pid 6486) 501642s
run: logrotate: (pid 109050) 423s; run: log: (pid 6479) 501642s
run: nginx: (pid 6503) 501642s; run: log: (pid 6496) 501642s
run: node-exporter: (pid 6482) 501642s; run: log: (pid 6481) 501642s
run: postgres-exporter: (pid 6504) 501642s; run: log: (pid 6497) 501642s
run: postgresql: (pid 6490) 501642s; run: log: (pid 6485) 501642s
run: prometheus: (pid 6499) 501642s; run: log: (pid 6498) 501642s
run: redis: (pid 6489) 501642s; run: log: (pid 6484) 501642s
run: redis-exporter: (pid 6502) 501642s; run: log: (pid 6495) 501642s
down: sidekiq: 46s, normally up; run: log: (pid 6493) 501642s
down: unicorn: 115s, normally up; run: log: (pid 6483) 501642s
```

接下来执行 gitlab 恢复操作：

gitlab-rake gitlab:backup:restore BACKUP=备份文件名

文件名只要数字部分就可以了

```bash
[root@ci-node1 git_test]# gitlab-rake gitlab:backup:restore BACKUP=1586097870_2020_04_05_10.2.2
Unpacking backup ... done
Before restoring the database, we will remove all existing
tables to avoid future upgrade problems. Be aware that if you have
custom tables in the GitLab database these tables and all data will be
removed.

Do you want to continue (yes/no)? 
```

一直按yes

整个恢复执行过程中，我们可以看到基本是在删除表，创建表。

完成后把gitlab 服务重启

 gitlab-ctl restart

```bash
[root@ci-node1 git_test]# gitlab-ctl restart
ok: run: gitaly: (pid 109574) 0s
ok: run: gitlab-monitor: (pid 109590) 1s
ok: run: gitlab-workhorse: (pid 109593) 0s
ok: run: logrotate: (pid 109636) 0s
ok: run: nginx: (pid 109642) 1s
ok: run: node-exporter: (pid 109647) 0s
ok: run: postgres-exporter: (pid 109651) 1s
ok: run: postgresql: (pid 109658) 0s
ok: run: prometheus: (pid 109666) 1s
ok: run: redis: (pid 109673) 0s
ok: run: redis-exporter: (pid 109677) 0s
ok: run: sidekiq: (pid 109693) 1s
ok: run: unicorn: (pid 109700) 0s
```

确认下 两个服务启动了

```bash
[root@ci-node1 git_test]# gitlab-ctl status
run: gitaly: (pid 109574) 28s; run: log: (pid 6494) 502050s
run: gitlab-monitor: (pid 109590) 26s; run: log: (pid 6487) 502050s
run: gitlab-workhorse: (pid 109593) 25s; run: log: (pid 6486) 502050s
run: logrotate: (pid 109636) 25s; run: log: (pid 6479) 502050s
run: nginx: (pid 109642) 25s; run: log: (pid 6496) 502050s
run: node-exporter: (pid 109647) 24s; run: log: (pid 6481) 502050s
run: postgres-exporter: (pid 109651) 24s; run: log: (pid 6497) 502050s
run: postgresql: (pid 109658) 23s; run: log: (pid 6485) 502050s
run: prometheus: (pid 109666) 23s; run: log: (pid 6498) 502050s
run: redis: (pid 109673) 22s; run: log: (pid 6484) 502050s
run: redis-exporter: (pid 109677) 22s; run: log: (pid 6495) 502050s
run: sidekiq: (pid 109693) 22s; run: log: (pid 6493) 502050s
run: unicorn: (pid 109700) 21s; run: log: (pid 6483) 502050s
```

再看看gitlab页面 看看仓库回来了吗

```bash
gitlab-ctl tail#查看日志
```

 恢复完成

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200405235434042-1800280960.png)

### 6.5升级

首先，下载新版本的 RPM 包，可以通过官网或者清华镜像站获取。
其次关闭部分 gitlab 服务 

关闭数据写入服务 关闭nginx 这三个服务
gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
gitlab-ctl stop nginx
执行升级操作
rpm -Uvh gitlab-ce-10.0.4-ce.0.el7.x86_64.rpm

完成后重新配置 gitlab

gitlab-ctl reconfigure
重启 gitlab 服务

gitlab-ctl restart
注：升级操作不建议进行。 有风险

如果确实需要，也可以采取在一台新的服务器上安装新版本的 Gitlab，然后采用导入库的方式将旧系统的代码仓库导入到新 Gitlab 上。

![img](https://img2020.cnblogs.com/blog/1137246/202004/1137246-20200406000515564-207206163.png)

如果不行 可以撤回来