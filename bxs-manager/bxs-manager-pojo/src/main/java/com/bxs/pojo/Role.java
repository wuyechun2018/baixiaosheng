package com.bxs.pojo;

import java.util.Date;

/**
 * 
 * 系统角色
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月28日 上午7:21:12
 * @history:
 * @version: v1.0
 */
public class Role {

	private String id;
	// 角色编码
	private String roleCode;
	// 角色名称
	private String roleName;
	// 角色描述
	private String roleDesc;
	// 数据状态 0删除 1正常
	private String dataState;
	// 创建时间
	private Date createDate;
	// 更新时间
	private Date updateDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
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

}
