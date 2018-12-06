--  商家 
CREATE TABLE `t_biz_shop` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `SHOP_NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `SHOP_MANAGER` varchar(200) NULL COMMENT '负责人',
  `TELEPHONE` varchar(50) DEFAULT NULL COMMENT '电话',
  `ADDRESS` varchar(500) COMMENT '地址',
  `BIZ_DESC` varchar(500) COMMENT '备注描述',
  `DISPLAY_ORDER` bigint(10) DEFAULT NULL COMMENT '排序',
  `DATA_STATE` varchar(10) DEFAULT NULL COMMENT '数据状态',
  `CREATE_USER_ID` varchar(36) DEFAULT NULL COMMENT '创建人主键',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_USER_ID` varchar(36) DEFAULT NULL COMMENT '创建人主键',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;