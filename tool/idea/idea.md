# 1.下载及安装

## 1.1下载

开源版（Community）完全免费，旗舰版（Ultimate）需要收费，但是注册账号后可以试用30天

在这里我们直接安装旗舰版（Ultimate）

网盘链接：https://pan.baidu.com/s/1reFzREf5JvAyYwtE9SO5gA 
提取码：hvj5 

## 1.2安装

1. 解压后打开ideaIU-2018.2.2.exe，双击即可

2. 安装位置建议不要放在C盘，文件过大

3. 点击Create Desktop Shortcut，可以创建桌面快捷方式，64-bit表示64位的电脑

   Create Associations下面的选项都不建议选中，比如选中.java后，java文件会默认用idea打开，其实没有必要，用其他软件打开文件时会带来不便

   <img src="https://img-blog.csdnimg.cn/20191022203652688.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 50%;" />

   4. 文件过大，安装需要等待一段时间，安装完成后先不要打开，也不要勾选Run IntelliJ IDEA按钮，先去破解再打开软件

## 1.3破解

1. 解压crack.rar后里面有个JetbrainsCrack.jar

2. 打开安装bin目录，比如我的E:\Program Files\JetBrains\IntelliJ IDEA 2018.2.2\bin

3. 把JetbrainsCrack.jar放到bin目录，其中目录要和你的安装目录保持一致

4. bin目录下找到idea.exe.vmoptions 和 idea64.exe.vmoptions两个文件，以文本格式打开，在两个文件最后一行分别追加新的一行下面的配置，其中目录要和你的安装目录保持一致，JetbrainsCrack.jar和你的破解包名字保持一致，每个人的破解包名称可能不一样，以我的安装目录为例：

   javaagent:E:\Program Files\JetBrains\IntelliJ IDEA 2018.2.2\bin\JetbrainsCrack.jar

5. 启动 IntelliJ IDEA , IDEA在初次运行时会让你选择是否导入设置，如下图所示
   <img src="https://img-blog.csdnimg.cn/2019102220372667.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 67%;" />
   但是初次使用或者没有保存设置的大多要重新设置。

6. 点击`Activation code`会让输入激活码

   <img src="https://img-blog.csdn.net/20180702134912834?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzM4MDc1NDI1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="img" style="zoom:80%;" />

7. 解压的crack的文件夹里面有个readme.txt的文件，用记事本打开找到Enter key，复制下面的激活码输入后点击OK，即可激活成功

8. 当前激活码对2018年的idea安装包版本有效，如果无效，可能是你的idea版本太高，换个较低的版本试试

# 2.初始化配置

## 2.1使用默认配置

如果想要偷懒可以选择直接关掉配置窗口或者点击跳过配置按钮，如下图所示。这样就会直接使用默认配置了。
<img src="https://img-blog.csdnimg.cn/20191022203809735.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 50%;" />

## 2.2配置IDEA

不过IDEA的默认配置会引入大量的插件，不建议大家直接使用，下面将会向大家怎么配置自己的IDEA。

1. 选择UI主题，在IDEA中提供了两种UI主题：Darcula黑色主题，Light白色主题
   <img src="https://img-blog.csdnimg.cn/20191022203836461.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 33%;" />

   大家可以根据自己的喜好选择，后续使用如果不喜欢也可以在设置中进行修改

2. 设置默认插件，这一步需要根据自己的情况选择禁止一些用不上的组件
   <img src="https://img-blog.csdnimg.cn/20191022203918329.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 33%;" />

3. 配置构建工具，这里建议把自己不用的构建工具插件禁用
   <img src="https://img-blog.csdnimg.cn/20191022203957215.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:50%;" />

4. 以我自己使用习惯，只会启用maven（默认是全启用），如下图所示
   <img src="https://img-blog.csdnimg.cn/20191022204025635.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom: 33%;" />

5. 配置版本控制工具，我选择是只使用git和github，大家可以根据自己的使用习惯选择版本控制工具
   <img src="https://img-blog.csdnimg.cn/20191022204110833.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />

6. 配置测试工具，根据需要选择开启
   <img src="https://img-blog.csdnimg.cn/20191022204149945.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />

