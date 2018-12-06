package com.bxs.common.vo;

import java.util.List;

public class DemoData<T> {
	
	//数据筛选后的总量，只做时间段筛选。如：昨天一共产生168条数据，则返回168。
	private String total;
	//经过分页后的数据内容,为数据对象的列表，即List<Object>。如：pageNo为1，pageSize为20，则此处返回20条数据。
	private List<T> rows;

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
