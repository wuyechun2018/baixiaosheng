package com.bxs.pojo.jpa;

/**
 * 
 * 业务节点扩展属性
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年7月16日 上午11:01:32
 * @history:
 * @version: v1.0
 */
public class BizNodeExtend {

	private String id;
	// 基本节点Id,对应BizNode表的Id字段
	private String baseNodeId;
	// 扩展属性编码
	private String attrCode;
	// 1 Txt 2 超链接
	private String attrType;
	// 扩展属性值
	private String attrValue;
	// 排序值
	private int displayOrder;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBaseNodeId() {
		return baseNodeId;
	}

	public void setBaseNodeId(String baseNodeId) {
		this.baseNodeId = baseNodeId;
	}

	public String getAttrCode() {
		return attrCode;
	}

	public void setAttrCode(String attrCode) {
		this.attrCode = attrCode;
	}

	public String getAttrType() {
		return attrType;
	}

	public void setAttrType(String attrType) {
		this.attrType = attrType;
	}

	public String getAttrValue() {
		return attrValue;
	}

	public void setAttrValue(String attrValue) {
		this.attrValue = attrValue;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

}
