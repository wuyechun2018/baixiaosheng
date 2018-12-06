package com.bxs.common.vo;

public class DemoMsg {

	//数据返回状态
	private String status;
	//信息,可返回“成功”提示信息或者错误的异常信息
	private String msg;
	//数据内容
	private DemoData data;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public DemoData getData() {
		return data;
	}

	public void setData(DemoData data) {
		this.data = data;
	}

}
