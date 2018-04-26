/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - sitaoke
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sitaoke` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sitaoke`;

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `article_type` varchar(10) DEFAULT NULL COMMENT '文章类型(1:普通 2:图片 3：视频)',
  `topic_id` varchar(36) DEFAULT NULL COMMENT '栏目ID',
  `article_title` varchar(200) NOT NULL COMMENT '文章标题',
  `article_image_url` varchar(1000) DEFAULT NULL COMMENT '文章配图地址',
  `article_content` longtext COMMENT '文章内容',
  `publish_dept_id` varchar(36) DEFAULT NULL COMMENT '发布部门ID',
  `publish_user_id` varchar(36) DEFAULT NULL COMMENT '发布人ID',
  `check_state` varchar(10) DEFAULT NULL COMMENT '文章审核状态(0:未审核 1:审核通过)',
  `top_count` bigint(20) DEFAULT NULL COMMENT '推荐值（值越大，越先显示）',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `data_state` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `front_slider_state` varchar(10) DEFAULT NULL COMMENT '首页推荐',
  `newsfrom` varchar(100) DEFAULT NULL COMMENT '信息来源',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `publish_date` datetime DEFAULT NULL,
  `top_state` varchar(10) DEFAULT NULL,
  `pop_state` varchar(10) DEFAULT NULL,
  `publish_media` varchar(200) DEFAULT NULL,
  `res_edtior` varchar(100) DEFAULT NULL COMMENT '责任编辑',
  `title_color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  PRIMARY KEY (`id`),
  KEY `index_article_top_count` (`top_count`),
  KEY `index_article_topic_id` (`topic_id`),
  KEY `index_article_data_state` (`data_state`),
  KEY `index_article_check_state` (`check_state`),
  KEY `index_article_front_slider_state` (`front_slider_state`),
  KEY `index_article_title` (`article_title`),
  KEY `index_publish_dept_id` (`publish_dept_id`),
  KEY `index_publish_user_id` (`publish_user_id`),
  KEY `index_article_type` (`article_type`),
  KEY `index_top_state` (`top_state`),
  KEY `index_pop_state` (`pop_state`),
  KEY `index_article_publish_date` (`publish_date`),
  KEY `index_article_topcount_publishdate` (`top_count`,`publish_date`),
  KEY `index_article_topcount_publishdateS` (`topic_id`,`top_count`,`publish_date`),
  KEY `index_article_create_date` (`create_date`),
  KEY `index_article_tpc` (`top_count`,`publish_date`,`create_date`),
  KEY `index_article_tpu` (`top_count`,`publish_date`,`update_date`),
  FULLTEXT KEY `ft_article_title` (`article_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';

/*Table structure for table `t_article_history` */

DROP TABLE IF EXISTS `t_article_history`;

CREATE TABLE `t_article_history` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `article_type` varchar(10) DEFAULT NULL COMMENT '文章类型(1:普通 2:图片 3：视频)',
  `topic_id` varchar(36) DEFAULT NULL COMMENT '栏目ID',
  `article_title` varchar(200) NOT NULL COMMENT '文章标题',
  `article_image_url` varchar(1000) DEFAULT NULL COMMENT '文章配图地址',
  `article_content` longtext COMMENT '文章内容',
  `publish_dept_id` varchar(36) DEFAULT NULL COMMENT '发布部门ID',
  `publish_user_id` varchar(36) DEFAULT NULL COMMENT '发布人ID',
  `check_state` varchar(10) DEFAULT NULL COMMENT '文章审核状态(0:未审核 1:审核通过)',
  `top_count` bigint(20) DEFAULT NULL COMMENT '推荐值（值越大，越先显示）',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `data_state` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `front_slider_state` varchar(10) DEFAULT NULL COMMENT '首页推荐',
  `newsfrom` varchar(100) DEFAULT NULL COMMENT '信息来源',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `publish_date` datetime DEFAULT NULL,
  `top_state` varchar(10) DEFAULT NULL,
  `pop_state` varchar(10) DEFAULT NULL,
  `publish_media` varchar(200) DEFAULT NULL,
  `res_edtior` varchar(100) DEFAULT NULL COMMENT '责任编辑',
  `title_color` varchar(50) DEFAULT NULL COMMENT '标题颜色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `config_type_id` varchar(36) DEFAULT NULL COMMENT '配置类型ID',
  `config_name` varchar(50) DEFAULT NULL COMMENT '配置名称',
  `config_code` varchar(50) DEFAULT NULL COMMENT '配置编码',
  `config_value` varchar(5000) DEFAULT NULL COMMENT '配置项的值',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `link_target_type` varchar(100) DEFAULT NULL COMMENT '链接打开方式',
  `config_image_url` varchar(1000) DEFAULT NULL COMMENT '配图地址',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `config_desc` varchar(500) DEFAULT NULL COMMENT '备注描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_config_type` */

