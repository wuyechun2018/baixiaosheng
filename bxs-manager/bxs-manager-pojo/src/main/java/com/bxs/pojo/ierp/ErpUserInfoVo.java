package com.bxs.pojo.ierp;

import java.util.Date;

public class ErpUserInfoVo {
	
	// Fields
	private String id;
	//员工编号，工号
	private String empNo;
	//员工姓名
	private String empName;
	//登录账号
	private String loginName;
	//登录密码
	private String loginPwd;
	//员工状态  1 在职  0 离职 
	private String empState;
	//所属公司Id
	private String belongOrgId;
	//职位Id
	private String postId;
	//手机号
	private String mobilePhone;
	//邮箱地址
	private String email;
	//创建人Id
	private String createUserId;
	//创建时间
	private Date createDate;
	//更新人
	private String updateUserId;
	//更新时间
	private Date updateDate;
	//数据状态
	private String dataState;
	//所属公司名称
	private String belongOrgName;
	
	//用户描述
	private String userDesc;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getEmpState() {
		return empState;
	}
	public void setEmpState(String empState) {
		this.empState = empState;
	}
	public String getBelongOrgId() {
		return belongOrgId;
	}
	public void setBelongOrgId(String belongOrgId) {
		this.belongOrgId = belongOrgId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}
	public String getBelongOrgName() {
		return belongOrgName;
	}
	public void setBelongOrgName(String belongOrgName) {
		this.belongOrgName = belongOrgName;
	}
	public String getUserDesc() {
		return userDesc;
	}
	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}

}
