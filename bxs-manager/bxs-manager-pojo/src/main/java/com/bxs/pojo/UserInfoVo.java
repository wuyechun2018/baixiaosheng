package com.bxs.pojo;

import java.util.Date;

/**
 * 
 * 用户信息VO,用户表、部门表、职务表 关联查询
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年1月28日 上午10:08:00
 * @history:
 * @version: v1.0
 */
public class UserInfoVo {
	//主键
	private String id;
    //登录名
	private String loginName;
	//密码
	private String loginPassword;
	//登录时间
	private Date loginTime;
	//数据状态,详情参考  com.bxs.common.dict.DataState
	private String dataState;
	//办公电话
	private String officeTelephone;
	//手机号
	private String mobilePhone;
	//姓名
	private String userName;
	//生日
	private String birthday;
	//部门ID
	private String deptId;
	//部门名称
	private String deptName;
	//职位ID
	private String topicId;
	//职位名称
	private String topicName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}
	public String getOfficeTelephone() {
		return officeTelephone;
	}
	public void setOfficeTelephone(String officeTelephone) {
		this.officeTelephone = officeTelephone;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getTopicId() {
		return topicId;
	}
	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	
	
	

}
