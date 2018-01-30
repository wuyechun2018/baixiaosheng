package com.bxs.pojo;

import static javax.persistence.GenerationType.IDENTITY;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 系统用户实体类
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年1月28日 上午10:01:29
 * @history:
 * @version: v1.0
 */
@Entity
@Table(name = "t_user")
public class SysUser implements java.io.Serializable {

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
	private Date birthday;
	//部门ID
	private String deptId;
	//职位ID
	private String postId;
	//备注信息
	private String userDesc;


	public SysUser() {
	}

	public SysUser(String loginName, String loginPassword, Date loginTime) {
		this.loginName = loginName;
		this.loginPassword = loginPassword;
		this.loginTime = loginTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "login_name", length = 200)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "login_password", length = 200)
	public String getLoginPassword() {
		return this.loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	@Column(name = "login_time")
	public Date getLoginTime() {
		return this.loginTime;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getUserDesc() {
		return userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}
	
	
}