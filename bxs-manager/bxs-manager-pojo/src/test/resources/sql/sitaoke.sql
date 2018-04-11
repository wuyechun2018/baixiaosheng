USE sitaoke;

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
  KEY `index_article_create_date` (`create_date`),
  KEY `index_article_tpc` (`top_count`,`publish_date`,`create_date`),
  FULLTEXT KEY `ft_article_title` (`article_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1文章';


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
  `publish_date` date DEFAULT NULL COMMENT '发布时间',
  `top_state` varchar(10) DEFAULT NULL,
  `pop_state` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2文章历史表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3系统配置表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='4系统配置类型表';


CREATE TABLE `t_dept` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) NOT NULL COMMENT '父主键',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `dept_type` varchar(10) DEFAULT NULL COMMENT '部门类型',
  `dept_desc` varchar(500) DEFAULT NULL COMMENT '备注说明',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='5部门表';


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='6飘窗配置表';


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='7信息排名表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='8友情链接表';


CREATE TABLE `t_link_type` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pid` varchar(36) DEFAULT NULL COMMENT '父主键',
  `link_type_code` varchar(50) DEFAULT NULL COMMENT '超链接类型编码',
  `link_type_name` varchar(100) DEFAULT NULL COMMENT '超链接类型名称',
  `link_type_desc` varchar(500) DEFAULT NULL COMMENT '链接类型描述',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='9链接类型表';
