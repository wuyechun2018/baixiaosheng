package com.bxs.common.dict;

/**
 * 
 * 数据状态
 * @desc: bxs-common
 * @author: wyc
 * @createTime: 2018年1月23日 上午9:06:35
 * @history:
 * @version: v1.0
 */
public enum DataState {
	
	Delete("0","删除"),
	
	Use("1","正常使用"),
	
	Locked("2","锁定");

	private String code;
	private String name;
	
	DataState(String code,String name){
		this.code=code;
		this.name=name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
