package com.bxs.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.jpa.BizNode;

@Repository
public class BizNodeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean isParent(String typeCode, String pid) {
		String sql="SELECT * FROM t_biz_node T WHERE T.DATA_STATE='1' AND T.TYPE_CODE=? AND t.PID=?;";
		List<BizNode> list = jdbcTemplate.query(sql,new Object[]{typeCode,pid},new BeanPropertyRowMapper(BizNode.class));
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

}
