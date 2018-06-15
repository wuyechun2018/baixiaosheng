package com.bxs.jdbc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.BizWf;

@Repository
public class BizWfDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年6月13日 下午5:34:34
	 * @history:
	 * @param wfObj void
	 * @return 
	 */
	public String save(BizWf wfObj) {
		return null;
		
	}

}
