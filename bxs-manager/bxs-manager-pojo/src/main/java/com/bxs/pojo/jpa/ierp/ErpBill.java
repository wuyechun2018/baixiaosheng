package com.bxs.pojo.jpa.ierp;
import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * TErpBill entity. @author MyEclipse Persistence Tools
 */
//@Entity
//@Table(name = "t_erp_bill")

@Entity(name = "t_erp_bill")
public class ErpBill implements java.io.Serializable {

	// Fields

	private String id;
	private Date billDate;
	private String billUserId;
	private String accountType;
	private String accountTypeItemId;
	private Double amount;
	private Double actualAmount;
	private String billDesc;
	private String bizStatus;
	private String createUserId;
	private Date createDate;
	private String updateUserId;
	private Date updateDate;
	private String dataState;

	// Constructors

	/** default constructor */
	public ErpBill() {
	}

	/** minimal constructor */
	public ErpBill(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpBill(String id, Date billDate, String billUserId,
			String accountType, String accountTypeItemId, Double amount,
			Double actualAmount, String billDesc, String bizStatus,
			String createUserId, Date createDate, String updateUserId,
			Date updateDate, String dataState) {
		this.id = id;
		this.billDate = billDate;
		this.billUserId = billUserId;
		this.accountType = accountType;
		this.accountTypeItemId = accountTypeItemId;
		this.amount = amount;
		this.actualAmount = actualAmount;
		this.billDesc = billDesc;
		this.bizStatus = bizStatus;
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

	@Column(name = "BILL_DATE", length = 19)
	public Date getBillDate() {
		return this.billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	@Column(name = "BILL_USER_ID", length = 36)
	public String getBillUserId() {
		return this.billUserId;
	}

	public void setBillUserId(String billUserId) {
		this.billUserId = billUserId;
	}

	@Column(name = "ACCOUNT_TYPE", length = 1)
	public String getAccountType() {
		return this.accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	@Column(name = "ACCOUNT_TYPE_ITEM_ID", length = 36)
	public String getAccountTypeItemId() {
		return this.accountTypeItemId;
	}

	public void setAccountTypeItemId(String accountTypeItemId) {
		this.accountTypeItemId = accountTypeItemId;
	}

	@Column(name = "AMOUNT")
	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Column(name = "ACTUAL_AMOUNT")
	public Double getActualAmount() {
		return this.actualAmount;
	}

	public void setActualAmount(Double actualAmount) {
		this.actualAmount = actualAmount;
	}

	@Column(name = "BILL_DESC", length = 500)
	public String getBillDesc() {
		return this.billDesc;
	}

	public void setBillDesc(String billDesc) {
		this.billDesc = billDesc;
	}

	@Column(name = "BIZ_STATUS", length = 1)
	public String getBizStatus() {
		return this.bizStatus;
	}

	public void setBizStatus(String bizStatus) {
		this.bizStatus = bizStatus;
	}

	@Column(name = "CREATE_USER_ID", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

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

	@Column(name = "UPDATE_DATE")
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "DATA_STATE", length = 1)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}