7. 配置Swing，如果不是开发Swing项目，建议关闭（默认开启），关闭状态如下图所示
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/2019102220421431.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70)

8. 配置Android，同Swing配置，非安卓开发者建议关闭
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191022204300167.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70)

9. 配置其他工具，这个一般我不会进行修改
   <img src="https://img-blog.csdnimg.cn/2019102220433688.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />

10. 配置插件开发，非IDEA插件开发者建议关闭
    ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191022204352106.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70)

11. 配置好后的界面，如下图所示
    <img src="https://img-blog.csdnimg.cn/20191022204406657.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />

12. 配置功能插件，这里的插件都需要安装（自动会下载）
    <img src="https://img-blog.csdnimg.cn/20191022204532195.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />
13. 需要注意其实这里有个IDEA官方的教程插件，有兴趣的朋友可以试着安装使用

<img src="https://img-blog.csdnimg.cn/20191022204546304.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:50%;" />

14.然后点击右下角的启动IDEA按钮就可以愉快地使用IDEA了
<img src="https://img-blog.csdnimg.cn/20191022204644608.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ExNTgxMjM=,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述" style="zoom:33%;" />

# 3.基本使用

## 3.1基本配置

`File`->`Settings`或者快捷键`Ctrl+Alt+S`

### 主题设置

主题颜色：

`Appearance&Behavior`->`Appearance`->`UI Options`->`Theme`

主题字体：建议选择支持中文的，这个按钮不选中时为系统默认，选中后可以修改

`Appearance&Behavior`->`Appearance`->`UI Options`->`Theme`->`Override default fonts by(not recommend)`

### 代码字体

`Editor`->`Font`

`Show only monospaced fonts`表示使用等宽字体，一般选中

`Size`表示字体大小

`Line spacing`表示行距

### 控制台字体与颜色

字体：

`Editor`->`Color Scheme`->`Console Font`

`Use console font instead of default`选中表示修改默认字体

`Show only monospaced fonts`表示使用等宽字体，一般选中

`Size`表示字体大小

`Line spacing`表示行距

颜色：

`Editor`->`Color Scheme`->`Console Colors`

### 字体编码格式

`Editor`->`File Encodings`

把所有的`GBK`都改为`UTF-8`

### 鼠标滚轮改变代码字体大小

`Editor`->点击`General`->`Mouse`->`Change font size (Zoom) with Ctrl+Mouse Wheel`

### 展示代码行数和方法分割线

`Editor`->`General`->`Appearance`

`show line numbers`：代码行数

`Show method separators`：方法分割线

### 代码格式化

`Editor`->`Code Style`->点击`Java`

`Blank Lines`：`Keep Maximum Blank Lines`下的选项全部改为1，表示行之间的行间隔

### 代码提示

`Editor`->`General`->`Code  Completion`

`Case sensitive completion`选项改为：`None`，表示提示时忽略大小写

### 自动导包

`Editor`->`General`->`Auto  Import`

`Java`->`Insert import on paste`选项改为：`All`，表示不用提示，直接帮我们导包

### 文档提示

`Editor`->`General`

`Other`->`Show quick documentation on mouse move`，选中会有文档提示，`Delay(ms)`表示提示延迟的毫秒数

## 3.2安装插件

`File`->`Settings`或者快捷键`Ctrl+Alt+S`->`Plugins`

`Install JetBrains plugin...`安装idea官方插件

`Browse repositories...`

`Install plugin from disk..`

## 3.3环境(JDK)配置

`File` ->`Project Structure`或者快捷键`Ctrl+Alt+Shift+S`

`Project`->`New`->`JDK`->然后选择`JDK的安装路径即可`

一般我们的电脑配置过`java`的环境变量后，可以找到安装路径

`JDK`的安装路径：`选中计算机`->`右键`->`属性`->`高级系统设置`->`环境变量`->`系统变量`

找到`JAVA_HOME`，`JAVA_HOME`对应的值即为`JDK`的安装路径

## 3.4创建JavaSE工程

`File` ->`New` ->`Project `->`JAVA`

`Project name`表示项目名称

比如：demo