DROP TABLE IF EXISTS `t_config_type`;

CREATE TABLE `t_config_type` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `config_type_code` varchar(50) DEFAULT NULL COMMENT '系统配置类型编码',
  `config_type_name` varchar(100) DEFAULT NULL COMMENT '系统配置类型名称',
  `config_value_type` varchar(10) DEFAULT NULL COMMENT '配置项类型',
  `config_type_desc` varchar(500) DEFAULT NULL COMMENT '系统配置类型描述',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置类型表';

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

/*Table structure for table `t_float_win` */

DROP TABLE IF EXISTS `t_float_win`;

CREATE TABLE `t_float_win` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `win_name` varchar(500) DEFAULT NULL COMMENT '飘窗名称',
  `win_desc` varchar(500) DEFAULT NULL COMMENT '飘窗描述',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `link_target_type` varchar(100) DEFAULT NULL COMMENT '链接打开窗口方式',
  `link_image_url` varchar(1000) DEFAULT NULL,
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `show_state` varchar(10) DEFAULT NULL,
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飘窗配置表';

/*Table structure for table `t_info_rank` */

DROP TABLE IF EXISTS `t_info_rank`;

CREATE TABLE `t_info_rank` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `stat_year` varchar(10) DEFAULT NULL COMMENT '统计年份',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门主键',
  `bumen` bigint(20) DEFAULT NULL COMMENT '部门',
  `zhidui` bigint(20) DEFAULT NULL COMMENT '支队',
  `shiju` bigint(20) DEFAULT NULL COMMENT '市局',
  `zongdui` bigint(20) DEFAULT NULL COMMENT '总队',
  `shengdui` bigint(20) DEFAULT NULL COMMENT '省队',
  `buju` bigint(20) DEFAULT NULL COMMENT '部局',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(36) DEFAULT NULL COMMENT '更新人主键',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `show_state` varchar(10) DEFAULT NULL COMMENT '展示状态',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
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
  `link_image_url` varchar(1000) DEFAULT NULL,
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

/*Table structure for table `t_opt_article_count` */

DROP TABLE IF EXISTS `t_opt_article_count`;

CREATE TABLE `t_opt_article_count` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `topic_code` varchar(50) DEFAULT NULL COMMENT '专题编码',
  `article_count` bigint(10) DEFAULT NULL COMMENT '文章数量',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
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

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `role_code` varchar(50) DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色说明',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_sign` */

DROP TABLE IF EXISTS `t_sign`;

CREATE TABLE `t_sign` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `article_id` varchar(36) DEFAULT NULL COMMENT '文章主键',
  `article_type` varchar(10) DEFAULT NULL COMMENT '文章类型',
  `sign_dept_id` varchar(36) DEFAULT NULL COMMENT '签收部门主键',
  `sign_user_id` varchar(36) DEFAULT NULL COMMENT '签收用户主键',
  `sign_state` varchar(10) DEFAULT NULL COMMENT '签收状态(0 未签收 1已签收)',
  `sign_content` text COMMENT '反馈内容',
  `sign_date` datetime DEFAULT NULL COMMENT '签收时间',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
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
  PRIMARY KEY (`id`),
  KEY `index_article_code` (`topic_code`),
  KEY `index_topic_pid` (`pid`)
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

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_weather_forecast` */

DROP TABLE IF EXISTS `t_weather_forecast`;

CREATE TABLE `t_weather_forecast` (
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
 `article_content` longtext ,
 `publish_dept_id` varchar(36) ,
 `publish_user_id` varchar(36) ,
 `check_state` varchar(10) ,
 `top_count` bigint(20) ,
 `view_count` bigint(20) ,
 `display_order` bigint(10) ,
 `data_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `front_slider_state` varchar(10) ,
 `newsfrom` varchar(100) ,
 `author` varchar(100) ,
 `publish_date` datetime ,
 `top_state` varchar(10) ,
 `pop_state` varchar(10) ,
 `publish_media` varchar(200) ,
 `res_edtior` varchar(100) ,
 `title_color` varchar(50) ,
 `topic_name` varchar(100) ,
 `topic_code` varchar(50) ,
 `content_image_url` varchar(58) ,
 `publish_dept_name` varchar(100) ,
 `publish_user_name` varchar(100) 
)*/;

