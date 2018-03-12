package com.bxs.pojo;

/**
 * 
 * 系统配置信息
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月11日 下午11:20:23
 * @history:
 * @version: v1.0
 */
public class ConfigInfoVo {

	// 配置主键
	private String id;
	// 配置类型ID
	private String configTypeId;
	// 配置名称
	private String configName;
	// 配置编码
	private String configCode;
	// 配置值
	private String configValue;
	// 链接地址
	private String linkUrl;
	// 链接打开类型
	private String linkTargetType;
	// 配图地址
	private String configImageUrl;
	// 排序
	private int displayOrder;
	// 数据状态
	private String dataState;
	//配置类型编码
	private String configTypeCode;
	//配置类型名称
	private String configTypeName;
	//配置描述
	private String configDesc;

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

	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getLinkTargetType() {
		return linkTargetType;
	}

	public void setLinkTargetType(String linkTargetType) {
		this.linkTargetType = linkTargetType;
	}

	public String getConfigImageUrl() {
		return configImageUrl;
	}

	public void setConfigImageUrl(String configImageUrl) {
		this.configImageUrl = configImageUrl;
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

	public String getConfigDesc() {
		return configDesc;
	}

	public void setConfigDesc(String configDesc) {
		this.configDesc = configDesc;
	}
	
}
