package com.bxs.pojo;

/**
 * 
 * 系统导航
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年2月1日 下午3:09:30
 * @history:
 * @version: v1.0
 */
public class Link {
	// 主键
	private String id;
	// 链接类型ID
	private String linkTypeId;
	// 链接名称
	private String linkName;
	// 链接描述信息
	private String linkDesc;
	// 链接地址
	private String linkUrl;
	//链接配图地址
	private String linkImageUrl;
	// 链接打开窗口方式
	private String linkTargetType;
	// 数据状态（0：删除 1：正常）
	private String dataState;
	// 排序
	private int displayOrder;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLinkTypeId() {
		return linkTypeId;
	}

	public void setLinkTypeId(String linkTypeId) {
		this.linkTypeId = linkTypeId;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkDesc() {
		return linkDesc;
	}

	public void setLinkDesc(String linkDesc) {
		this.linkDesc = linkDesc;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getLinkImageUrl() {
		return linkImageUrl;
	}

	public void setLinkImageUrl(String linkImageUrl) {
		this.linkImageUrl = linkImageUrl;
	}

	public String getLinkTargetType() {
		return linkTargetType;
	}

	public void setLinkTargetType(String linkTargetType) {
		this.linkTargetType = linkTargetType;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

}
