package com.bxs.jdbc;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.common.dict.DataState;
import com.bxs.pojo.Article;
import com.bxs.pojo.SysUser;

@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private  final static String ALL_LIST_SQL = "SELECT * FROM T_USER WHERE DATA_STATE='1'";

	public List<SysUser> getUserList() {
		List<SysUser> list = jdbcTemplate.query(ALL_LIST_SQL,new BeanPropertyRowMapper(SysUser.class));
		return list;
	}

	

	/**
	 * 
	 * 保存用户信息
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午4:52:32
	 * @history:
	 * @param user void
	 */
	public void save(final SysUser user) {
		 String insertSQL = "INSERT INTO T_USER (id, login_name, login_password, login_time,data_state) VALUES(?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, user.getLoginName());
			         ps.setString(3, user.getLoginPassword());
			         ps.setTimestamp(4, new java.sql.Timestamp(user.getLoginTime().getTime()));
			         ps.setString(5, user.getDataState());
			       }
			     }
			 );
		
	}
	
	/**
	 * 
	 * 更新系统用户
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午4:52:43
	 * @history:
	 * @param user void
	 */
	public void update(final SysUser user) {
		String insertSQL = "UPDATE T_USER SET login_name=?,login_password=?,login_time=?,data_state=? WHERE ID=?";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			    	 ps.setString(1, user.getLoginName());
				     ps.setString(2, user.getLoginPassword());
				     ps.setTimestamp(3, new java.sql.Timestamp(user.getLoginTime().getTime()));
				     ps.setString(4, user.getDataState());
				     ps.setString(5, user.getId());
			       }
			     }
			 );
		
	}



	/**
	 * 
	 * 根据ID查询用户信息
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午5:40:08
	 * @history:
	 * @param id
	 * @return User
	 */
	public SysUser findOne(String id) {
		List<SysUser> list = jdbcTemplate.query("SELECT * FROM T_USER WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(SysUser.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}



	/**
	 * 
	 * 逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午9:55:49
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE T_USER SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}
	
	
}
