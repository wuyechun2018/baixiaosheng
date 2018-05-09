-- 20180509
ALTER TABLE t_article ADD about_content VARCHAR(500) COMMENT '内容简介'; 
ALTER TABLE t_article_history ADD about_content VARCHAR(500) COMMENT '内容简介'; 



-- 20180425
-- 耗时7 min 32 sec
ALTER TABLE t_article ADD res_edtior VARCHAR(100) COMMENT '责任编辑'; 
-- 耗时 8 min 19 sec
ALTER TABLE t_article ADD title_color VARCHAR(50) COMMENT '标题颜色'; 
-- 备份表添加字段 
ALTER TABLE t_article_history ADD res_edtior VARCHAR(100) COMMENT '责任编辑'; 
ALTER TABLE t_article_history ADD title_color VARCHAR(50) COMMENT '标题颜色'; 