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
  `data_state` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  `publish_dept_id` varchar(36) DEFAULT NULL COMMENT '发布部门ID',
  `article_image` varchar(1000) DEFAULT NULL COMMENT '文章配图地址',
  `check_state` varchar(10) DEFAULT NULL COMMENT '文章审核状态(0:未审核 1:审核通过)',
  `sign_state` varchar(10) DEFAULT NULL COMMENT '签收状态(0:未签收 1：已签收)',
  `sign_opinion` text COMMENT '签收意见',
  `sign_dept_id` varchar(36) DEFAULT NULL COMMENT '签收部门',
  `top_count` bigint(20) DEFAULT NULL COMMENT '推荐值（值越大，越先显示）',
  `pusblish_user_id` varchar(36) DEFAULT NULL COMMENT '发布人ID',
  `topic_id` varchar(36) DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_article` */

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

insert  into `t_dept`(`id`,`pid`,`dept_code`,`dept_name`,`dept_type`,`dept_desc`,`data_state`,`display_order`) values ('1','0','0','交警大队','1','单位部门','1',1),('2','1','XCK','宣传科','1','宣传科','1',2),('3','1','FZK','法制科','1','法制科','1',3),('4','1','3','科技科','1','科技科','1',4),('5','1','4','办公室','1','办公室','1',6),('6','1','5','政工科','1','政工科','1',1),('e030d7f8-ea64-40a4-ab4b-53d6bf05f1ec','1','JW','纪委','1','纪委','1',1),('e67ae28e-bf14-446c-8a86-b9af93963540','1','LMZQDD','路面执勤大队','1','路面执勤大队','1',1);

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

insert  into `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`) values ('1','0','文章管理','	#','1','1',1),('11','8','职位管理','/eui/post/list','2','1',12),('12','8','部门管理','/eui/dept/list','2','1',11),('2','1','栏目管理','/eui/topic/list','2','1',2),('3','1','内容管理','/eui/article/list','2','1',3),('4','0','视频管理','	#','1','1',4),('5','4','添加视频','	#','2','1',5),('6','0','友情链接','	#','1','1',6),('7','6','添加链接','	#','2','1',7),('8','0','用户管理','	#','2','1',8),('9','8','通讯录','/eui/user/list','2','1',13);

/*Table structure for table `t_post` */

DROP TABLE IF EXISTS `t_post`;

CREATE TABLE `t_post` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门ID',
  `post_code` varchar(50) DEFAULT NULL COMMENT '职位编码',
  `post_name` varchar(100) DEFAULT NULL COMMENT '职位名称',
  `post_desc` varchar(100) DEFAULT NULL COMMENT '职位说明',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `display_order` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_post` */

