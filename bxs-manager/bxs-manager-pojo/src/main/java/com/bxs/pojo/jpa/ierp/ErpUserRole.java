package com.bxs.pojo.jpa.ierp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

/**
 * 用户角色关联表
 */
@Entity(name = "t_erp_user_role")
public class ErpUserRole implements java.io.Serializable {

	// Fields

	private String id;
	private String userId;
	private String roleId;
	private String dataState;

	// Constructors

	/** default constructor */
	public ErpUserRole() {
	}

	/** minimal constructor */
	public ErpUserRole(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpUserRole(String id, String userId, String roleId,
			String dataState) {
		this.id = id;
		this.userId = userId;
		this.roleId = roleId;
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

	@Column(name = "USER_ID", length = 32)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "ROLE_ID", length = 32)
	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}