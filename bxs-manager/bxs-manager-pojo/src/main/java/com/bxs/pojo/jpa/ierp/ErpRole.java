package com.bxs.pojo.jpa.ierp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * TErpRole entity. @author MyEclipse Persistence Tools
 * 角色
 */
@Entity(name = "t_erp_role")
public class ErpRole implements java.io.Serializable {

	// Fields

	private String id;
	private String roleCode;
	private String roleName;
	private String dataState;

	// Constructors

	/** default constructor */
	public ErpRole() {
	}

	/** minimal constructor */
	public ErpRole(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpRole(String id, String roleCode, String roleName,
			String dataState) {
		this.id = id;
		this.roleCode = roleCode;
		this.roleName = roleName;
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

	@Column(name = "ROLE_CODE", length = 50)
	public String getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	@Column(name = "ROLE_NAME", length = 100)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}