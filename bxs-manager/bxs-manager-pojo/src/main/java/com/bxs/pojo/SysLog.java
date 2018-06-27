package com.bxs.pojo;

import java.util.Date;

/**
 * 
 * 操作日志
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年6月26日 下午4:34:46
 * @history:
 * @version: v1.0
 */
public class SysLog {
	
	//主键
	private String id;
	//操作用户Id
	private String opUserId;
	//业务Id
	private String bizId;
	//模块名称
	private String modelName;
	//操作类型 VISIT/ADD/UPDATE/DELETE
	private String opType;
	//操作时间
	private Date opTime;
	//客户端IP
	private String clientIp;
	//备注
	private String opDesc;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOpUserId() {
		return opUserId;
	}
	public void setOpUserId(String opUserId) {
		this.opUserId = opUserId;
	}
	public String getBizId() {
		return bizId;
	}
	public void setBizId(String bizId) {
		this.bizId = bizId;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	
	public String getOpType() {
		return opType;
	}
	public void setOpType(String opType) {
		this.opType = opType;
	}
	public Date getOpTime() {
		return opTime;
	}
	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}
	public String getClientIp() {
		return clientIp;
	}
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}
	public String getOpDesc() {
		return opDesc;
	}
	public void setOpDesc(String opDesc) {
		this.opDesc = opDesc;
	}
	
}
