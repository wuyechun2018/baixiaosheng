package com.bxs.pojo.jpa.business;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * 订单
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年10月8日 下午2:20:48
 * @history:
 * @version: v1.0
 */

@Entity(name = "t_biz_order")
public class BizOrder {

	//主键
	private String id;
	// 名称
	private String bizOrderName;
	//数据状态
	private String dataState;
	// 创建时间
	private Date createDate;
	//创建人Id
	private String createUserId;
	// 更新时间
	private Date updateDate;
	//更新人Id
	private String updateUserId;
		
	
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
	
	@Column(name = "BIZ_ORDER_NAME", length = 100)
	public String getBizOrderName() {
		return bizOrderName;
	}
	public void setBizOrderName(String bizOrderName) {
		this.bizOrderName = bizOrderName;
	}
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

}
