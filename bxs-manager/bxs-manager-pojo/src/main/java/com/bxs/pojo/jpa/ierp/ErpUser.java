package com.bxs.pojo.jpa.ierp;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;


@Entity(name = "t_erp_user")
public class ErpUser implements java.io.Serializable {

	// Fields

	private String id;
	//员工编号，工号
	private String empNo;
	//员工姓名
	private String empName;
	//登录账号
	private String loginName;
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
	private String createUserId;
	private Date createDate;
	private String updateUserId;
	private Date updateDate;
	//数据状态
	private String dataState;
	//用户描述
	private String userDesc;

	// Constructors

	/** default constructor */
	public ErpUser() {
	}

	/** minimal constructor */
	public ErpUser(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpUser(String id, String empNo, String empName, String loginName,
			String loginPwd, String empState, String belongOrgId,
			String postId, String mobilePhone, String email,
			String createUserId, Date createDate, String updateUserId,
			Date updateDate, String dataState) {
		this.id = id;
		this.empNo = empNo;
		this.empName = empName;
		this.loginName = loginName;
		this.loginPwd = loginPwd;
		this.empState = empState;
		this.belongOrgId = belongOrgId;
		this.postId = postId;
		this.mobilePhone = mobilePhone;
		this.email = email;
		this.createUserId = createUserId;
		this.createDate = createDate;
		this.updateUserId = updateUserId;
		this.updateDate = updateDate;
		this.dataState = dataState;
	}

	// Property accessors
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@GeneratedValue(generator = "generator")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "EMP_NO", length = 50)
	public String getEmpNo() {
		return this.empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Column(name = "EMP_NAME", length = 50)
	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Column(name = "LOGIN_NAME", length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "LOGIN_PWD", length = 50)
	public String getLoginPwd() {
		return this.loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	@Column(name = "EMP_STATE", length = 50)
	public String getEmpState() {
		return this.empState;
	}

	public void setEmpState(String empState) {
		this.empState = empState;
	}

	@Column(name = "BELONG_ORG_ID", length = 36)
	public String getBelongOrgId() {
		return this.belongOrgId;
	}

	public void setBelongOrgId(String belongOrgId) {
		this.belongOrgId = belongOrgId;
	}

	@Column(name = "POST_ID", length = 36)
	public String getPostId() {
		return this.postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	@Column(name = "MOBILE_PHONE", length = 50)
	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	@Column(name = "EMAIL", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "CREATE_USER_ID", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE")
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "UPDATE_USER_ID", length = 36)
	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "UPDATE_DATE")
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	@Column(name = "USER_DESC", length = 500)
	public String getUserDesc() {
		return userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}
	
	

}