package com.bxs.pojo;

/**
 * 
 * 系统配置类型实体类
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月11日 下午11:10:10
 * @history:
 * @version: v1.0
 */
public class ConfigType {

	// 主键
	private String id;
	// 配置类型父主键
	private String pid;
	// 配置类型编码
	private String configTypeCode;
	// 配置类型名称
	private String configTypeName;
	// 配置值类型（1、文字 2、图片 3、专题）
	private String configValueType;
	// 配置类型描述
	private String configTypeDesc;
	// 排序
	private int displayOrder;
	// 数据状态
	private String dataState;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getConfigTypeCode() {
		return configTypeCode;
	}

	public void setConfigTypeCode(String configTypeCode) {
		this.configTypeCode = configTypeCode;
	}

	public String getConfigTypeName() {
		return configTypeName;
	}

	public void setConfigTypeName(String configTypeName) {
		this.configTypeName = configTypeName;
	}

	public String getConfigValueType() {
		return configValueType;
	}

	public void setConfigValueType(String configValueType) {
		this.configValueType = configValueType;
	}

	public String getConfigTypeDesc() {
		return configTypeDesc;
	}

	public void setConfigTypeDesc(String configTypeDesc) {
		this.configTypeDesc = configTypeDesc;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}
