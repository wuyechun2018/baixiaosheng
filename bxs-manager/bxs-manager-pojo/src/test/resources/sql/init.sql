CREATE OR REPLACE VIEW V_USER_INFO
AS 
SELECT M.*,N.POST_NAME FROM (SELECT T.*,S.DEPT_NAME FROM t_user T LEFT JOIN T_DEPT S  ON  T.DEPT_ID=S.ID)M LEFT JOIN T_POST N ON M.POST_ID=N.ID;

CREATE OR REPLACE VIEW v_link_info AS
SELECT t.*,s.link_type_name,s.link_type_code FROM t_link t LEFT JOIN t_link_type s ON t.link_type_id=s.id;

CREATE OR REPLACE VIEW v_post_info AS
SELECT T.*,S.dept_name FROM T_POST T LEFT JOIN T_DEPT S ON T.dept_id=S.ID;


CREATE OR REPLACE VIEW v_article_info AS 
SELECT 
  J.*,
  K.user_name AS publish_user_name 
FROM
  (SELECT 
    M.*,
    N.dept_name AS publish_dept_name 
  FROM
    (SELECT 
      T.*,
      S.topic_name,
      S.topic_code,
      SUBSTRING(t.article_content,LOCATE('src="',t.article_content)+5,58) AS content_image_url 
    FROM
      t_article T 
      LEFT JOIN t_topic S 
        ON T.topic_id = S.id) M 
    LEFT JOIN T_DEPT N 
      ON M.PUBLISH_DEPT_ID = N.id) J 
  LEFT JOIN T_USER K 
    ON J.PUBLISH_USER_ID = K.id ;

    
 CREATE OR REPLACE VIEW v_article_mini_info AS 
SELECT 
      T.id,
      t.article_type,
      t.article_title,
      t.publish_dept_id,
      t.publish_user_id,
      t.check_state,
      t.front_slider_state,
      t.create_date,
      t.update_date,
      t.top_count,
      t.publish_date,
      t.data_state,
      S.topic_name,
      S.topic_code
    FROM
      t_article T 
      LEFT JOIN t_topic S 
        ON T.topic_id = S.id;

CREATE OR REPLACE VIEW v_sign_info AS 
SELECT m.*,n.user_name AS sign_user_name FROM (
SELECT T.*,S.dept_name AS sign_dept_name FROM t_sign T LEFT JOIN t_dept S ON T.sign_dept_id=S.ID)m LEFT JOIN t_user n ON m.sign_user_id=n.id ;
        
        


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


ALTER TABLE t_link ADD link_image_url VARCHAR(1000); 

--2018/02/28 21:15
INSERT  INTO `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`)
 VALUES ('16','0','信息排名','#','1','1',16);
 
 INSERT  INTO `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`)
 VALUES ('17','16','信息填报','/eui/rank/list','2','1',17);
 

 --2018/03/01 20:45
-- 创建表
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

-- 创建视图
 CREATE OR REPLACE VIEW V_INFO_RANK
AS 
SELECT t.*,s.dept_name FROM t_info_rank t LEFT JOIN t_dept s  ON  t.dept_id=s.id ;
 
-- 调整视图 2018/03/04
CREATE OR REPLACE VIEW V_USER_INFO
AS 
SELECT M.*,N.POST_NAME,N.DISPLAY_ORDER AS POST_DISPLAY_ORDER FROM (SELECT T.*,S.DEPT_NAME FROM t_user T LEFT JOIN T_DEPT S  ON  T.DEPT_ID=S.ID)M LEFT JOIN T_POST N ON M.POST_ID=N.ID;

-- 添加字段
 ALTER TABLE t_article ADD top_state VARCHAR(10) COMMENT '置顶状态';
 ALTER TABLE t_article ADD pop_state VARCHAR(10) COMMENT '是否弹窗';
-- 初始化状态
UPDATE t_article T SET T.top_state='0',T.pop_state='0';
UPDATE t_article t SET t.top_state='1' WHERE t.top_count<>'0';

-- 重建视图
CREATE OR REPLACE VIEW v_article_info AS 
SELECT 
  J.*,
  K.user_name AS publish_user_name 
