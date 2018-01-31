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

/*Data for the table `t_article` */

insert  into `t_article`(`id`,`article_type`,`topic_id`,`article_title`,`article_image_url`,`article_content`,`publish_dept_id`,`publish_user_id`,`check_state`,`top_count`,`view_count`,`display_order`,`data_state`,`create_date`,`update_date`) values ('6837dbcf-7505-4282-9f8b-fb612ce7a225','1','3','交警挺好','/media-data/image/20180131204238/备案信息2.png','<p>						</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>交警挺好交警挺好</p><p><img src=\"/media-data/ueditor/image/20180131/1517402136211092237.jpg\" title=\"1517402136211092237.jpg\" alt=\"jj.jpg\"/></p><p><video class=\"edui-upload-video  vjs-default-skin       video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src data-setup=\"{}\"></video></p><p style=\"line-height: 16px;\"><img src=\"http://localhost:2468/bxs-manager-web/resources/js-lib/ueditor-1.4.3.3/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/media-data/ueditor/file/20180131/1517402202522049640.pdf\" title=\"法人基础数据库应用.pdf\">法人基础数据库应用.pdf</a></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>\r\n					</p>',NULL,NULL,'0',0,0,0,'1','2018-01-31 20:30:36','2018-01-31 20:42:41'),('95cf40fa-4bb1-46a7-88e5-58a1808603ca','1','4','发现大量黄金','','<p>发现大量黄金发现大量黄金</p>',NULL,NULL,'0',0,0,0,'1','2018-01-31 20:43:49','2018-01-31 20:43:49'),('c0e9e7c4-1774-4355-87cf-22f3a62a872e','1','90df7e42-12a3-4a29-9e86-b69c91f58b7c','领导很忙','/media-data/image/20180131210721/备案信息2.png','<p>						</p><p><br/></p><p><br/></p><p>最近领导老忙了，各种会议。</p><p><br/></p><p><br/></p><p>\r\n					</p>','7644cb53-5593-48f7-ba5b-39a99d4cc26f','d579e129-e328-46f7-880f-4e029264367c','0',0,0,0,'1','2018-01-31 20:54:10','2018-01-31 21:07:25');

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

insert  into `t_dept`(`id`,`pid`,`dept_code`,`dept_name`,`dept_type`,`dept_desc`,`data_state`,`display_order`) values ('1','0','0','交警大队','1','单位部门','1',1),('2','1','XCK','宣传科','1','宣传科','1',2),('3','1','FZK','法制科','1','法制科','1',3),('4','1','3','科技科','1','科技科','1',4),('5','1','4','办公室','1','办公室','1',6),('6','1','5','政工科','1','政工科','1',1),('7644cb53-5593-48f7-ba5b-39a99d4cc26f','1','txz','通讯组','','通讯组','1',1),('90','5','bgsx','办公室1','','办公室1','1',13),('e030d7f8-ea64-40a4-ab4b-53d6bf05f1ec','1','JW','纪委','1','纪委','1',1),('e67ae28e-bf14-446c-8a86-b9af93963540','1','LMZQDD','路面执勤大队','1','路面执勤大队','1',1);

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

