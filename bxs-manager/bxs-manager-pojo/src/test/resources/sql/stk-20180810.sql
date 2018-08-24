-- 1、 添加表注释
ALTER TABLE t_biz_node COMMENT='业务节点基本属性表';

-- 2、查看表注释
SELECT t.TABLE_NAME,TABLE_COMMENT,T.TABLE_TYPE,T.* FROM INFORMATION_SCHEMA.TABLES t WHERE 
T.TABLE_SCHEMA='bxs'
--  T.TABLE_TYPE IN('BASE TABLE','VIEW');


CREATE TABLE `t_biz_node` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `PID` varchar(255) DEFAULT NULL COMMENT '父节点',
  `BIZ_NODE_CODE` varchar(100) DEFAULT NULL COMMENT '节点编码',
  `BIZ_NODE_NAME` varchar(200) DEFAULT NULL COMMENT '节点名称',
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT '节点类型编码',
  `TYPE_NAME` varchar(100) DEFAULT NULL COMMENT '节点类型名称',
  `NODE_DESC` varchar(500) DEFAULT NULL COMMENT '节点描述',
  `DATA_STATE` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `t_biz_node_extend` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `MAIN_NODE_ID` varchar(32) DEFAULT NULL COMMENT '基本节点Id',
  `ATTR_TYPE` varchar(50) DEFAULT NULL COMMENT '属性类型（1 Txt 2 超链接）',
  `ATTR_KEY` varchar(100) DEFAULT NULL COMMENT '属性键名称',
  `ATTR_VALUE` varchar(500) DEFAULT NULL COMMENT '属性名称',
  `display_order` bigint(10) DEFAULT NULL COMMENT '排序',
  `data_state` varchar(10) NOT NULL COMMENT '数据状态（0：删除 1：正常）',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE t_biz_node COMMENT='业务节点扩展属性表';
