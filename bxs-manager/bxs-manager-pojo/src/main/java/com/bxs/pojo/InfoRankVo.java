package com.bxs.pojo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 信息排名实体类
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月1日 下午4:08:33
 * @history:
 * @version: v1.0
 */
public class InfoRankVo implements java.io.Serializable {

	// 主键
	private String id;
	// 统计年份
	private String statYear;
	// 部门主键
	private String deptId;
	// 部门名称
	private String deptName;
	// 部门统计数
	private int bumen;
	// 支队统计数
	private int zhidui;
	// 市局
	private int shiju;
	// 总队
	private int zongdui;
	// 省队
	private int shengdui;
	// 部局
	private int buju;
	// 创建人Id
	private String createUserId;
	// 创建时间
	private Date createDate;
	// 更新人
	private String updateUserId;
	// 更新时间
	private Date updateDate;
	// 显示状态
	private String showState;
	// 数据状态
	private String dataState;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatYear() {
		return statYear;
	}

	public void setStatYear(String statYear) {
		this.statYear = statYear;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getBumen() {
		return bumen;
	}

	public void setBumen(int bumen) {
		this.bumen = bumen;
	}

	public int getZhidui() {
		return zhidui;
	}

	public void setZhidui(int zhidui) {
		this.zhidui = zhidui;
	}

	public int getShiju() {
		return shiju;
	}

	public void setShiju(int shiju) {
		this.shiju = shiju;
	}

	public int getZongdui() {
		return zongdui;
	}

	public void setZongdui(int zongdui) {
		this.zongdui = zongdui;
	}

	public int getShengdui() {
		return shengdui;
	}

	public void setShengdui(int shengdui) {
		this.shengdui = shengdui;
	}

	public int getBuju() {
		return buju;
	}

	public void setBuju(int buju) {
		this.buju = buju;
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

	public String getShowState() {
		return showState;
	}

	public void setShowState(String showState) {
		this.showState = showState;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}