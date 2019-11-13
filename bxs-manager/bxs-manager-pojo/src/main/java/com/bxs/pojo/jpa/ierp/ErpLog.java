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
	private Date operateTime;
	private String operateType;
	private String bizId;
	private String operateInfo;

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
			Date operateTime, String operateType, String operateInfo) {
		this.id = id;
		this.loginUserId = loginUserId;
		this.loginClientIp = loginClientIp;
		this.operateTime = operateTime;
		this.operateType = operateType;
		this.operateInfo = operateInfo;
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
	@Column(name = "OPERATE_TIME")
	public Date getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Column(name = "OPERATE_TYPE", length = 10)
	public String getOperateType() {
		return this.operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	
	
	@Column(name = "BIZ_ID", length = 32)
	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	@Column(name = "OPERATE_INFO", length = 2000)
	public String getOperateInfo() {
		return this.operateInfo;
	}

	public void setOperateInfo(String operateInfo) {
		this.operateInfo = operateInfo;
	}

}