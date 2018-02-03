CREATE OR REPLACE VIEW V_USER_INFO
AS 
SELECT M.*,N.POST_NAME FROM (SELECT T.*,S.DEPT_NAME FROM t_user T LEFT JOIN T_DEPT S  ON  T.DEPT_ID=S.ID)M LEFT JOIN T_POST N ON M.POST_ID=N.ID;

CREATE OR REPLACE VIEW v_link_info AS
SELECT t.*,s.link_type_name FROM t_link t LEFT JOIN t_link_type s ON t.link_type_id=s.id;


CREATE OR REPLACE VIEW v_post_info AS
SELECT T.*,S.dept_name FROM T_POST T LEFT JOIN T_DEPT S ON T.dept_id=S.ID;


CREATE OR REPLACE VIEW  v_article_info AS
SELECT J.*,K.user_name AS publish_user_name FROM (
SELECT M.*,N.dept_name AS publish_dept_name FROM (SELECT T.*,S.topic_name,S.topic_code FROM t_article T LEFT JOIN t_topic S ON T.topic_id=S.id)M LEFT JOIN T_DEPT N
ON M.PUBLISH_DEPT_ID=N.id)J LEFT JOIN T_USER K ON J.PUBLISH_USER_ID=K.id;


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