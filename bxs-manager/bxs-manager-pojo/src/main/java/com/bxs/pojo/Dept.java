package com.bxs.pojo;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * 文章栏目 实体类
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年1月27日 上午10:59:34
 * @history:
 * @version: v1.0
 */
@Entity
@Table(name = "t_dept")
public class Dept {
	// 主键
	private String id;
	//主键ID
	private String pid;
	//部门编码
	private String deptCode;
	//部门名称
	private String deptName;
	//部门类型
	private String deptType;
	//部门描述
	private String deptDesc;
	// 排序
	private int displayOrder;
	// 数据状态,详情参考 com.bxs.common.dict.DataState
	private String dataState;
	
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
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptType() {
		return deptType;
	}
	public void setDeptType(String deptType) {
		this.deptType = deptType;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public int getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	public String getDataState() {
		return dataState;
	}
	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}
