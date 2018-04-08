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
  `publish_date` date DEFAULT NULL COMMENT '发布时间',
  `top_state` varchar(10) DEFAULT NULL,
  `pop_state` varchar(10) DEFAULT NULL,
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
  FULLTEXT KEY `ft_article_title` (`article_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';