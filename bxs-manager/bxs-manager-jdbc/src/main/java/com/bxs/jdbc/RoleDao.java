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
import com.bxs.pojo.Role;

@Repository
public class RoleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:44
	 * @history:
	 * @param post void
	 */
	public void save(final Role role) {
		 String insertSQL = "INSERT INTO t_role (\n" +
						 "  id,\n" + 
						 "  role_code,\n" + 
						 "  role_name,\n" + 
						 "  role_desc,\n" + 
						 "  data_state,\n" + 
						 "  create_date,\n" + 
						 "  update_date\n" + 
						 ")\n" + 
						 "VALUES\n" + 
						 "  (\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?\n" + 
						 "  )";

		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, role.getRoleCode());
			         ps.setString(3, role.getRoleName());
			         ps.setString(4, role.getRoleDesc());
			         ps.setString(5, role.getDataState());
			         ps.setTimestamp(6, new java.sql.Timestamp(role.getCreateDate().getTime()));
			         ps.setTimestamp(7, new java.sql.Timestamp(role.getUpdateDate().getTime()));
			       }
			     }
			 );
	}


	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午7:26:13
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE t_role SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}
	
	
	/**
	 * 
	 * 通过角色编码查询角色
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午7:53:25
	 * @history:
	 * @param roleCode
	 * @return Role
	 */
	public Role getRoleByCode(String roleCode) {
		List<Role> list = jdbcTemplate.query("SELECT * FROM T_ROLE T WHERE T.ROLE_CODE=?",new Object[]{roleCode},new BeanPropertyRowMapper(Role.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}
}
