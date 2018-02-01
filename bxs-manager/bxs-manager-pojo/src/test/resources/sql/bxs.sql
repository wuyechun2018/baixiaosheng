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
  `article_type` varchar(10) DEFAULT NULL COMMENT '文章类型(1:普通 2:图片 3：视频)',
  `topic_id` varchar(36) DEFAULT NULL COMMENT '栏目ID',
  `article_title` varchar(200) NOT NULL COMMENT '文章标题',
  `article_image_url` varchar(1000) DEFAULT NULL COMMENT '文章配图地址',
  `article_content` text COMMENT '文章内容',
  `publish_dept_id` varchar(36) DEFAULT NULL COMMENT '发布部门ID',
  `publish_user_id` varchar(36) DEFAULT NULL COMMENT '发布人ID',
  `check_state` varchar(10) DEFAULT NULL COMMENT '文章审核状态(0:未审核 1:审核通过)',
  `top_count` bigint(20) DEFAULT NULL COMMENT '推荐值（值越大，越先显示）',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `data_state` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `t_link` */

DROP TABLE IF EXISTS `t_link`;

CREATE TABLE `t_link` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `link_type_id` varchar(36) DEFAULT NULL COMMENT '链接类型ID',
  `link_name` varchar(500) DEFAULT NULL COMMENT '链接名称',
  `link_desc` varchar(500) DEFAULT NULL COMMENT '链接描述信息',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `link_target_type` varchar(100) DEFAULT NULL COMMENT '链接打开窗口方式',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_link_type` */

DROP TABLE IF EXISTS `t_link_type`;

CREATE TABLE `t_link_type` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `link_type_code` varchar(50) DEFAULT NULL COMMENT '超链接类型编码',
  `link_type_name` varchar(100) DEFAULT NULL COMMENT '超链接类型名称',
  `link_type_desc` varchar(500) DEFAULT NULL COMMENT '链接类型描述',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `user_desc` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_weather_forecas` */

DROP TABLE IF EXISTS `t_weather_forecas`;

CREATE TABLE `t_weather_forecas` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `weather_date` date DEFAULT NULL COMMENT '日期',
  `weather_conditions` varchar(1000) DEFAULT NULL COMMENT '天气情况',
  `weather_desc` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `v_article_info` */

DROP TABLE IF EXISTS `v_article_info`;

/*!50001 DROP VIEW IF EXISTS `v_article_info` */;
/*!50001 DROP TABLE IF EXISTS `v_article_info` */;

/*!50001 CREATE TABLE  `v_article_info`(
 `id` varchar(36) ,
 `article_type` varchar(10) ,
 `topic_id` varchar(36) ,
 `article_title` varchar(200) ,
 `article_image_url` varchar(1000) ,
 `article_content` text ,
 `publish_dept_id` varchar(36) ,
 `publish_user_id` varchar(36) ,
 `check_state` varchar(10) ,
 `top_count` bigint(20) ,
 `view_count` bigint(20) ,
 `display_order` bigint(10) ,
 `data_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `topic_name` varchar(100) ,
 `publish_dept_name` varchar(100) ,
 `publish_user_name` varchar(100) 
)*/;

/*Table structure for table `v_link_info` */

DROP TABLE IF EXISTS `v_link_info`;

/*!50001 DROP VIEW IF EXISTS `v_link_info` */;
/*!50001 DROP TABLE IF EXISTS `v_link_info` */;

/*!50001 CREATE TABLE  `v_link_info`(
 `id` varchar(36) ,
 `link_type_id` varchar(36) ,
 `link_name` varchar(500) ,
 `link_desc` varchar(500) ,
 `link_url` varchar(500) ,
 `link_target_type` varchar(100) ,
 `data_state` varchar(10) ,
 `display_order` bigint(10) ,
 `link_type_name` varchar(100) 
)*/;

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
 `user_desc` varchar(500) ,
 `DEPT_NAME` varchar(100) ,
 `POST_NAME` varchar(100) 
)*/;

/*View structure for view v_article_info */

