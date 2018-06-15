package com.bxs.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Leave {
	private static final long serialVersionUID = 1L;
	
	//主键
	private String id;
	//用户Id
	private String userId;
	//用户名
	private String userName;
	//请假类型
	private String leaveType;
	//开始时间
	private Date startTime;
	//结束时间
	private Date endTime;
	//理由
	private String reason;

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}


}
