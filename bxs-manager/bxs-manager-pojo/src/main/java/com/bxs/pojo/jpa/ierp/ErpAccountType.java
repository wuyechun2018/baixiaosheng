package com.bxs.pojo.jpa.ierp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 账单类别
 */
//@Entity
//@Table(name = "t_erp_account_type")

@Entity(name = "t_erp_account_type")
public class ErpAccountType implements java.io.Serializable {

	// Fields

	private String id;
	private String accountTypeCode;
	private String accountTypeName;
	//上级类别
	private String accountTypePid;
	//收入支出
	private String incomeExpense;
	private Integer displayOrder;
	private String dataState;
	//说明
	private String memo;

	// Constructors

	/** default constructor */
	public ErpAccountType() {
	}

	/** minimal constructor */
	public ErpAccountType(String id) {
		this.id = id;
	}

	/** full constructor */
	public ErpAccountType(String id, String accountTypeCode,
			String accountTypeName, String accountTypePid,
			String incomeExpense, Integer displayOrder, String dataState,
			String memo) {
		this.id = id;
		this.accountTypeCode = accountTypeCode;
		this.accountTypeName = accountTypeName;
		this.accountTypePid = accountTypePid;
		this.incomeExpense = incomeExpense;
		this.displayOrder = displayOrder;
		this.dataState = dataState;
		this.memo = memo;
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

	@Column(name = "ACCOUNT_TYPE_CODE", length = 50)
	public String getAccountTypeCode() {
		return this.accountTypeCode;
	}

	public void setAccountTypeCode(String accountTypeCode) {
		this.accountTypeCode = accountTypeCode;
	}

	@Column(name = "ACCOUNT_TYPE_NAME", length = 100)
	public String getAccountTypeName() {
		return this.accountTypeName;
	}

	public void setAccountTypeName(String accountTypeName) {
		this.accountTypeName = accountTypeName;
	}

	@Column(name = "ACCOUNT_TYPE_PID", length = 32)
	public String getAccountTypePid() {
		return this.accountTypePid;
	}

	public void setAccountTypePid(String accountTypePid) {
		this.accountTypePid = accountTypePid;
	}

	@Column(name = "INCOME_EXPENSE", length = 10)
	public String getIncomeExpense() {
		return this.incomeExpense;
	}

	public void setIncomeExpense(String incomeExpense) {
		this.incomeExpense = incomeExpense;
	}

	@Column(name = "DISPLAY_ORDER")
	public Integer getDisplayOrder() {
		return this.displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	@Column(name = "MEMO", length = 500)
	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}