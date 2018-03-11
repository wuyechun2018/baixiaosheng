package com.bxs.common.vo;

/**
 * 
 * EasyUI的下拉框实体类
 * @desc: bxs-common
 * @author: wyc
 * @createTime: 2018年1月30日 上午9:36:31
 * @history:
 * @version: v1.0
 */
public class EUICombobox {
	
	private String id;
	
	private String text;
	

	public EUICombobox(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}

	public EUICombobox() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
