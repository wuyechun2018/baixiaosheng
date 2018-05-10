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