/*Table structure for table `v_article_info_sytj` */

DROP TABLE IF EXISTS `v_article_info_sytj`;

/*!50001 DROP VIEW IF EXISTS `v_article_info_sytj` */;
/*!50001 DROP TABLE IF EXISTS `v_article_info_sytj` */;

/*!50001 CREATE TABLE  `v_article_info_sytj`(
 `id` varchar(36) ,
 `article_type` varchar(10) ,
 `topic_id` varchar(36) ,
 `article_title` varchar(200) ,
 `article_image_url` varchar(1000) ,
 `article_content` longtext ,
 `publish_dept_id` varchar(36) ,
 `publish_user_id` varchar(36) ,
 `check_state` varchar(10) ,
 `top_count` bigint(20) ,
 `view_count` bigint(20) ,
 `display_order` bigint(10) ,
 `data_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `front_slider_state` varchar(10) ,
 `newsfrom` varchar(100) ,
 `author` varchar(100) ,
 `publish_date` datetime ,
 `top_state` varchar(10) ,
 `pop_state` varchar(10) ,
 `topic_name` varchar(100) ,
 `topic_code` varchar(50) ,
 `content_image_url` varchar(58) ,
 `publish_dept_name` varchar(100) ,
 `publish_user_name` varchar(100) 
)*/;

/*Table structure for table `v_article_mini_info` */

DROP TABLE IF EXISTS `v_article_mini_info`;

/*!50001 DROP VIEW IF EXISTS `v_article_mini_info` */;
/*!50001 DROP TABLE IF EXISTS `v_article_mini_info` */;

/*!50001 CREATE TABLE  `v_article_mini_info`(
 `id` varchar(36) ,
 `article_type` varchar(10) ,
 `article_title` varchar(200) ,
 `publish_dept_id` varchar(36) ,
 `publish_user_id` varchar(36) ,
 `check_state` varchar(10) ,
 `front_slider_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `top_count` bigint(20) ,
 `publish_date` datetime ,
 `data_state` varchar(10) ,
 `topic_name` varchar(100) ,
 `topic_code` varchar(50) 
)*/;

/*Table structure for table `v_config_info` */

DROP TABLE IF EXISTS `v_config_info`;

/*!50001 DROP VIEW IF EXISTS `v_config_info` */;
/*!50001 DROP TABLE IF EXISTS `v_config_info` */;

/*!50001 CREATE TABLE  `v_config_info`(
 `id` varchar(36) ,
 `config_type_id` varchar(36) ,
 `config_name` varchar(50) ,
 `config_code` varchar(50) ,
 `config_value` varchar(5000) ,
 `link_url` varchar(500) ,
 `link_target_type` varchar(100) ,
 `config_image_url` varchar(1000) ,
 `data_state` varchar(10) ,
 `display_order` bigint(10) ,
 `config_desc` varchar(500) ,
 `config_type_name` varchar(100) ,
 `config_type_code` varchar(50) ,
 `config_value_type` varchar(10) 
)*/;

/*Table structure for table `v_info_rank` */

DROP TABLE IF EXISTS `v_info_rank`;

/*!50001 DROP VIEW IF EXISTS `v_info_rank` */;
/*!50001 DROP TABLE IF EXISTS `v_info_rank` */;

/*!50001 CREATE TABLE  `v_info_rank`(
 `id` varchar(36) ,
 `stat_year` varchar(10) ,
 `dept_id` varchar(36) ,
 `bumen` bigint(20) ,
 `zhidui` bigint(20) ,
 `shiju` bigint(20) ,
 `zongdui` bigint(20) ,
 `shengdui` bigint(20) ,
 `buju` bigint(20) ,
 `create_user_id` varchar(36) ,
 `create_date` datetime ,
 `update_user_id` varchar(36) ,
 `update_date` datetime ,
 `show_state` varchar(10) ,
 `data_state` varchar(10) ,
 `dept_name` varchar(100) 
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
 `link_image_url` varchar(1000) ,
 `link_type_name` varchar(100) ,
 `link_type_code` varchar(50) 
)*/;

/*Table structure for table `v_opt_article_count` */

DROP TABLE IF EXISTS `v_opt_article_count`;

