package com.bxs.pojo.jpa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * 业务节点基本属性
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年7月16日 上午10:59:19
 * @history:
 * @version: v1.0
 */
// @Entity
// @Table(name = "t_biz_node")

@Entity(name = "t_biz_node")
public class BizNode implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	// 节点名称
	private String nodeName;
	// 父节点Id
	private String pid;

	// 业务类型编码
	private String typeCode;
	// 业务类型名称
	private String typeName;
	// 简介
	private String nodeDesc;
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getNodeDesc() {
		return nodeDesc;
	}

	public void setNodeDesc(String nodeDesc) {
		this.nodeDesc = nodeDesc;
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	
	
}
