package com.bxs.pojo;

/**
 * 
 * 飘窗配置表
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年4月9日 下午6:32:05
 * @history:
 * @version: v1.0
 */
public class FloatWin {
	// 主键
	private String id;
	//窗口名称
	private String winName;
	//窗口描述
	private String winDesc;
	//链接地址
	private String linkUrl;
	// 链接打开窗口方式
	private String linkTargetType;
	// 配图地址
	private String linkImageUrl;
	// 排序
    private int displayOrder;
    //显示状态（0：不显示 1：显示）
    private String showState;
	// 数据状态（0：删除 1：正常）
	private String dataState;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWinName() {
		return winName;
	}
	public void setWinName(String winName) {
		this.winName = winName;
	}
	public String getWinDesc() {
		return winDesc;
	}
	public void setWinDesc(String winDesc) {
		this.winDesc = winDesc;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getLinkTargetType() {
		return linkTargetType;
	}
	public void setLinkTargetType(String linkTargetType) {
		this.linkTargetType = linkTargetType;
	}
	public String getLinkImageUrl() {
		return linkImageUrl;
	}
	public void setLinkImageUrl(String linkImageUrl) {
		this.linkImageUrl = linkImageUrl;
	}
	public int getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
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
