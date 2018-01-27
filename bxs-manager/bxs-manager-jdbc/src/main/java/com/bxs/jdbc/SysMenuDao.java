package com.bxs.jdbc;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.SysMenu;

@Repository
public class SysMenuDao {
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<SysMenu> getListByPid(String pid) {
		
		String sql="SELECT * FROM t_menu T WHERE T.pid=?";
		//经验总结：数据出现错误时，比如display_order字段为空时，解析为对象列表会出现错误，可以先解析成List<Map<String, Object>>,进行排错。
		//List<Map<String, Object>> menuList=jdbcTemplate.queryForList(sql, new Object[]{pid});
		List<SysMenu> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(SysMenu.class));
		return list;
	}

}