/*!50001 DROP VIEW IF EXISTS `v_opt_article_count` */;
/*!50001 DROP TABLE IF EXISTS `v_opt_article_count` */;

/*!50001 CREATE TABLE  `v_opt_article_count`(
 `ID` varchar(36) ,
 `topic_code` varchar(50) ,
 `article_count` bigint(21) ,
 `update_date` datetime 
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

/*Table structure for table `v_sign_article_info` */

DROP TABLE IF EXISTS `v_sign_article_info`;

/*!50001 DROP VIEW IF EXISTS `v_sign_article_info` */;
/*!50001 DROP TABLE IF EXISTS `v_sign_article_info` */;

/*!50001 CREATE TABLE  `v_sign_article_info`(
 `id` varchar(36) ,
 `article_id` varchar(36) ,
 `article_type` varchar(10) ,
 `sign_dept_id` varchar(36) ,
 `sign_user_id` varchar(36) ,
 `sign_state` varchar(10) ,
 `sign_content` text ,
 `sign_date` datetime ,
 `data_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `sign_dept_name` varchar(100) ,
 `sign_user_name` varchar(100) ,
 `article_title` varchar(200) ,
 `topic_name` varchar(100) ,
 `publish_dept_name` varchar(100) ,
 `publish_user_name` varchar(100) 
)*/;

/*Table structure for table `v_sign_info` */

DROP TABLE IF EXISTS `v_sign_info`;

/*!50001 DROP VIEW IF EXISTS `v_sign_info` */;
/*!50001 DROP TABLE IF EXISTS `v_sign_info` */;

/*!50001 CREATE TABLE  `v_sign_info`(
 `id` varchar(36) ,
 `article_id` varchar(36) ,
 `article_type` varchar(10) ,
 `sign_dept_id` varchar(36) ,
 `sign_user_id` varchar(36) ,
 `sign_state` varchar(10) ,
 `sign_content` text ,
 `sign_date` datetime ,
 `data_state` varchar(10) ,
 `create_date` datetime ,
 `update_date` datetime ,
 `sign_dept_name` varchar(100) ,
 `sign_user_name` varchar(100) 
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
 `POST_NAME` varchar(100) ,
 `POST_DISPLAY_ORDER` varchar(10) 
)*/;

/*View structure for view v_article_info */

