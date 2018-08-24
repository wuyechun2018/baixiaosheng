package com.bxs.pojo.jpa;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * 业务节点扩展属性
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年7月16日 上午11:01:32
 * @history:
 * @version: v1.0
 */

@Entity(name = "t_biz_node_extend")
public class BizNodeExtend {

	private String id;
	// 基本节点Id,对应BizNode表的Id字段
	private String mainNodeId;

	// 1 Txt 2 超链接
	private String attrType;

	// 扩展属性编码
	private String attrKey;

	// 扩展属性值
	private String attrValue;
	
	// 排序值
	private int displayOrder;
	
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

	@Column(name = "MAIN_NODE_ID", length = 32)
	public String getMainNodeId() {
		return mainNodeId;
	}

	public void setMainNodeId(String mainNodeId) {
		this.mainNodeId = mainNodeId;
	}

	@Column(name = "ATTR_TYPE", length = 50)
	public String getAttrType() {
		return attrType;
	}

	public void setAttrType(String attrType) {
		this.attrType = attrType;
	}

	@Column(name = "ATTR_KEY", length = 100)
	public String getAttrKey() {
		return attrKey;
	}

	public void setAttrKey(String attrKey) {
		this.attrKey = attrKey;
	}

	@Column(name = "ATTR_VALUE", length = 500)
	public String getAttrValue() {
		return attrValue;
	}

	public void setAttrValue(String attrValue) {
		this.attrValue = attrValue;
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