insert  into `t_post`(`id`,`pid`,`dept_id`,`post_code`,`post_name`,`post_desc`,`data_state`,`display_order`) values ('1','0','1','ddz','大队长','1','1','1'),('2',NULL,'1','1','副大队长','1','1','0'),('3','0','1','zdz','中队长','3','1','3'),('3636eefb-31be-4cc2-8b1d-8169fc467ba6',NULL,'7644cb53-5593-48f7-ba5b-39a99d4cc26f','wg','网管','通讯组','1','1'),('39c89ded-031e-4997-92d3-6968b5b32fd4',NULL,'6','kezhang','科长','kezhang',NULL,'0'),('4','0','1','jz','警长','4','1','4'),('5','0','1','kz','科长','5','1','5'),('57061f24-ca96-4b9c-9a68-375289db3675',NULL,'1','jjddgw','交警大队顾问','交警大队顾问吧','0','1'),('6','0','1','fkz','副科长','6','1','6'),('616431a7-fb9a-4538-bdb6-970a49451c2a',NULL,'4','科技局','科技科科长','科技局是的','0','1'),('6a903dc0-f6f3-4d96-9646-fe5b8a8b2768',NULL,'e67ae28e-bf14-446c-8a86-b9af93963540','lmzqdddz','路面执勤大队队长','路面执勤大队队长','1','1'),('98e7d37b-0c76-49ff-a3c6-db5ce363c7a8',NULL,'6',NULL,NULL,NULL,NULL,'0'),('9b8b4ec2-72d3-464c-93de-f9fecceefce9',NULL,'6','zgkkz','政工科科长','政工科科长','1','1'),('cfe49436-529a-421f-ab69-5c0a4238f89c',NULL,'1','xj','协警','协警','0','0'),('f1b420f9-03c7-4273-bf55-3835e73d1f04',NULL,'e030d7f8-ea64-40a4-ab4b-53d6bf05f1ec','纪委主任','纪委主任','纪委主任','0','0'),('f671e0e9-c4e2-488d-8318-5d99c387f0cc',NULL,'1',NULL,NULL,NULL,NULL,'0');

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

insert  into `t_topic`(`id`,`pid`,`topic_name`,`topic_type`,`topic_desc`,`data_state`,`display_order`,`topic_code`) values ('1','0','文章类型','1','根节点','1',0,'WZLX'),('2','1','交警大事记','1','交警大事记','2',1,'JJDSJ'),('3','1','计划小结','2','计划小结','1',2,'JHXJ'),('4','1','综合要闻','2','综合要闻','2',3,'ZHYW'),('90df7e42-12a3-4a29-9e86-b69c91f58b7c','1','领导动态','2','领导动态','1',1,'LDDT');

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

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`login_name`,`login_password`,`login_time`,`data_state`,`office_telephone`,`mobile_phone`,`user_name`,`birthday`,`dept_id`,`post_id`,`user_desc`) values ('13364064-202f-4b32-a7bf-1b1d9cf36800','lixiaohong','1123','2018-01-30 15:13:39','1','777','18019563065','政工科李小红','2018-01-30','6','9b8b4ec2-72d3-464c-93de-f9fecceefce9','政工科李小红政工科李小红政工科李小红政工科李小红'),('1fa48cc2-c97b-43e8-b4b0-97a16cd5e097','123','123','2018-01-30 15:13:45','1','888','12345677','政工科张文武','1983-03-17','6','9b8b4ec2-72d3-464c-93de-f9fecceefce9',''),('23fff004-3373-43dc-8f9d-d49fbcadc663','admin','e10adc3949ba59abbe56e057f20f883e','2018-01-30 23:09:33','1','0553-5394251','13855959618','天天','2018-01-23','6','9b8b4ec2-72d3-464c-93de-f9fecceefce9','天天'),('4e4ad69f-2dac-4d30-b09c-5e7b563c9fe4','wth','e10adc3949ba59abbe56e057f20f883e','2018-01-31 09:00:27','1','05535678232','18019563065','王天虎','2018-01-31','6','9b8b4ec2-72d3-464c-93de-f9fecceefce9','123456'),('54ab55d9-3954-498c-b79f-f56736f4d8ea','lxx','123','2018-01-30 14:57:27','1','0777-3333331','18789324','政工科刘小霞','2018-01-17','6','9b8b4ec2-72d3-464c-93de-f9fecceefce9','政工科刘小霞'),('5df27c4d-10f0-4edb-883b-f4656a1cdb5f','111111111111','333333','2018-01-30 15:13:52','1','8989','11111111111','纪委董必文','2018-01-30','1','2','纪委董必文纪委董必文纪委董必文'),('65098586-fd3c-4d1b-8e5a-d90ea3b5ed5e','zsh','1111','2018-01-30 15:13:27','0','0553-5390877','18019563987','大队赵山河','1978-01-02','1','5','大队赵山河大队赵山河大队赵山河大队赵山河大队赵山河'),('d579e129-e328-46f7-880f-4e029264367c','zhanghaiyang','25d55ad283aa400af464c76d713c07ad','2018-01-31 20:53:30','1','0553-9048676','18019564555','张海洋','2018-01-24','7644cb53-5593-48f7-ba5b-39a99d4cc26f','3636eefb-31be-4cc2-8b1d-8169fc467ba6','张海洋'),('df921ab6-e6ca-4742-94af-a2571ea266d8','1','1','2018-01-30 15:31:54','1','11','1','王华','2018-01-17','e67ae28e-bf14-446c-8a86-b9af93963540','6a903dc0-f6f3-4d96-9646-fe5b8a8b2768','111'),('e8a5622f-88e3-4bf1-94c5-4e7ab4c0af34','','','2018-01-30 15:26:34','0','0','','副队江洋','2018-01-23','1','2','');

