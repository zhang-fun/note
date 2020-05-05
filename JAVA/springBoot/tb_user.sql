/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : springboot

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2020-05-05 02:01:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_name` varchar(20) default NULL COMMENT '用户名',
  `password` varchar(20) default NULL COMMENT '密码',
  `name` varchar(255) default NULL COMMENT '姓名',
  `age` int(11) default NULL COMMENT '年龄',
  `sex` varchar(6) default NULL COMMENT '性别',
  `birthday` date default NULL COMMENT '生日',
  `note` varchar(200) default NULL COMMENT '笔记',
  `created` timestamp NULL default NULL COMMENT '创建时间',
  `updated` timestamp NULL default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'zhangsan', '123456', '张三', '20', '1', '1998-06-16', '张三在学习springBoot', '2020-05-04 18:08:20', '2020-05-04 18:08:23');
