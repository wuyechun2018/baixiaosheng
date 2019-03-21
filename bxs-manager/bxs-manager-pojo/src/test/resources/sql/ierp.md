1、数据库初始化
1）数据库配置文件位置 applicationContext-dao.xml,目前放在项目中
<!-- 加载配置文件 -->
<context:property-placeholder location="classpath:jdbc.properties" />
	
<!-- 将配置文件放到磁盘目录下，方便修改和多环境部署 
<context:property-placeholder location="file:/jdbc.properties" /> -->

2)数据库字符串
jdbc:mysql://120.55.112.39:3306/sitaoke?useUnicode=true&characterEncoding=UTF-8
jdbc.username=root
jdbc.password=root

修改成
#jdbc.driver=com.mysql.jdbc.Driver
#jdbc.url=jdbc:mysql://127.0.0.1:3306/ierp?useUnicode=true&characterEncoding=UTF-8
#jdbc.username=root
#jdbc.password=root

3)创建数据库(远程创建用TV机)
CREATE DATABASE IF NOT EXISTS ierp DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

4)启动报错 Table 'ierp.v_user_info' doesn't exist
4-1)创建表 t_user 用户表
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



insert into t_user
  (id,
   login_name,
   login_password,
   login_time,
   data_state,
   office_telephone,
   mobile_phone,
   user_name,
   birthday,
   dept_id,
   post_id,
   user_desc)
values
  ('1',
   'admin',
   '25d55ad283aa400af464c76d713c07ad',
   '2018-02-12 17:21:29',
   '1',
   '0553-5845159',
   '18105532468',
   '管理员',
   '2018-02-07',
   '1',
   '1',
   '系统管理员');   

4-2)创建表 t_dept 部门表

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

 INSERT INTO t_dept
  (id,
   pid,
   dept_code,
   dept_name,
   dept_type,
   dept_desc,
   data_state,
   display_order)
VALUES
  ('1', '0', '0', '部门', '1', '单位部门', '1', 1)
  ('2', '1', '1001', '总经理', '1', '总经理', '1', 1),
  ('3', '1', '1002', '财务部', '1', '财务部', '1', 1),
  ('4', '1', '1003', '市场部', '1', '市场部', '1', 1);


4-3)创建表 t_post 职位
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

 Table 'ierp.t_user_role' doesn't exist 
       
 4-4) 创建用户视图
  CREATE VIEW  v_user_info  AS
SELECT m.id               AS id,
       m.login_name       AS login_name,
       m.login_password   AS login_password,
       m.login_time       AS login_time,
       m.data_state       AS data_state,
       m.office_telephone AS office_telephone,
       m.mobile_phone     AS mobile_phone,
       m.user_name        AS user_name,
       m.birthday         AS birthday,
       m.dept_id          AS dept_id,
       m.post_id          AS post_id,
       m.user_desc        AS user_desc,
       m.DEPT_NAME        AS DEPT_NAME,
       n.post_name        AS POST_NAME,
       n.display_order    AS POST_DISPLAY_ORDER
  FROM (SELECT t.id               AS id,
                 t.login_name       AS login_name,
                 t.login_password   AS login_password,
                 t.login_time       AS login_time,
                 t.data_state       AS data_state,
                 t.office_telephone AS office_telephone,
                 t.mobile_phone     AS mobile_phone,
                 t.user_name        AS user_name,
                 t.birthday         AS birthday,
                 t.dept_id          AS dept_id,
                 t.post_id          AS post_id,
                 t.user_desc        AS user_desc,
                 s.dept_name        AS DEPT_NAME
            FROM t_user t LEFT JOIN t_dept s ON t.dept_id = s.id) m LEFT JOIN
       t_post n ON m.post_id = n.id      



(1)创建表 t_config_type
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

(2)创建表
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


INSERT INTO t_config_type
  (id,
   pid,
   config_type_code,
   config_type_name,
   config_value_type,
   config_type_desc,
   data_state,
   display_order)
VALUES
  ('1', '0', 'PZLX', '配置类型', '0', '系统配置', '1', 1);