/*!50001 DROP TABLE IF EXISTS `v_article_info` */;
/*!50001 DROP VIEW IF EXISTS `v_article_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_article_info` AS select `j`.`id` AS `id`,`j`.`article_type` AS `article_type`,`j`.`topic_id` AS `topic_id`,`j`.`article_title` AS `article_title`,`j`.`article_image_url` AS `article_image_url`,`j`.`article_content` AS `article_content`,`j`.`publish_dept_id` AS `publish_dept_id`,`j`.`publish_user_id` AS `publish_user_id`,`j`.`check_state` AS `check_state`,`j`.`top_count` AS `top_count`,`j`.`view_count` AS `view_count`,`j`.`display_order` AS `display_order`,`j`.`data_state` AS `data_state`,`j`.`create_date` AS `create_date`,`j`.`update_date` AS `update_date`,`j`.`front_slider_state` AS `front_slider_state`,`j`.`newsfrom` AS `newsfrom`,`j`.`author` AS `author`,`j`.`publish_date` AS `publish_date`,`j`.`top_state` AS `top_state`,`j`.`pop_state` AS `pop_state`,`j`.`publish_media` AS `publish_media`,`j`.`res_edtior` AS `res_edtior`,`j`.`title_color` AS `title_color`,`j`.`topic_name` AS `topic_name`,`j`.`topic_code` AS `topic_code`,`j`.`content_image_url` AS `content_image_url`,`j`.`publish_dept_name` AS `publish_dept_name`,`k`.`user_name` AS `publish_user_name` from (((select `m`.`id` AS `id`,`m`.`article_type` AS `article_type`,`m`.`topic_id` AS `topic_id`,`m`.`article_title` AS `article_title`,`m`.`article_image_url` AS `article_image_url`,`m`.`article_content` AS `article_content`,`m`.`publish_dept_id` AS `publish_dept_id`,`m`.`publish_user_id` AS `publish_user_id`,`m`.`check_state` AS `check_state`,`m`.`top_count` AS `top_count`,`m`.`view_count` AS `view_count`,`m`.`display_order` AS `display_order`,`m`.`data_state` AS `data_state`,`m`.`create_date` AS `create_date`,`m`.`update_date` AS `update_date`,`m`.`front_slider_state` AS `front_slider_state`,`m`.`newsfrom` AS `newsfrom`,`m`.`author` AS `author`,`m`.`publish_date` AS `publish_date`,`m`.`top_state` AS `top_state`,`m`.`pop_state` AS `pop_state`,`m`.`publish_media` AS `publish_media`,`m`.`res_edtior` AS `res_edtior`,`m`.`title_color` AS `title_color`,`m`.`topic_name` AS `topic_name`,`m`.`topic_code` AS `topic_code`,`m`.`content_image_url` AS `content_image_url`,`n`.`dept_name` AS `publish_dept_name` from (((select `t`.`id` AS `id`,`t`.`article_type` AS `article_type`,`t`.`topic_id` AS `topic_id`,`t`.`article_title` AS `article_title`,`t`.`article_image_url` AS `article_image_url`,`t`.`article_content` AS `article_content`,`t`.`publish_dept_id` AS `publish_dept_id`,`t`.`publish_user_id` AS `publish_user_id`,`t`.`check_state` AS `check_state`,`t`.`top_count` AS `top_count`,`t`.`view_count` AS `view_count`,`t`.`display_order` AS `display_order`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`t`.`front_slider_state` AS `front_slider_state`,`t`.`newsfrom` AS `newsfrom`,`t`.`author` AS `author`,`t`.`publish_date` AS `publish_date`,`t`.`top_state` AS `top_state`,`t`.`pop_state` AS `pop_state`,`t`.`publish_media` AS `publish_media`,`t`.`res_edtior` AS `res_edtior`,`t`.`title_color` AS `title_color`,`s`.`topic_name` AS `topic_name`,`s`.`topic_code` AS `topic_code`,substr(`t`.`article_content`,(locate('src="',`t`.`article_content`) + 5),58) AS `content_image_url` from (`sitaoke`.`t_article` `t` left join `sitaoke`.`t_topic` `s` on((`t`.`topic_id` = `s`.`id`))))) `m` left join `sitaoke`.`t_dept` `n` on((`m`.`publish_dept_id` = `n`.`id`))))) `j` left join `sitaoke`.`t_user` `k` on((`j`.`publish_user_id` = `k`.`id`))) */;

/*View structure for view v_article_info_sytj */