insert  into `t_post`(`id`,`pid`,`dept_id`,`post_code`,`post_name`,`post_desc`,`data_state`,`display_order`) values ('1','0','1','ddz','大队长','1','1','1'),('2',NULL,'1','1','副大队长','1','1','0'),('3','0','1','zdz','中队长','3','1','3'),('39c89ded-031e-4997-92d3-6968b5b32fd4',NULL,'6','kezhang','科长','kezhang',NULL,'0'),('4','0','1','jz','警长','4','1','4'),('5','0','1','kz','科长','5','1','5'),('57061f24-ca96-4b9c-9a68-375289db3675',NULL,'1','jjddgw','交警大队顾问','交警大队顾问吧','0','1'),('6','0','1','fkz','副科长','6','1','6'),('616431a7-fb9a-4538-bdb6-970a49451c2a',NULL,'4','科技局','科技科科长','科技局是的','0','1'),('cfe49436-529a-421f-ab69-5c0a4238f89c',NULL,'1','xj','协警','协警','0','0'),('f1b420f9-03c7-4273-bf55-3835e73d1f04',NULL,'e030d7f8-ea64-40a4-ab4b-53d6bf05f1ec','纪委主任','纪委主任','纪委主任','0','0');

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
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常 2：锁定）',
  `office_telephone` varchar(50) DEFAULT NULL COMMENT '办公室电话',
  `mobile_phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `user_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门ID',
  `post_id` varchar(36) DEFAULT NULL COMMENT '职位ID',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`login_name`,`login_password`,`login_time`,`data_state`,`office_telephone`,`mobile_phone`,`user_name`,`birthday`,`dept_id`,`post_id`) values ('1d99cc0f-71b9-4dbe-b54c-c97385aed281','kfry1','123456','2018-01-27 20:50:41','1',NULL,NULL,NULL,NULL,NULL,NULL),('2546c31d-16d9-4958-bd20-a1e49ec7ba6a','kfry2','123456','2018-01-27 20:50:43','1',NULL,NULL,NULL,NULL,NULL,NULL),('2daf7244-9488-475f-9fe8-ebe5862e2535','kfry3','123456','2018-01-27 20:50:42','1',NULL,NULL,NULL,NULL,NULL,NULL),('3893faed-0a1a-4ec4-b9b4-f382ea7b3046','kfry4','123456','2018-01-27 20:50:51','1',NULL,NULL,NULL,NULL,NULL,NULL),('51ababaa-6c5b-43e0-a51e-3d4204f5e18a','kfry5','123456','2018-01-27 20:50:49','1',NULL,NULL,NULL,NULL,NULL,NULL),('627a2695-3d86-4f0b-bf1b-5a6e3105ab02','kfry6','123456','2018-01-27 19:15:12','1','18019563065','0553-5394252','张三','2018-01-27','e030d7f8-ea64-40a4-ab4b-53d6bf05f1ec','1'),('8a86abaa-5bf0-44e2-914c-222bdf473977','kfry7','123456','2018-01-27 20:50:45','1',NULL,NULL,NULL,NULL,NULL,NULL),('b94dd453-ebfe-4eab-844b-9d446f60a548','kfry8','123456','2018-01-27 20:12:07','1',NULL,NULL,NULL,NULL,NULL,NULL),('c30635c7-c58d-4cfa-a2b5-4b61ab82a138','kfry9','123456','2018-01-27 20:12:14','1',NULL,NULL,NULL,NULL,NULL,NULL),('c9157302-aceb-45e6-9ce4-6eff39b81c2f','kfry10','123456','2018-01-27 20:50:39','1',NULL,NULL,NULL,NULL,NULL,NULL),('ce6b9bd8-3689-4b39-acb7-b4f447ce4640','kfry11','123456','2018-01-27 20:50:47','1',NULL,NULL,NULL,NULL,NULL,NULL),('d2534228-b1ae-4a5f-8c0e-65ccc6572e88','kfry12','123456','2018-01-27 20:50:46','1',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `v_post_info` */

DROP TABLE IF EXISTS `v_post_info`;

/*!50001 DROP VIEW IF EXISTS `v_post_info` */;
/*!50001 DROP TABLE IF EXISTS `v_post_info` */;

/*!50001 CREATE TABLE  `v_post_info`(
 `id` varchar(36) ,
 `pid` varchar(36) ,
 `dept_id` varchar(36) ,
 `post_code` varchar(50) ,
 `post_name` varchar(100) ,
 `post_desc` varchar(100) ,
 `data_state` varchar(10) ,
 `display_order` varchar(10) ,
 `dept_name` varchar(100) 
)*/;

/*Table structure for table `v_user_info` */

DROP TABLE IF EXISTS `v_user_info`;

/*!50001 DROP VIEW IF EXISTS `v_user_info` */;
/*!50001 DROP TABLE IF EXISTS `v_user_info` */;

/*!50001 CREATE TABLE  `v_user_info`(
 `id` varchar(36) ,
 `login_name` varchar(200) ,
 `login_password` varchar(200) ,
 `login_time` datetime ,
 `data_state` varchar(10) ,
 `office_telephone` varchar(50) ,
 `mobile_phone` varchar(50) ,
 `user_name` varchar(100) ,
 `birthday` date ,
 `dept_id` varchar(36) ,
 `post_id` varchar(36) ,
 `DEPT_NAME` varchar(100) ,
 `POST_NAME` varchar(100) 
)*/;

/*View structure for view v_post_info */

/*!50001 DROP TABLE IF EXISTS `v_post_info` */;
/*!50001 DROP VIEW IF EXISTS `v_post_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_post_info` AS select `t`.`id` AS `id`,`t`.`pid` AS `pid`,`t`.`dept_id` AS `dept_id`,`t`.`post_code` AS `post_code`,`t`.`post_name` AS `post_name`,`t`.`post_desc` AS `post_desc`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`s`.`dept_name` AS `dept_name` from (`t_post` `t` left join `t_dept` `s` on((`t`.`dept_id` = `s`.`id`))) */;

/*View structure for view v_user_info */

/*!50001 DROP TABLE IF EXISTS `v_user_info` */;
/*!50001 DROP VIEW IF EXISTS `v_user_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_info` AS select `m`.`id` AS `id`,`m`.`login_name` AS `login_name`,`m`.`login_password` AS `login_password`,`m`.`login_time` AS `login_time`,`m`.`data_state` AS `data_state`,`m`.`office_telephone` AS `office_telephone`,`m`.`mobile_phone` AS `mobile_phone`,`m`.`user_name` AS `user_name`,`m`.`birthday` AS `birthday`,`m`.`dept_id` AS `dept_id`,`m`.`post_id` AS `post_id`,`m`.`DEPT_NAME` AS `DEPT_NAME`,`n`.`post_name` AS `POST_NAME` from (((select `t`.`id` AS `id`,`t`.`login_name` AS `login_name`,`t`.`login_password` AS `login_password`,`t`.`login_time` AS `login_time`,`t`.`data_state` AS `data_state`,`t`.`office_telephone` AS `office_telephone`,`t`.`mobile_phone` AS `mobile_phone`,`t`.`user_name` AS `user_name`,`t`.`birthday` AS `birthday`,`t`.`dept_id` AS `dept_id`,`t`.`post_id` AS `post_id`,`s`.`dept_name` AS `DEPT_NAME` from (`bxs`.`t_user` `t` left join `bxs`.`t_dept` `s` on((`t`.`dept_id` = `s`.`id`))))) `m` left join `bxs`.`t_post` `n` on((`m`.`post_id` = `n`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
