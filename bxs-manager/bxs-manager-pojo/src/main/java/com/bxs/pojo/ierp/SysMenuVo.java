package com.bxs.pojo.ierp;

/**
 * 
 * 添加了该属性checked
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2019年4月18日 下午4:29:07
 * @history:
 * @version: v1.0
 */
public class SysMenuVo {

	// 主键
	private String id;
	// 父菜单ID
	private String pid;
	// 菜单名称
	private String menuName;
	// 菜单地址
	private String menuUrl;
	// 菜单类型
	private String menuType;
	// 排序
	private int displayOrder;
	// 数据状态,详情参考 com.bxs.common.dict.DataState
	private String dataState;
	
	//是否选中
	private String checked;
	
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
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
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
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
}
