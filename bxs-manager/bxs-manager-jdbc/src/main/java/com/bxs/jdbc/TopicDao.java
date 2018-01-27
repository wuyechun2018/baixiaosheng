package com.bxs.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.Topic;

@Repository
public class TopicDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 
	 * 根据父主键获取栏目数据
	 * @author: wyc
	 * @createTime: 2018年1月27日 上午11:05:34
	 * @history:
	 * @param pid
	 * @return List<Topic>
	 */
	public List<Topic> getListByPid(String pid) {
		String sql="SELECT * FROM t_topic T WHERE T.pid=?";
		List<Topic> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(Topic.class));
		return list;
	}

}