/*!50001 DROP TABLE IF EXISTS `v_article_info_sytj` */;
/*!50001 DROP VIEW IF EXISTS `v_article_info_sytj` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_article_info_sytj` AS select `j`.`id` AS `id`,`j`.`article_type` AS `article_type`,`j`.`topic_id` AS `topic_id`,`j`.`article_title` AS `article_title`,`j`.`article_image_url` AS `article_image_url`,`j`.`article_content` AS `article_content`,`j`.`publish_dept_id` AS `publish_dept_id`,`j`.`publish_user_id` AS `publish_user_id`,`j`.`check_state` AS `check_state`,`j`.`top_count` AS `top_count`,`j`.`view_count` AS `view_count`,`j`.`display_order` AS `display_order`,`j`.`data_state` AS `data_state`,`j`.`create_date` AS `create_date`,`j`.`update_date` AS `update_date`,`j`.`front_slider_state` AS `front_slider_state`,`j`.`newsfrom` AS `newsfrom`,`j`.`author` AS `author`,`j`.`publish_date` AS `publish_date`,`j`.`top_state` AS `top_state`,`j`.`pop_state` AS `pop_state`,`j`.`topic_name` AS `topic_name`,`j`.`topic_code` AS `topic_code`,`j`.`content_image_url` AS `content_image_url`,`j`.`publish_dept_name` AS `publish_dept_name`,`k`.`user_name` AS `publish_user_name` from (((select `m`.`id` AS `id`,`m`.`article_type` AS `article_type`,`m`.`topic_id` AS `topic_id`,`m`.`article_title` AS `article_title`,`m`.`article_image_url` AS `article_image_url`,`m`.`article_content` AS `article_content`,`m`.`publish_dept_id` AS `publish_dept_id`,`m`.`publish_user_id` AS `publish_user_id`,`m`.`check_state` AS `check_state`,`m`.`top_count` AS `top_count`,`m`.`view_count` AS `view_count`,`m`.`display_order` AS `display_order`,`m`.`data_state` AS `data_state`,`m`.`create_date` AS `create_date`,`m`.`update_date` AS `update_date`,`m`.`front_slider_state` AS `front_slider_state`,`m`.`newsfrom` AS `newsfrom`,`m`.`author` AS `author`,`m`.`publish_date` AS `publish_date`,`m`.`top_state` AS `top_state`,`m`.`pop_state` AS `pop_state`,`m`.`topic_name` AS `topic_name`,`m`.`topic_code` AS `topic_code`,`m`.`content_image_url` AS `content_image_url`,`n`.`dept_name` AS `publish_dept_name` from (((select `t`.`id` AS `id`,`t`.`article_type` AS `article_type`,`t`.`topic_id` AS `topic_id`,`t`.`article_title` AS `article_title`,`t`.`article_image_url` AS `article_image_url`,`t`.`article_content` AS `article_content`,`t`.`publish_dept_id` AS `publish_dept_id`,`t`.`publish_user_id` AS `publish_user_id`,`t`.`check_state` AS `check_state`,`t`.`top_count` AS `top_count`,`t`.`view_count` AS `view_count`,`t`.`display_order` AS `display_order`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`t`.`front_slider_state` AS `front_slider_state`,`t`.`newsfrom` AS `newsfrom`,`t`.`author` AS `author`,`t`.`publish_date` AS `publish_date`,`t`.`top_state` AS `top_state`,`t`.`pop_state` AS `pop_state`,`s`.`topic_name` AS `topic_name`,`s`.`topic_code` AS `topic_code`,substr(`t`.`article_content`,(locate('src="',`t`.`article_content`) + 5),58) AS `content_image_url` from (((select `sitaoke`.`t_article`.`id` AS `id`,`sitaoke`.`t_article`.`article_type` AS `article_type`,`sitaoke`.`t_article`.`topic_id` AS `topic_id`,`sitaoke`.`t_article`.`article_title` AS `article_title`,`sitaoke`.`t_article`.`article_image_url` AS `article_image_url`,`sitaoke`.`t_article`.`article_content` AS `article_content`,`sitaoke`.`t_article`.`publish_dept_id` AS `publish_dept_id`,`sitaoke`.`t_article`.`publish_user_id` AS `publish_user_id`,`sitaoke`.`t_article`.`check_state` AS `check_state`,`sitaoke`.`t_article`.`top_count` AS `top_count`,`sitaoke`.`t_article`.`view_count` AS `view_count`,`sitaoke`.`t_article`.`display_order` AS `display_order`,`sitaoke`.`t_article`.`data_state` AS `data_state`,`sitaoke`.`t_article`.`create_date` AS `create_date`,`sitaoke`.`t_article`.`update_date` AS `update_date`,`sitaoke`.`t_article`.`front_slider_state` AS `front_slider_state`,`sitaoke`.`t_article`.`newsfrom` AS `newsfrom`,`sitaoke`.`t_article`.`author` AS `author`,`sitaoke`.`t_article`.`publish_date` AS `publish_date`,`sitaoke`.`t_article`.`top_state` AS `top_state`,`sitaoke`.`t_article`.`pop_state` AS `pop_state` from `sitaoke`.`t_article` where ((`sitaoke`.`t_article`.`topic_id` = (select `sitaoke`.`t_topic`.`id` from `sitaoke`.`t_topic` where (`sitaoke`.`t_topic`.`topic_code` = 'ZHYW'))) and (`sitaoke`.`t_article`.`data_state` = '1') and (`sitaoke`.`t_article`.`check_state` = '1') and (`sitaoke`.`t_article`.`front_slider_state` = '1')))) `t` left join `sitaoke`.`t_topic` `s` on((`t`.`topic_id` = `s`.`id`))))) `m` left join `sitaoke`.`t_dept` `n` on((`m`.`publish_dept_id` = `n`.`id`))))) `j` left join `sitaoke`.`t_user` `k` on((`j`.`publish_user_id` = `k`.`id`))) */;

/*View structure for view v_article_mini_info */

/*!50001 DROP TABLE IF EXISTS `v_article_mini_info` */;
/*!50001 DROP VIEW IF EXISTS `v_article_mini_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_article_mini_info` AS select `t`.`id` AS `id`,`t`.`article_type` AS `article_type`,`t`.`article_title` AS `article_title`,`t`.`publish_dept_id` AS `publish_dept_id`,`t`.`publish_user_id` AS `publish_user_id`,`t`.`check_state` AS `check_state`,`t`.`front_slider_state` AS `front_slider_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`t`.`top_count` AS `top_count`,`t`.`publish_date` AS `publish_date`,`t`.`data_state` AS `data_state`,`s`.`topic_name` AS `topic_name`,`s`.`topic_code` AS `topic_code` from (`t_article` `t` left join `t_topic` `s` on((`t`.`topic_id` = `s`.`id`))) */;

