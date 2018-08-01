package com.bxs.pojo.jpa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	//主键
	private String id;
	// 父节点Id
	private String pid;
	//节点编码
	private String bizNodeCode;
	// 节点名称（不可以用nodeName,nodeName在jquery中已经有使用了，关键词冲突了，可以查看nodeValue、nodeType等。）
	private String bizNodeName;
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

	@Column(name = "PID", length = 32)
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}


	@Column(name = "TYPE_CODE", length = 50)
	public String getTypeCode() {
		return typeCode;
	}

	
	@Column(name = "BIZ_NODE_CODE", length = 100)
	public String getBizNodeCode() {
		return bizNodeCode;
	}

	public void setBizNodeCode(String bizNodeCode) {
		this.bizNodeCode = bizNodeCode;
	}

	@Column(name = "BIZ_NODE_NAME", length = 200)
	public String getBizNodeName() {
		return bizNodeName;
	}

	public void setBizNodeName(String bizNodeName) {
		this.bizNodeName = bizNodeName;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	@Column(name = "TYPE_NAME", length = 100)
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	@Column(name = "NODE_DESC", length = 500)
	public String getNodeDesc() {
		return nodeDesc;
	}

	public void setNodeDesc(String nodeDesc) {
		this.nodeDesc = nodeDesc;
	}

	@Column(name = "DATA_STATE", length = 10)
	public String getDataState() {
		return dataState;
	}

	
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	
	/**
	 * 数据库的字段类型有date、time、datetime 而Temporal注解的作用就是帮Java的Date类型进行格式化，一共有三种注解值：
	 * 第一种：@Temporal(TemporalType.DATE)——>实体类会封装成日期“yyyy-MM-dd”的 Date类型。
　　	   * 　第二种：@Temporal(TemporalType.TIME)——>实体类会封装成时间“hh-MM-ss”的 Date类型。
	 * 第三种：@Temporal(TemporalType.TIMESTAMP)——>实体类会封装成完整的时间“yyyy-MM-dd hh:MM:ss”的 Date类型。
　          * 注解方式有两种：1)写在字段上 2)写在 getXxx方法上
　          */
	
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
