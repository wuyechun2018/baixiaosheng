package com.bxs.pojo.jpa;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity(name = "t_biz_calendar")
public class BizCalendar {

	//主键
	private String id;
	//当前用户Id
	private String userId;
	//日期
	private Date bizDay;
	//业务状态
	private String bizState;
	//描述信息
	private String bizDesc;
	// 数据状态  0删除 1正常使用
	private String dataState;
	// 创建时间
	private Date createDate;
	// 更新时间
	private Date updateDate;
	
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@GeneratedValue(generator = "generator")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "USER_ID")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	@Column(name = "BIZ_DAY")
	public Date getBizDay() {
		return bizDay;
	}
	public void setBizDay(Date bizDay) {
		this.bizDay = bizDay;
	}
	
	@Column(name = "BIZ_STATE")
	public String getBizState() {
		return bizState;
	}
	public void setBizState(String bizState) {
		this.bizState = bizState;
	}
	@Column(name = "BIZ_DESC")
	public String getBizDesc() {
		return bizDesc;
	}
	
	public void setBizDesc(String bizDesc) {
		this.bizDesc = bizDesc;
	}
	
	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}
	
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	@Column(name = "CREATE_DATE")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	@Column(name = "UPDATE_DATE")
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
