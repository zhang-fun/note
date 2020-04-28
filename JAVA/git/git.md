# Git

# 1.Git是什么

Git是目前世界上最先进的分布式版本控制系统。
工作原理 / 流程：
![图片描述](https://img.mukewang.com/59c31e4400013bc911720340.png)
Workspace：工作区
Index / Stage：暂存区
Repository：仓库区（或本地仓库）
Remote：远程仓库

# 2.Git的安装

## 2.1安装路径

国内安装包下载地址：https://npm.taobao.org/mirrors/git-for-windows/

参考链接：https://blog.csdn.net/u011535541/article/details/83379151

# 3.Git初始化

## 3.1配置

安装完成后，还需要最后一步设置，在命令行输入如下：

![图片描述](https://img.mukewang.com/59c1d041000110d906460213.jpg)

配置命令：

git config --global user.name "name"

git config --global user.email "123456@qq.com"

查看配置命令：

git config --global --list

因为Git是分布式版本控制系统，所以需要填写用户名和邮箱作为一个标识。

注意：git config --global 参数，有了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然你也可以对某个仓库指定的不同的用户名和邮箱。

pwd 命令是用于显示当前的目录。

## 3.2初始化

通过命令 git init 把这个所在目录变成git可以管理的仓库，如下：

![图片描述](https://img.mukewang.com/59c1d12b0001b08305270077.png)

这时候你当前testgit目录下会多了一个.git的目录，这个目录是Git来跟踪管理版本的，没事千万不要手动乱改这个目录里面的文件，否则，会把git仓库给破坏了。

# 4.Git常用操作

## 4.1复制远程仓库

git clone 仓库地址

## 4.2新建文件

touch file.txt

## 4.3添加到暂存区

git add file.txt

## 4.4查看状态

git status

## 4.5提交到本地仓库

git commit -m '这是备注'

## 4.5上传到git远程仓库

 git push origin master

## 4.6更新远程仓库到本地

git pull