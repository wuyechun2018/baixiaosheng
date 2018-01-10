package com.bxs.jdbc;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.User;

@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private  final static String ALL_LIST_SQL = "SELECT * FROM T_USER";

	public List<User> getUserList() {
		List<User> list = jdbcTemplate.query(ALL_LIST_SQL,new BeanPropertyRowMapper(User.class));
		return list;
	}
}
