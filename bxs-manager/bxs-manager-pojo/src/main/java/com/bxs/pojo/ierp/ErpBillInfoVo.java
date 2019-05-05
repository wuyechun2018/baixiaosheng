package com.bxs.pojo.ierp;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ErpBillInfoVo {

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
	private String billUserName;
	private String accountItem;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getBillDate() {
		return billDate;
	}

	@JsonFormat(pattern="yyyy-MM-dd")  
	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public String getBillUserId() {
		return billUserId;
	}

	public void setBillUserId(String billUserId) {
		this.billUserId = billUserId;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountTypeItemId() {
		return accountTypeItemId;
	}

	public void setAccountTypeItemId(String accountTypeItemId) {
		this.accountTypeItemId = accountTypeItemId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(Double actualAmount) {
		this.actualAmount = actualAmount;
	}

	public String getBillDesc() {
		return billDesc;
	}

	public void setBillDesc(String billDesc) {
		this.billDesc = billDesc;
	}

	public String getBizStatus() {
		return bizStatus;
	}

	public void setBizStatus(String bizStatus) {
		this.bizStatus = bizStatus;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public String getBillUserName() {
		return billUserName;
	}

	public void setBillUserName(String billUserName) {
		this.billUserName = billUserName;
	}

	public String getAccountItem() {
		return accountItem;
	}

	public void setAccountItem(String accountItem) {
		this.accountItem = accountItem;
	}

}
