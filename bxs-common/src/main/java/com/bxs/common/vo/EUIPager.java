package com.bxs.common.vo;

public class EUIPager {
	
	public EUIPager(Integer page, Integer rows) {
		super();
		this.page = page;
		this.rows = rows;
	}

	public EUIPager() {
		super();
	}




	/**
	 * 当前页
	 */
	private Integer page=1;
	
	/**
	 * 每页条数
	 */
	private Integer rows=10;
	
	/**
	 * 开始记录
	 */
	private Integer start;
	
	/**
	 * 结束记录
	 */
	private Integer end;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getStart() {
		if(page<1){
			page=1;
		}
		//return (page-1)*rows+1;
		//MySQL分页时limit 从0开始
		//Oracle RNUM 从1开始，需注意
		return (page-1)*rows;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		if(page<1){
			page=1;
		}
		return page*rows;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

}