/*!50001 DROP TABLE IF EXISTS `v_article_info` */;
/*!50001 DROP VIEW IF EXISTS `v_article_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_article_info` AS select `j`.`id` AS `id`,`j`.`article_type` AS `article_type`,`j`.`topic_id` AS `topic_id`,`j`.`article_title` AS `article_title`,`j`.`article_image_url` AS `article_image_url`,`j`.`article_content` AS `article_content`,`j`.`publish_dept_id` AS `publish_dept_id`,`j`.`publish_user_id` AS `publish_user_id`,`j`.`check_state` AS `check_state`,`j`.`top_count` AS `top_count`,`j`.`view_count` AS `view_count`,`j`.`display_order` AS `display_order`,`j`.`data_state` AS `data_state`,`j`.`create_date` AS `create_date`,`j`.`update_date` AS `update_date`,`j`.`topic_name` AS `topic_name`,`j`.`publish_dept_name` AS `publish_dept_name`,`k`.`user_name` AS `publish_user_name` from (((select `m`.`id` AS `id`,`m`.`article_type` AS `article_type`,`m`.`topic_id` AS `topic_id`,`m`.`article_title` AS `article_title`,`m`.`article_image_url` AS `article_image_url`,`m`.`article_content` AS `article_content`,`m`.`publish_dept_id` AS `publish_dept_id`,`m`.`publish_user_id` AS `publish_user_id`,`m`.`check_state` AS `check_state`,`m`.`top_count` AS `top_count`,`m`.`view_count` AS `view_count`,`m`.`display_order` AS `display_order`,`m`.`data_state` AS `data_state`,`m`.`create_date` AS `create_date`,`m`.`update_date` AS `update_date`,`m`.`topic_name` AS `topic_name`,`n`.`dept_name` AS `publish_dept_name` from (((select `t`.`id` AS `id`,`t`.`article_type` AS `article_type`,`t`.`topic_id` AS `topic_id`,`t`.`article_title` AS `article_title`,`t`.`article_image_url` AS `article_image_url`,`t`.`article_content` AS `article_content`,`t`.`publish_dept_id` AS `publish_dept_id`,`t`.`publish_user_id` AS `publish_user_id`,`t`.`check_state` AS `check_state`,`t`.`top_count` AS `top_count`,`t`.`view_count` AS `view_count`,`t`.`display_order` AS `display_order`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`s`.`topic_name` AS `topic_name` from (`bxs`.`t_article` `t` left join `bxs`.`t_topic` `s` on((`t`.`topic_id` = `s`.`id`))))) `m` left join `bxs`.`t_dept` `n` on((`m`.`publish_dept_id` = `n`.`id`))))) `j` left join `bxs`.`t_user` `k` on((`j`.`publish_user_id` = `k`.`id`))) */;

/*View structure for view v_link_info */

/*!50001 DROP TABLE IF EXISTS `v_link_info` */;
/*!50001 DROP VIEW IF EXISTS `v_link_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_link_info` AS select `t`.`id` AS `id`,`t`.`link_type_id` AS `link_type_id`,`t`.`link_name` AS `link_name`,`t`.`link_desc` AS `link_desc`,`t`.`link_url` AS `link_url`,`t`.`link_target_type` AS `link_target_type`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`s`.`link_type_name` AS `link_type_name` from (`t_link` `t` left join `t_link_type` `s` on((`t`.`link_type_id` = `s`.`id`))) */;

/*View structure for view v_post_info */

/*!50001 DROP TABLE IF EXISTS `v_post_info` */;
/*!50001 DROP VIEW IF EXISTS `v_post_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_post_info` AS select `t`.`id` AS `id`,`t`.`pid` AS `pid`,`t`.`dept_id` AS `dept_id`,`t`.`post_code` AS `post_code`,`t`.`post_name` AS `post_name`,`t`.`post_desc` AS `post_desc`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`s`.`dept_name` AS `dept_name` from (`t_post` `t` left join `t_dept` `s` on((`t`.`dept_id` = `s`.`id`))) */;

/*View structure for view v_user_info */

/*!50001 DROP TABLE IF EXISTS `v_user_info` */;
/*!50001 DROP VIEW IF EXISTS `v_user_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_info` AS select `m`.`id` AS `id`,`m`.`login_name` AS `login_name`,`m`.`login_password` AS `login_password`,`m`.`login_time` AS `login_time`,`m`.`data_state` AS `data_state`,`m`.`office_telephone` AS `office_telephone`,`m`.`mobile_phone` AS `mobile_phone`,`m`.`user_name` AS `user_name`,`m`.`birthday` AS `birthday`,`m`.`dept_id` AS `dept_id`,`m`.`post_id` AS `post_id`,`m`.`user_desc` AS `user_desc`,`m`.`DEPT_NAME` AS `DEPT_NAME`,`n`.`post_name` AS `POST_NAME` from (((select `t`.`id` AS `id`,`t`.`login_name` AS `login_name`,`t`.`login_password` AS `login_password`,`t`.`login_time` AS `login_time`,`t`.`data_state` AS `data_state`,`t`.`office_telephone` AS `office_telephone`,`t`.`mobile_phone` AS `mobile_phone`,`t`.`user_name` AS `user_name`,`t`.`birthday` AS `birthday`,`t`.`dept_id` AS `dept_id`,`t`.`post_id` AS `post_id`,`t`.`user_desc` AS `user_desc`,`s`.`dept_name` AS `DEPT_NAME` from (`bxs`.`t_user` `t` left join `bxs`.`t_dept` `s` on((`t`.`dept_id` = `s`.`id`))))) `m` left join `bxs`.`t_post` `n` on((`m`.`post_id` = `n`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