FROM
  (SELECT 
    M.*,
    N.dept_name AS publish_dept_name 
  FROM
    (SELECT 
      T.*,
      S.topic_name,
      S.topic_code,
      SUBSTRING(t.article_content,LOCATE('src="',t.article_content)+5,58) AS content_image_url 
    FROM
      t_article T 
      LEFT JOIN t_topic S 
        ON T.topic_id = S.id) M 
    LEFT JOIN T_DEPT N 
      ON M.PUBLISH_DEPT_ID = N.id) J 
  LEFT JOIN T_USER K 
    ON J.PUBLISH_USER_ID = K.id ;
    
-- 创建视图 2018-03-08    
CREATE VIEW v_sign_article_info AS 
SELECT t.*,s.article_title,s.topic_name,s.publish_dept_name,s.publish_user_name FROM v_sign_info t LEFT JOIN v_article_info s ON t.article_id=s.id;

-- 添加菜单 2018-03-12
INSERT  INTO `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`)
 VALUES ('18','0','系统配置','#','1','1',18);
 
 INSERT  INTO `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`)
 VALUES ('19','18','配置项','/eui/config/list','2','1',19);

-- 创建视图
CREATE OR REPLACE VIEW v_config_info AS
SELECT t.*,s.config_type_name,s.config_type_code FROM t_config t LEFT JOIN t_config_type s ON t.config_type_id=s.id; 
 

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

-- 初始化数据
insert  into `t_config`(`id`,`config_type_id`,`config_name`,`config_code`,`config_value`,`link_url`,`link_target_type`,`config_image_url`,`data_state`,`display_order`,`config_desc`) values ('004fbeaf-4070-461e-9fb8-9f370dd7a7b6','4df01362-bb18-40ff-98b5-e309112dde38','学习贯彻党的十九大',NULL,'','','','/media-data/image/20180312155252/zt2.jpg','1',4,'学习贯彻党的十九大'),('0456d5e3-fb74-42c0-aa22-d90d0d50ac52','2','背景图2',NULL,'','','','/media-data/image/20180312154147/banner2.jpg','1',2,'背景图2'),('a47c50e3-1667-44c7-ab85-a1d43612a205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',0,NULL),('afb2384c-dfc9-42e1-86ba-5c4b9af25f77','2','背景图1',NULL,'','','','/media-data/image/20180312154121/banner1.jpg','1',1,'背景图1'),('c13adaf8-7cce-422a-8379-cdf0e0e2e54a','7aa7468c-6efe-4bd4-a389-23dfc3e69f6b','对党忠诚，服务人民，执法公正，纪律严明',NULL,'','','','/media-data/image/20180312154617/zt1.jpg','1',4,'对党忠诚，服务人民，执法公正，纪律严明'),('d5598e6a-4fef-4f9f-8d0c-04a96a82ddeb','2','背景图3',NULL,'','','','/media-data/image/20180312154203/banner3.jpg','1',3,'背景图3');

insert  into `t_config_type`(`id`,`pid`,`config_type_code`,`config_type_name`,`config_value_type`,`config_type_desc`,`data_state`,`display_order`) values ('1','0','PZLX','配置类型','0','系统配置','1',1),('2','1','BJT','背景图','2','网站首页背景轮播图','1',0),('4df01362-bb18-40ff-98b5-e309112dde38','1','ZTT','专题配图2','2','专题配图2（网站第二个配图）','1',0),('7aa7468c-6efe-4bd4-a389-23dfc3e69f6b','1','GGTP','专题配图1','2','对党忠诚，服务人民，执法公正，纪律严明','1',0);

-- 创建视图
CREATE OR REPLACE VIEW v_config_info AS
SELECT t.*,s.config_type_name,s.config_type_code,s.config_value_type FROM t_config t LEFT JOIN t_config_type s ON t.config_type_id=s.id; 

-- 配置专题
INSERT  INTO `t_menu`(`id`,`pid`,`menu_name`,`menu_url`,`menu_type`,`DATA_STATE`,`display_order`)
 VALUES ('20','18','配置专题','/eui/subject/list','2','1',20);
 