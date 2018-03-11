package com.bxs.common.vo;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * LayUI的表格返回值
 * 
 * @desc: bxs-common
 * @author: wyc
 * @createTime: 2018年2月8日 下午4:28:34
 * @history:
 * @version: v1.0
 */
public class LayUIGrid {

	private String msg;
	private String code;
	private Long count;
	private List<?> data = new ArrayList();

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

}
