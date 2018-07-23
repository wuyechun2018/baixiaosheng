package com.bxs.common.vo;

import java.util.Map;

public class ZTreeNode {

	private String id;
	private String pId;
	private String name;
	private boolean open;
	private boolean isParent;
	private Map attribute;
	private String title;
	
	
	
	
	public ZTreeNode(String id, String pId, String name, boolean isParent) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.isParent = isParent;
	}
	public ZTreeNode() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean getOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
	public Map getAttribute() {
		return attribute;
	}
	public void setAttribute(Map attribute) {
		this.attribute = attribute;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
}