`Project location`表示项目路径

比如：G:\project\demo

**注意：**`Project location`也要包含`Project name`

小知识：

> psvm：创建main方法款快捷键
> sout： System.out.println()快捷键
> 不需要保存，idea会自动保存

## 3.5配置JVM参数

`Help` ->`Edit custom JVM Options...`

下面几个选项参数配置大一点，如下：

```xml
-Xms1024m
-Xmx2048m
-XX:ReservedCodeCacheSize=500m
```

## 3.6Debug

在行号的右侧点击一下即可，和eclipse点两下稍有不同

`F7`逐行断点，调用的方法也会进入

`F8`逐行断点，调用的方法不会进入

`F9`直接跳到下一个断点

## 3.7创建javaWeb工程

#### 创建工程

`File` ->`New` ->`Project `->`JAVA`

要选中`Web Application`

其中点击`JAVA EE`时可以切换JAVA EE的版本，点击`Web Application`时可以切换serverLet版本

`Project name`表示项目名称

比如：demo

`Project location`表示项目路径

比如：G:\project\demo

**注意：**`Project location`也要包含`Project name`

小知识：

>  设置idea是否打开上次的工程：	
>
> `Appearance&Behavior`->`System Settings`->`Reopen last project on starup`

#### Tomcat

`Add Configuration...`->`+`->`34 items more(irrelevant)...`->`Tomcat Server`->`Local`

`Application Server`指定server环境，点右面的`Configure...`

`Tomcat home`指定本地tomcat安装路径

`Deployment`可以增减项目 

`After launch`表示server后是否直接用浏览器打开项目

`On Update action`选择`Redeploy`表示修改资源后马上同步更新

**404问题解决方案：**

参考链接：http://www.mamicode.com/info-detail-2204130.html

将Tomcat的首页的工程部署到Tomcat服务器上，部署步骤如下：

选择菜单栏“Run-->Edit Configuration...-->Deployment”,选择右上角绿色“+”，选择“External Source...”，将Apache-tomcat的webapps目录下的ROOT文件夹选中，点击OK，及完成Tomcat的首页的工程的部署。选择ROOT文件后右侧Application Context 可不填写，默认即可。

<img src="http://image.mamicode.com/info/201802/20180227154719133316.png" alt="技术分享图片" style="zoom: 33%;" />

<img src="http://image.mamicode.com/info/201802/20180227154719206561.png" alt="技术分享图片" style="zoom:50%;" />

 

 选择菜单栏“Run-->Edit Configuration...-->Deployment”,选择右上角绿色“+”，选择“Artifact...”，选择exploded项，点击OK。

 <img src="http://image.mamicode.com/info/201802/20180227154719257344.png" alt="技术分享图片" style="zoom: 50%;" /> 

 右侧Application Context 可填写为访问URL名称，也可以写成/表示默认访问项目

<img src="http://image.mamicode.com/info/201802/20180227154719298361.png" alt="技术分享图片" style="zoom:33%;" />

再次运行项目，项目成功运行啦。

这次再访问http://localhost:8080/，熟悉的猫咪出来了。

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

![技术分享图片](http://image.mamicode.com/info/201802/20180227154719377466.png)

2.将tomcat中的catalina.bat打开，如果之前设置了set JAVA_POST,去掉，就OK了，这里的原因是因为Idea会给tomcat配置参数，如果之前有，就会覆盖IDea的，导致冲突

[Idea配置tomcat运行成功后报404](http://www.mamicode.com/info-detail-2204130.html)

标签：[绿色](http://www.mamicode.com/so/1/绿色)  [cal](http://www.mamicode.com/so/1/cal)  [名称](http://www.mamicode.com/so/1/名称)  [ext](http://www.mamicode.com/so/1/ext)  [图片](http://www.mamicode.com/so/1/图片)  [步骤](http://www.mamicode.com/so/1/步骤)  [ati](http://www.mamicode.com/so/1/ati)  [host](http://www.mamicode.com/so/1/host)  [技术分享](http://www.mamicode.com/so/1/技术分享)  

原文地址：https://www.cnblogs.com/jbml-154312/p/8479030.html









