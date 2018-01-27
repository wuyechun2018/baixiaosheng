/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - bxs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bxs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bxs`;

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `article_title` varchar(200) NOT NULL COMMENT '文章标题',
  `article_content` text COMMENT '文章内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `DATA_STATE` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_article` */

insert  into `t_article`(`id`,`article_title`,`article_content`,`create_date`,`display_order`,`update_date`,`view_count`,`DATA_STATE`) values ('3139fc99-f361-48de-b016-b21d54fd960d','这是第8篇文章','<p>这是第8篇文章这是第8篇文章这是第8篇文章这是第8篇文章这是第8篇文章?????</p>\r\n','2018-01-23 14:16:16',0,'2018-01-23 14:16:16',4,'0'),('467e6485-48b3-41c9-a126-ce29184971bb','sfsdfsTTTTTT','<p>sfsdfsdf</p>\r\n','2018-01-23 22:16:09',0,'2018-01-23 22:16:09',3,'1'),('49261d74-77ad-4a39-b40d-5e0d2c72e017','第三篇文章','第三篇文章第三篇文章第三篇文章第三篇文章第三篇文章第三篇文章第三篇文章','2018-01-22 16:33:59',0,'2018-01-22 16:33:59',10,'0'),('4e9dae28-83e0-4c36-85ac-97ee076a2474','第二篇文章','第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章第二篇文章','2018-01-22 16:31:31',0,'2018-01-22 16:31:31',11,'0'),('6b592b4b-e133-4690-95cf-3fa39952d06f','第四篇文章','<p><span style=\"font-size:10px\"><em><s><u><strong>第四篇文章第四篇文章第四篇文章第四篇文章 &nbsp;我想修改一下可以吗？ 这次可以了吧啊？ 恩，正常的可以。</strong></u></s></em></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:72px\"><em><s><u><strong>萨达 发顺丰按时</strong></u></s></em></span></p>\r\n','2018-01-22 21:08:53',0,'2018-01-22 21:08:53',3,'0'),('6c7ecee2-541b-4246-b4c2-64e8bab20863','第一篇文章','第一篇文章第一篇文章第一篇文章第一篇文章第一篇文章第一篇文章第一篇文章第一篇文章','2018-01-22 16:31:22',0,'2018-01-22 16:31:22',15,'0'),('88f2f140-997e-4bca-b2a1-99354ed3f924','这是第9篇文章','<p>这是第9篇文章这是第9篇文章这是第9篇文章这是第9篇文章</p>\r\n','2018-01-23 10:59:34',0,'2018-01-23 10:59:34',1,'0'),('c875835a-a733-43bd-8b14-c2d540b3bda1','第四篇文章','<p><span style=\"font-size:10px\"><em><s><u><strong>第四篇文章第四篇文章第四篇文章第四篇文章</strong></u></s></em></span></p>\r\n','2018-01-22 20:17:35',0,'2018-01-22 20:17:35',47,'0');

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) NOT NULL COMMENT '父主键',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `dept_type` varchar(10) DEFAULT NULL COMMENT '部门类型',
  `dept_desc` varchar(500) DEFAULT NULL COMMENT '备注说明',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_dept` */

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(200) DEFAULT NULL COMMENT '菜单地址',
  `menu_type` varchar(10) DEFAULT NULL COMMENT '菜单类型（1:文件夹 2:菜单）',
  `DATA_STATE` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常 2：锁定）',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`) values ('1','0','文章管理','	#','1','1',1),('10','8','通讯录','	#','2','1',10),('11','8','职位管理','	#','2','1',11),('12','8','部门管理','/eui/dept/list','2','1',12),('2','1','栏目管理','/eui/topic/list','2','1',2),('3','1','内容管理','/eui/article/list','2','1',3),('4','0','视频管理','	#','1','1',4),('5','4','添加视频','	#','2','1',5),('6','0','友情链接','	#','1','1',6),('7','6','添加链接','	#','2','1',7),('8','0','用户管理','	#','2','1',8),('9','8','系统用户','/eui/user/list','2','1',9);

/*Table structure for table `t_topic` */

DROP TABLE IF EXISTS `t_topic`;

CREATE TABLE `t_topic` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `topic_name` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `topic_type` varchar(10) DEFAULT NULL COMMENT '栏目类型(1、可签收 2、不可签收)',
  `topic_desc` varchar(500) DEFAULT NULL COMMENT '栏目描述',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `topic_code` varchar(50) DEFAULT NULL COMMENT '栏目编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_topic` */

insert  into `t_topic`(`id`,`pid`,`topic_name`,`topic_type`,`topic_desc`,`data_state`,`display_order`,`topic_code`) values ('1','0','文章类型','1','根节点','1',0,'WZLX'),('2','1','交警大事记','1','交警大事记','2',1,'JJDSJ'),('3','1','计划小结','2','计划小结','1',2,'JHXJ'),('4','1','综合要闻','2','综合要闻','2',3,'ZHYW');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `login_name` varchar(200) DEFAULT NULL COMMENT '登录名',
  `login_password` varchar(200) DEFAULT NULL COMMENT '密码',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `DATA_STATE` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常 2：锁定）',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`login_name`,`login_password`,`login_time`,`DATA_STATE`) values ('1','admin','123456','2018-01-10 16:15:49',NULL),('1e6e8177-d668-4d27-a955-d322389d242e','kfry777788888tretetssssOOOOOSSSSS','123456','2018-01-23 22:14:25','0'),('2','root','456788','2018-01-10 16:16:18',NULL),('2326cf40-8ee6-4fed-a909-f46f0980bb22','kfry777788888tretetssssOOOOO','123456','2018-01-23 22:13:34','123456'),('34f88c5d-ff00-48c4-a655-7489a50b1414','kfry6','123456','2018-01-23 17:24:56',NULL),('37035871-6819-4bfa-8ec6-375e31a8e3d2','kfry5','123456','2018-01-23 22:14:56','0'),('791d0d9b-09a2-4486-975a-9a5a4e0afad4','kfry777788888tretetfwrwerweerw','123456','2018-01-23 22:09:29','0'),('90e619ba-99b0-4be6-81b0-fbde3b80e3b8','kfry777788888','123456','2018-01-23 22:09:04','0'),('b34a3923-e270-45d0-9130-42508a336d29','kfry777788888tretet','123456','2018-01-23 22:09:11','123456'),('c30635c7-c58d-4cfa-a2b5-4b61ab82a138','kfry6','123456','2018-01-23 22:14:38','1'),('c8f3b6d5-d17f-4a64-ba32-2d39f8e25e28','kfry777788888','123456','2018-01-23 21:46:20',NULL),('ed16c868-42b8-42e6-88e9-b56e6073b333','kfry777788888tretetssss','123456','2018-01-23 22:09:39','123456'),('fcaa37d3-7573-433e-b6c8-3d16098595f6','kfry556','123456','2018-01-24 20:45:33','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
