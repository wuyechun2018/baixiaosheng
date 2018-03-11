package com.bxs.pojo;

/**
 * 
 * 系统配置表
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月11日 下午11:20:23
 * @history:
 * @version: v1.0
 */
public class Config {

	// 配置主键
	private String id;
	// 配置类型ID
	private String configTypeId;
	// 配置名称
	private String configName;
	// 配置编码
	private String configCode;
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

	public String getConfigTypeId() {
		return configTypeId;
	}

	public void setConfigTypeId(String configTypeId) {
		this.configTypeId = configTypeId;
	}

	public String getConfigName() {
		return configName;
	}

	public void setConfigName(String configName) {
		this.configName = configName;
	}

	public String getConfigCode() {
		return configCode;
	}

	public void setConfigCode(String configCode) {
		this.configCode = configCode;
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
