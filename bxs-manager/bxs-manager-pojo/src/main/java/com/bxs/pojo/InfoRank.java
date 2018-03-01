package com.bxs.pojo;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 信息排名实体类
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年3月1日 下午4:08:33
 * @history:
 * @version: v1.0
 */
@Entity
@Table(name = "t_info_rank")
public class InfoRank implements java.io.Serializable {

	//主键
	private String id;
	//统计年份
	private String statYear;
	//部门主键
	private String deptId;
	//部门统计数
	private int bumen;
	//支队统计数
	private int zhidui;
	//市局
	private int shiju;
	//总队
	private int zongdui;
	//省队
	private int shengdui;
	//部局
	private int buju;
	//创建人Id
	private String createUserId;
	//创建时间
	private Date createDate;
	//更新人
	private String updateUserId;
	//更新时间
	private Date updateDate;
	//显示状态
	private String showState;
	//数据状态
	private String dataState;

	// Constructors

	/** default constructor */
	public InfoRank() {
	}

	/** minimal constructor */
	public InfoRank(String id) {
		this.id = id;
	}

	
	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "stat_year", length = 10)
	public String getStatYear() {
		return this.statYear;
	}

	public void setStatYear(String statYear) {
		this.statYear = statYear;
	}
	
	@Column(name = "dept_id", length = 10)
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	@Column(name = "bumen", length = 10)
	public int getBumen() {
		return bumen;
	}

	public void setBumen(int bumen) {
		this.bumen = bumen;
	}

	@Column(name = "zhidui")
	public int getZhidui() {
		return this.zhidui;
	}

	public void setZhidui(int zhidui) {
		this.zhidui = zhidui;
	}

	@Column(name = "shiju")
	public int getShiju() {
		return this.shiju;
	}

	public void setShiju(int shiju) {
		this.shiju = shiju;
	}

	@Column(name = "zongdui")
	public int getZongdui() {
		return this.zongdui;
	}

	public void setZongdui(int zongdui) {
		this.zongdui = zongdui;
	}

	@Column(name = "shengdui")
	public int getShengdui() {
		return this.shengdui;
	}

	public void setShengdui(int shengdui) {
		this.shengdui = shengdui;
	}

	@Column(name = "buju")
	public int getBuju() {
		return this.buju;
	}

	public void setBuju(int buju) {
		this.buju = buju;
	}

	@Column(name = "create_user_id", length = 36)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "update_user_id", length = 36)
	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	@Column(name = "update_date")
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "show_state", length = 10)
	public String getShowState() {
		return this.showState;
	}

	public void setShowState(String showState) {
		this.showState = showState;
	}

	@Column(name = "data_state", length = 10)
	public String getDataState() {
		return this.dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

}