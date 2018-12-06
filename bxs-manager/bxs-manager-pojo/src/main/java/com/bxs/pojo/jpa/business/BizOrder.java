package com.bxs.pojo.jpa.business;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	// 名称
	private String bizOrderName;
	
		//主键
		private String id;
		//说明，备注
		private String bizDesc;
		// 排序
		private int displayOrder;
		// 数据状态
		private String dataState;
		// 创建时间
		private Date createDate;
		// 创建人Id
		private String createUserId;
		// 更新时间
		private Date updateDate;
		// 更新人Id
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
		
		@Column(name = "BIZ_DESC", length = 500)
		public String getBizDesc() {
			return bizDesc;
		}

		public void setBizDesc(String bizDesc) {
			this.bizDesc = bizDesc;
		}

		@Column(name = "DISPLAY_ORDER", length = 10)
		public int getDisplayOrder() {
			return displayOrder;
		}

		public void setDisplayOrder(int displayOrder) {
			this.displayOrder = displayOrder;
		}

		@Column(name = "DATA_STATE", length = 10)
		public String getDataState() {
			return dataState;
		}

		public void setDataState(String dataState) {
			this.dataState = dataState;
		}

		@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
		@Column(name = "CREATE_DATE")
		public Date getCreateDate() {
			return createDate;
		}

		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}

		@Column(name = "CREATE_USER_ID", length = 32)
		public String getCreateUserId() {
			return createUserId;
		}

		public void setCreateUserId(String createUserId) {
			this.createUserId = createUserId;
		}

		@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
		@Column(name = "UPDATE_DATE")
		public Date getUpdateDate() {
			return updateDate;
		}

		public void setUpdateDate(Date updateDate) {
			this.updateDate = updateDate;
		}

		@Column(name = "UPDATE_USER_ID", length = 32)
		public String getUpdateUserId() {
			return updateUserId;
		}

		public void setUpdateUserId(String updateUserId) {
			this.updateUserId = updateUserId;
		}

}
