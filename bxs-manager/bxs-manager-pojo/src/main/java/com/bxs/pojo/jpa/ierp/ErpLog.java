package com.bxs.pojo.jpa.ierp;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * TErpLog entity. @author MyEclipse Persistence Tools
 */
@Entity(name = "t_erp_log")
public class ErpLog implements java.io.Serializable {

	// Fields

	private String id;
	private String loginUserId;
	private String loginClientIp;
	private Date opreateTime;
	private String opreateType;
	private String opreateInfo;

	// Constructors

	/** default constructor */
	public ErpLog() {
	}

	/** minimal constructor */
	public ErpLog(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpLog(String id, String loginUserId, String loginClientIp,
			Date opreateTime, String opreateType, String opreateInfo) {
		this.id = id;
		this.loginUserId = loginUserId;
		this.loginClientIp = loginClientIp;
		this.opreateTime = opreateTime;
		this.opreateType = opreateType;
		this.opreateInfo = opreateInfo;
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

	@Column(name = "LOGIN_USER_ID", length = 32)
	public String getLoginUserId() {
		return this.loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}

	@Column(name = "LOGIN_CLIENT_IP", length = 50)
	public String getLoginClientIp() {
		return this.loginClientIp;
	}

	public void setLoginClientIp(String loginClientIp) {
		this.loginClientIp = loginClientIp;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "OPREATE_TIME")
	public Date getOpreateTime() {
		return this.opreateTime;
	}

	public void setOpreateTime(Date opreateTime) {
		this.opreateTime = opreateTime;
	}

	@Column(name = "OPREATE_TYPE", length = 10)
	public String getOpreateType() {
		return this.opreateType;
	}

	public void setOpreateType(String opreateType) {
		this.opreateType = opreateType;
	}

	@Column(name = "OPREATE_INFO", length = 2000)
	public String getOpreateInfo() {
		return this.opreateInfo;
	}

	public void setOpreateInfo(String opreateInfo) {
		this.opreateInfo = opreateInfo;
	}

}