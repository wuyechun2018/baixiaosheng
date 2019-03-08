package com.bxs.pojo.jpa.ierp;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

//@Entity
//@Table(name = "t_biz_account")
@Entity(name = "t_biz_account")
public class BizAccount implements java.io.Serializable {

	// Fields
    //主键
	private String id;
	//入账时间
	private Date accountDate;
	//入账人ID
	private String accountUserId;
	//入账事项
	private String accountItem;
	//入账类别 （0 收入 1支出）
	private String accountType;
	//金额
	private Double amount;
	//实际金额
	private Double actualAmount;
	//描述信息
	private String accountDesc;
	//创建人ID
	private String createUserId;
	//创建时间
	private Date createDate;
	//更新人ID
	private String updateUserId;
	//更新时间
	private Date updateDate;
	// 数据状态 0删除 1正常
	private String dataState;

	// Constructors

	/** default constructor */
	public BizAccount() {
	}

	/** minimal constructor */
	public BizAccount(String id) {
		this.id = id;
	}

	/** full constructor */
	public BizAccount(String id, Date accountDate, String accountUserId,
			String accountItem, String accountType, Double amount,
			Double actualAmount, String accountDesc, String createUserId,
			Date createDate, String updateUserId, Date updateDate,
			String dataState) {
		this.id = id;
		this.accountDate = accountDate;
		this.accountUserId = accountUserId;
		this.accountItem = accountItem;
		this.accountType = accountType;
		this.amount = amount;
		this.actualAmount = actualAmount;
		this.accountDesc = accountDesc;
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

	@Column(name = "ACCOUNT_DATE", length = 19)
	public Date getAccountDate() {
		return this.accountDate;
	}

	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}

	@Column(name = "ACCOUNT_USER_ID", length = 36)
	public String getAccountUserId() {
		return this.accountUserId;
	}

	public void setAccountUserId(String accountUserId) {
		this.accountUserId = accountUserId;
	}

	@Column(name = "ACCOUNT_ITEM", length = 200)
	public String getAccountItem() {
		return this.accountItem;
	}

	public void setAccountItem(String accountItem) {
		this.accountItem = accountItem;
	}

	@Column(name = "ACCOUNT_TYPE", length = 1)
	public String getAccountType() {
		return this.accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
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

	@Column(name = "ACCOUNT_DESC", length = 500)
	public String getAccountDesc() {
		return this.accountDesc;
	}

	public void setAccountDesc(String accountDesc) {
		this.accountDesc = accountDesc;
	}

	@Column(name = "CREATE_USER_ID", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Column(name = "CREATE_DATE", length = 19)
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

	@Column(name = "UPDATE_DATE", length = 19)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "DATA_STATE", length = 1)
	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}


	

}