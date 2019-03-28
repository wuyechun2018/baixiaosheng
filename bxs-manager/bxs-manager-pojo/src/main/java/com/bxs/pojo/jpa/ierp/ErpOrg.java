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

/**
 * TErpOrg entity. @author MyEclipse Persistence Tools
 */
@Entity(name = "t_erp_org")
public class ErpOrg implements java.io.Serializable {

	// Fields

	private String id;
	private String orgCode;
	private String orgName;
	//上级公司Id
	private String parentOrgId;
	//联系地址
	private String contactAddress;
	private String contactUserId;
	private String contactMobile;
	private String contactEmail;
	//负责人Id
	private String orgLeaderId;
	
	// 排序
	private int displayOrder;
	
	//部门描述
	private String orgDesc;
	
	private String createUserId;
	private Date createDate;
	private String updateUserId;
	private Date updateDate;
	private String dataState;

	// Constructors

	/** default constructor */
	public ErpOrg() {
	}

	/** minimal constructor */
	public ErpOrg(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpOrg(String id, String orgCode, String parentOrgId,
			String contactAddress, String contactUserId, String contactMobile,
			String contactEmail, String orgLeaderId, String createUserId,
			Date createDate, String updateUserId, Date updateDate,
			String dataState) {
		this.id = id;
		this.orgCode = orgCode;
		this.parentOrgId = parentOrgId;
		this.contactAddress = contactAddress;
		this.contactUserId = contactUserId;
		this.contactMobile = contactMobile;
		this.contactEmail = contactEmail;
		this.orgLeaderId = orgLeaderId;
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

	@Column(name = "ORG_CODE", length = 50)
	public String getOrgCode() {
		return this.orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	
	
	@Column(name = "ORG_NAME", length =100)
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	@Column(name = "PARENT_ORG_ID", length = 36)
	public String getParentOrgId() {
		return this.parentOrgId;
	}

	public void setParentOrgId(String parentOrgId) {
		this.parentOrgId = parentOrgId;
	}

	@Column(name = "CONTACT_ADDRESS", length = 200)
	public String getContactAddress() {
		return this.contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	@Column(name = "CONTACT_USER_ID", length = 36)
	public String getContactUserId() {
		return this.contactUserId;
	}

	public void setContactUserId(String contactUserId) {
		this.contactUserId = contactUserId;
	}

	@Column(name = "CONTACT_MOBILE", length = 50)
	public String getContactMobile() {
		return this.contactMobile;
	}

	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}

	@Column(name = "CONTACT_EMAIL", length = 50)
	public String getContactEmail() {
		return this.contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	@Column(name = "ORG_LEADER_ID", length = 36)
	public String getOrgLeaderId() {
		return this.orgLeaderId;
	}

	public void setOrgLeaderId(String orgLeaderId) {
		this.orgLeaderId = orgLeaderId;
	}

	@Column(name = "CREATE_USER_ID", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_DATE", length = 10)
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
	@Column(name = "UPDATE_DATE", length = 10)
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

	@Column(name = "DISPLAY_ORDER", length = 10)
	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	@Column(name = "ORG_DESC", length = 1000)
	public String getOrgDesc() {
		return orgDesc;
	}

	public void setOrgDesc(String orgDesc) {
		this.orgDesc = orgDesc;
	}
	
	
	
	

}