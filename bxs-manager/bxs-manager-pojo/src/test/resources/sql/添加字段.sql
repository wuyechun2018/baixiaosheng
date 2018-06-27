-- 20180627 添加操作日志表
DROP TABLE IF EXISTS `t_sys_log`;

CREATE TABLE `t_sys_log` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `op_user_id` varchar(36) DEFAULT NULL COMMENT '操作用户主键',
  `biz_id` varchar(36) DEFAULT NULL COMMENT '业务主键',
  `model_name` varchar(50) DEFAULT NULL COMMENT '模块名称',
  `op_type` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `op_time` datetime DEFAULT NULL COMMENT '操作时间',
  `client_IP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `op_desc` varchar(500) DEFAULT NULL COMMENT '备注描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 20180509
ALTER TABLE t_article ADD about_content VARCHAR(500) COMMENT '内容简介'; 
ALTER TABLE t_article_history ADD about_content VARCHAR(500) COMMENT '内容简介'; 


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


-- 20180425
-- 耗时7 min 32 sec
ALTER TABLE t_article ADD res_edtior VARCHAR(100) COMMENT '责任编辑'; 
-- 耗时 8 min 19 sec
ALTER TABLE t_article ADD title_color VARCHAR(50) COMMENT '标题颜色'; 
-- 备份表添加字段 
ALTER TABLE t_article_history ADD res_edtior VARCHAR(100) COMMENT '责任编辑'; 
ALTER TABLE t_article_history ADD title_color VARCHAR(50) COMMENT '标题颜色'; 