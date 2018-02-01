package com.bxs.pojo;

/**
 * 
 * 系统导航类型
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年2月1日 下午3:08:06
 * @history:
 * @version: v1.0
 */
public class LinkType {

	// 主键
	private String id;
	// 父主键
	private String pid;
	// 超链接类型编码
	private String linkTypeCode;
	// 超链接类型名称
	private String linkTypeName;
	// 链接类型描述
	private String linkTypeDesc;
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

	public String getLinkTypeCode() {
		return linkTypeCode;
	}

	public void setLinkTypeCode(String linkTypeCode) {
		this.linkTypeCode = linkTypeCode;
	}

	public String getLinkTypeName() {
		return linkTypeName;
	}

	public void setLinkTypeName(String linkTypeName) {
		this.linkTypeName = linkTypeName;
	}

	public String getLinkTypeDesc() {
		return linkTypeDesc;
	}

	public void setLinkTypeDesc(String linkTypeDesc) {
		this.linkTypeDesc = linkTypeDesc;
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