create view v_config_info as 
select t.id                AS id,
       t.config_type_id    AS config_type_id,
       t.config_name       AS config_name,
       t.config_code       AS config_code,
       t.config_value      AS config_value,
       t.link_url          AS link_url,
       t.link_target_type  AS link_target_type,
       t.config_image_url  AS config_image_url,
       t.data_state        AS data_state,
       t.display_order     AS display_order,
       t.config_desc       AS config_desc,
       s.config_type_name  AS config_type_name,
       s.config_type_code  AS config_type_code,
       s.config_value_type AS config_value_type
  from t_config t
  left join t_config_type s
    on t.config_type_id = s.id;



5)启动报错 Table 'ierp.t_user_role' doesn't exist
5-1)
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

5-2)初始化数据
insert into t_role
  (id,
   role_code,
   role_name,
   role_desc,
   data_state,
   create_date,
   update_date)
values
  ('2',
   'GUEST',
   '访客',
   '普通用户',
   '1',
   '2019-02-03 23:51:08',
   '2019-02-03 23:51:28'),
  ('1',
   'SYSADMIN',
   '系统管理员',
   '系统管理员,一般赋予最高权限',
   '1',
   '2019-02-27 23:51:08',
   '2019-02-27 23:51:28');
   
   
   CREATE TABLE `t_user_role` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `data_state` varchar(10) DEFAULT NULL COMMENT '数据状态（0：删除 1：正常）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into t_user_role
  (id, user_id, role_id, data_state, create_date, update_date)
values
  ('1',
   '1',
   '1',
   '1',
   '2019-02-28 09:45:28',
   '2019-02-28 09:50:28');

6)启动报错 Table 'ierp.t_menu' doesn't exist
6-1)
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


insert into t_menu
  (id, pid, menu_name, menu_url, menu_type, DATA_STATE, display_order)
values
  ('18', '0', '系统配置', '#', '1', '1', 18),
  ('19', '18', '配置项', '/eui/config/list', '2', '1', 19),
  ('8', '0', '基础信息', '  #', '2', '1', 8),
  ('9', '8', '用户管理', '/eui/user/list', '2', '1', 13),
  ('11', '8', '职位管理', '/eui/post/list', '2', '1', 12),
  ('12', '8', '部门管理', '/eui/dept/list', '2', '1', 11);



7)Table 'ierp.v_post_info' doesn't exist
CREATE view v_post_info as
select t . id AS id,
       t . pid AS pid,
       t . dept_id AS dept_id,
       t . post_code AS post_code,
       t . post_name AS post_name,
       t . post_desc AS post_desc,
       t . data_state AS data_state,
       t . display_order AS display_order,
       s . dept_name AS dept_name
  from t_post t left join t_dept s on t . dept_id = s . id;


前端页面调整
1、IndexController.java 中
//ModelAndView mv=new ModelAndView("login");
ModelAndView mv=new ModelAndView("login-yun");
2、新增了 login-yun.jsp
3、新增了 login-yun.css




create table T_ERP_USER
(
   ID                   VARCHAR(36) not null,
   EMP_NO               VARCHAR(50) comment '员工编号',
   EMP_NAME             VARCHAR(50) comment '员工姓名',
   LOGIN_NAME           VARCHAR(50) comment '登录名',
   LOGIN_PWD            VARCHAR(50) comment '登录密码',
   EMP_STATE            VARCHAR(50) comment '用户状态（在职、离职)',
   BELONG_ORG_ID        VARCHAR(36) comment '所属公司ID',
   POST_ID              VARCHAR(36) comment '职位ID',
   MOBILE_PHONE         VARCHAR(50) comment '电话',
   EMAIL                VARCHAR(100) comment '邮箱',
   CREATE_USER_ID       VARCHAR(36) comment '创建人',
   CREATE_DATE          DATE comment '创建时间',
   UPDATE_USER_ID       VARCHAR(36) comment '更新人',
   UPDATE_DATE          DATE comment '更新时间',
   DATA_STATE           VARCHAR(10) comment '数据状态',
   primary key (ID)
);

alter table T_ERP_USER comment 'ERP用户';