/*View structure for view v_config_info */

/*!50001 DROP TABLE IF EXISTS `v_config_info` */;
/*!50001 DROP VIEW IF EXISTS `v_config_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_config_info` AS select `t`.`id` AS `id`,`t`.`config_type_id` AS `config_type_id`,`t`.`config_name` AS `config_name`,`t`.`config_code` AS `config_code`,`t`.`config_value` AS `config_value`,`t`.`link_url` AS `link_url`,`t`.`link_target_type` AS `link_target_type`,`t`.`config_image_url` AS `config_image_url`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`t`.`config_desc` AS `config_desc`,`s`.`config_type_name` AS `config_type_name`,`s`.`config_type_code` AS `config_type_code`,`s`.`config_value_type` AS `config_value_type` from (`t_config` `t` left join `t_config_type` `s` on((`t`.`config_type_id` = `s`.`id`))) */;

/*View structure for view v_info_rank */

/*!50001 DROP TABLE IF EXISTS `v_info_rank` */;
/*!50001 DROP VIEW IF EXISTS `v_info_rank` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_info_rank` AS select `t`.`id` AS `id`,`t`.`stat_year` AS `stat_year`,`t`.`dept_id` AS `dept_id`,`t`.`bumen` AS `bumen`,`t`.`zhidui` AS `zhidui`,`t`.`shiju` AS `shiju`,`t`.`zongdui` AS `zongdui`,`t`.`shengdui` AS `shengdui`,`t`.`buju` AS `buju`,`t`.`create_user_id` AS `create_user_id`,`t`.`create_date` AS `create_date`,`t`.`update_user_id` AS `update_user_id`,`t`.`update_date` AS `update_date`,`t`.`show_state` AS `show_state`,`t`.`data_state` AS `data_state`,`s`.`dept_name` AS `dept_name` from (`t_info_rank` `t` left join `t_dept` `s` on((`t`.`dept_id` = `s`.`id`))) */;

/*View structure for view v_link_info */

/*!50001 DROP TABLE IF EXISTS `v_link_info` */;
/*!50001 DROP VIEW IF EXISTS `v_link_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_link_info` AS select `t`.`id` AS `id`,`t`.`link_type_id` AS `link_type_id`,`t`.`link_name` AS `link_name`,`t`.`link_desc` AS `link_desc`,`t`.`link_url` AS `link_url`,`t`.`link_target_type` AS `link_target_type`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`t`.`link_image_url` AS `link_image_url`,`s`.`link_type_name` AS `link_type_name`,`s`.`link_type_code` AS `link_type_code` from (`t_link` `t` left join `t_link_type` `s` on((`t`.`link_type_id` = `s`.`id`))) */;

/*View structure for view v_opt_article_count */

/*!50001 DROP TABLE IF EXISTS `v_opt_article_count` */;
/*!50001 DROP VIEW IF EXISTS `v_opt_article_count` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_opt_article_count` AS select uuid() AS `ID`,`m`.`topic_code` AS `topic_code`,`s`.`article_count` AS `article_count`,sysdate() AS `update_date` from (((select count(1) AS `article_count`,`sitaoke`.`t_article`.`topic_id` AS `topic_id` from `sitaoke`.`t_article` where (`sitaoke`.`t_article`.`data_state` = '1') group by `sitaoke`.`t_article`.`topic_id`)) `s` left join `sitaoke`.`t_topic` `m` on((`s`.`topic_id` = `m`.`id`))) */;

/*View structure for view v_post_info */

/*!50001 DROP TABLE IF EXISTS `v_post_info` */;
/*!50001 DROP VIEW IF EXISTS `v_post_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_post_info` AS select `t`.`id` AS `id`,`t`.`pid` AS `pid`,`t`.`dept_id` AS `dept_id`,`t`.`post_code` AS `post_code`,`t`.`post_name` AS `post_name`,`t`.`post_desc` AS `post_desc`,`t`.`data_state` AS `data_state`,`t`.`display_order` AS `display_order`,`s`.`dept_name` AS `dept_name` from (`t_post` `t` left join `t_dept` `s` on((`t`.`dept_id` = `s`.`id`))) */;