/*Table structure for table `v_article_info` */

DROP TABLE IF EXISTS `v_article_info`;

/*!50001 DROP VIEW IF EXISTS `v_article_info` */;
/*!50001 DROP TABLE IF EXISTS `v_article_info` */;

/*!50001 CREATE TABLE  `v_article_info`(
 `id` varchar(36) ,
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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_article_info` AS select `j`.`id` AS `id`,`j`.`topic_id` AS `topic_id`,`j`.`article_title` AS `article_title`,`j`.`article_image_url` AS `article_image_url`,`j`.`article_content` AS `article_content`,`j`.`publish_dept_id` AS `publish_dept_id`,`j`.`publish_user_id` AS `publish_user_id`,`j`.`check_state` AS `check_state`,`j`.`top_count` AS `top_count`,`j`.`view_count` AS `view_count`,`j`.`display_order` AS `display_order`,`j`.`data_state` AS `data_state`,`j`.`create_date` AS `create_date`,`j`.`update_date` AS `update_date`,`j`.`topic_name` AS `topic_name`,`j`.`publish_dept_name` AS `publish_dept_name`,`k`.`user_name` AS `publish_user_name` from (((select `m`.`id` AS `id`,`m`.`topic_id` AS `topic_id`,`m`.`article_title` AS `article_title`,`m`.`article_image_url` AS `article_image_url`,`m`.`article_content` AS `article_content`,`m`.`publish_dept_id` AS `publish_dept_id`,`m`.`publish_user_id` AS `publish_user_id`,`m`.`check_state` AS `check_state`,`m`.`top_count` AS `top_count`,`m`.`view_count` AS `view_count`,`m`.`display_order` AS `display_order`,`m`.`data_state` AS `data_state`,`m`.`create_date` AS `create_date`,`m`.`update_date` AS `update_date`,`m`.`topic_name` AS `topic_name`,`n`.`dept_name` AS `publish_dept_name` from (((select `t`.`id` AS `id`,`t`.`topic_id` AS `topic_id`,`t`.`article_title` AS `article_title`,`t`.`article_image_url` AS `article_image_url`,`t`.`article_content` AS `article_content`,`t`.`publish_dept_id` AS `publish_dept_id`,`t`.`publish_user_id` AS `publish_user_id`,`t`.`check_state` AS `check_state`,`t`.`top_count` AS `top_count`,`t`.`view_count` AS `view_count`,`t`.`display_order` AS `display_order`,`t`.`data_state` AS `data_state`,`t`.`create_date` AS `create_date`,`t`.`update_date` AS `update_date`,`s`.`topic_name` AS `topic_name` from (`bxs`.`t_article` `t` left join `bxs`.`t_topic` `s` on((`t`.`topic_id` = `s`.`id`))))) `m` left join `bxs`.`t_dept` `n` on((`m`.`publish_dept_id` = `n`.`id`))))) `j` left join `bxs`.`t_user` `k` on((`j`.`publish_user_id` = `k`.`id`))) */;

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
