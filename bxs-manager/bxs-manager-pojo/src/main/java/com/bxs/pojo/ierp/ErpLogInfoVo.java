package com.bxs.pojo.ierp;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ErpLogInfoVo {
	private String id;
	private String loginUserId;
	private String loginUserName;
	private String loginClientIp;
	private Date operateTime;
	private String operateType;
	private String bizId;
	private String operateInfo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginUserId() {
		return loginUserId;
	}
	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}
	public String getLoginUserName() {
		return loginUserName;
	}
	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}
	public String getLoginClientIp() {
		return loginClientIp;
	}
	public void setLoginClientIp(String loginClientIp) {
		this.loginClientIp = loginClientIp;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getBizId() {
		return bizId;
	}
	public void setBizId(String bizId) {
		this.bizId = bizId;
	}
	public String getOperateInfo() {
		return operateInfo;
	}
	public void setOperateInfo(String operateInfo) {
		this.operateInfo = operateInfo;
	}
	
}