/*View structure for view v_sign_article_info */

/*!50001 DROP TABLE IF EXISTS `v_sign_article_info` */;
/*!50001 DROP VIEW IF EXISTS `v_sign_article_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sign_article_info` AS select `t`.`id` AS `id`,`t`.`article_id` AS `article_id`,`t`.`article_type` AS `article_type`,`t`.`sign_dept_id` AS `sign_dept_id`,`t`.`sign_user_id` AS `sign_user_id`,`t`.`sign_state` AS `sign_state`,`t`.`sign_content` AS `sign_content`,`t`.`sign_date` AS `sign_date`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`t`.`sign_dept_name` AS `sign_dept_name`,`t`.`sign_user_name` AS `sign_user_name`,`s`.`article_title` AS `article_title`,`s`.`topic_name` AS `topic_name`,`s`.`publish_dept_name` AS `publish_dept_name`,`s`.`publish_user_name` AS `publish_user_name` from (`sitaoke`.`v_sign_info` `t` left join `sitaoke`.`v_article_info` `s` on((`t`.`article_id` = `s`.`id`))) */;

/*View structure for view v_sign_info */

/*!50001 DROP TABLE IF EXISTS `v_sign_info` */;
/*!50001 DROP VIEW IF EXISTS `v_sign_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sign_info` AS select `m`.`id` AS `id`,`m`.`article_id` AS `article_id`,`m`.`article_type` AS `article_type`,`m`.`sign_dept_id` AS `sign_dept_id`,`m`.`sign_user_id` AS `sign_user_id`,`m`.`sign_state` AS `sign_state`,`m`.`sign_content` AS `sign_content`,`m`.`sign_date` AS `sign_date`,`m`.`data_state` AS `data_state`,`m`.`create_date` AS `create_date`,`m`.`update_date` AS `update_date`,`m`.`sign_dept_name` AS `sign_dept_name`,`n`.`user_name` AS `sign_user_name` from (((select `t`.`id` AS `id`,`t`.`article_id` AS `article_id`,`t`.`article_type` AS `article_type`,`t`.`sign_dept_id` AS `sign_dept_id`,`t`.`sign_user_id` AS `sign_user_id`,`t`.`sign_state` AS `sign_state`,`t`.`sign_content` AS `sign_content`,`t`.`sign_date` AS `sign_date`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`s`.`dept_name` AS `sign_dept_name` from (`sitaoke`.`t_sign` `t` left join `sitaoke`.`t_dept` `s` on((`t`.`sign_dept_id` = `s`.`id`))))) `m` left join `sitaoke`.`t_user` `n` on((`m`.`sign_user_id` = `n`.`id`))) */;

/*View structure for view v_user_info */

/*!50001 DROP TABLE IF EXISTS `v_user_info` */;
/*!50001 DROP VIEW IF EXISTS `v_user_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_info` AS select `m`.`id` AS `id`,`m`.`login_name` AS `login_name`,`m`.`login_password` AS `login_password`,`m`.`login_time` AS `login_time`,`m`.`data_state` AS `data_state`,`m`.`office_telephone` AS `office_telephone`,`m`.`mobile_phone` AS `mobile_phone`,`m`.`user_name` AS `user_name`,`m`.`birthday` AS `birthday`,`m`.`dept_id` AS `dept_id`,`m`.`post_id` AS `post_id`,`m`.`user_desc` AS `user_desc`,`m`.`DEPT_NAME` AS `DEPT_NAME`,`n`.`post_name` AS `POST_NAME`,`n`.`display_order` AS `POST_DISPLAY_ORDER` from (((select `t`.`id` AS `id`,`t`.`login_name` AS `login_name`,`t`.`login_password` AS `login_password`,`t`.`login_time` AS `login_time`,`t`.`data_state` AS `data_state`,`t`.`office_telephone` AS `office_telephone`,`t`.`mobile_phone` AS `mobile_phone`,`t`.`user_name` AS `user_name`,`t`.`birthday` AS `birthday`,`t`.`dept_id` AS `dept_id`,`t`.`post_id` AS `post_id`,`t`.`user_desc` AS `user_desc`,`s`.`dept_name` AS `DEPT_NAME` from (`sitaoke`.`t_user` `t` left join `sitaoke`.`t_dept` `s` on((`t`.`dept_id` = `s`.`id`))))) `m` left join `sitaoke`.`t_post` `n` on((`m`.`post_id` = `n`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
