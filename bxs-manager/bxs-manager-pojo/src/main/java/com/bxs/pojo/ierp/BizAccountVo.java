package com.bxs.pojo.ierp;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BizAccountVo {
	
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
	
	//入账人姓名
	private String accountUserName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	public Date getAccountDate() {
		return accountDate;
	}

	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}

	public String getAccountUserId() {
		return accountUserId;
	}

	public void setAccountUserId(String accountUserId) {
		this.accountUserId = accountUserId;
	}

	public String getAccountItem() {
		return accountItem;
	}

	public void setAccountItem(String accountItem) {
		this.accountItem = accountItem;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
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

	public String getAccountDesc() {
		return accountDesc;
	}

	public void setAccountDesc(String accountDesc) {
		this.accountDesc = accountDesc;
	}

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

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")  
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

	public String getAccountUserName() {
		return accountUserName;
	}

	public void setAccountUserName(String accountUserName) {
		this.accountUserName = accountUserName;
	}
}
