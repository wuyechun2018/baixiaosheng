package com.bxs.pojo;

import java.util.Date;

public class BizWf {
	
	//主键
	private String id;
	
	//参与人Id
	private String userId;
	
	//业务类型Id
	private String bizTypeId;
	//业务类型名称
	private String bizTypeName;
	//业务对象定义
	private String bizObjectClassDef;
	//业务表单内容
	private String bizFormContent;
	//数据状态  0删除 1在用
	private String dataState;
	// 创建时间
	private Date createDate;
	// 更新时间
	private Date updateDate;
	//备注信息
	private String bizDesc;
	//创建人Id
	private String createUserId;
	//更新人Id
	private String updateUserId;
	//流程实例Id
	private String processInstanceId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBizTypeId() {
		return bizTypeId;
	}
	public void setBizTypeId(String bizTypeId) {
		this.bizTypeId = bizTypeId;
	}
	public String getBizTypeName() {
		return bizTypeName;
	}
	public void setBizTypeName(String bizTypeName) {
		this.bizTypeName = bizTypeName;
	}
	public String getBizObjectClassDef() {
		return bizObjectClassDef;
	}
	public void setBizObjectClassDef(String bizObjectClassDef) {
		this.bizObjectClassDef = bizObjectClassDef;
	}
	public String getBizFormContent() {
		return bizFormContent;
	}
	public void setBizFormContent(String bizFormContent) {
		this.bizFormContent = bizFormContent;
	}
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getBizDesc() {
		return bizDesc;
	}
	public void setBizDesc(String bizDesc) {
		this.bizDesc = bizDesc;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

}
