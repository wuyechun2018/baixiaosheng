package com.bxs.jdbc;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.SignArticleInfoVo;
import com.bxs.pojo.UserRole;

@Repository
public class UserRoleDao {
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
	public void save(final UserRole userRole) {
		 String insertSQL = "INSERT INTO t_user_role (\n" +
						 "  id,\n" + 
						 "  user_id,\n" + 
						 "  role_id,\n" + 
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
						 "    ?\n" + 
						 "  ) ";


 jdbcTemplate.execute(insertSQL,
	     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
	       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
	         ps.setString(1, UUID.randomUUID().toString());
	         ps.setString(2, userRole.getUserId());
	         ps.setString(3, userRole.getRoleId());
	         ps.setString(4, userRole.getDataState());
	         ps.setTimestamp(5, new java.sql.Timestamp(userRole.getCreateDate().getTime()));
	         ps.setTimestamp(6, new java.sql.Timestamp(userRole.getUpdateDate().getTime()));
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
		String sql = "UPDATE t_user_role SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}
	
	
	/**
	 * 
	 * 根据用户id和角色Id删除
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午7:50:17
	 * @history:
	 * @param userId
	 * @param roleId void
	 */
	public void delete(String userId,String roleId) {
		String sql = "UPDATE t_user_role SET DATA_STATE=? WHERE USER_ID=? AND ROLE_ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),userId,roleId});
	}


	public void update(UserRole userRole) {
		// TODO Auto-generated method stub
		
	}


	public List<UserRole> findByUserIdAndRoleCode(String userId, String roleCode) {
		String sql="SELECT * FROM t_user_role T WHERE DATA_STATE='1' AND t.user_id =? AND t.role_id=(SELECT id FROM t_role s WHERE s.role_code=?)";
		List<UserRole> list = jdbcTemplate.query(sql,new Object[]{userId,roleCode},new BeanPropertyRowMapper(UserRole.class));
		return list;
	}


	/**
	 * 
	 * 获取用户授权的角色数量
	 * @author: wyc
	 * @createTime: 2018年4月3日 上午9:50:20
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getAuthorizedTotalCount(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT COUNT(1) FROM t_role T WHERE T.ID \n");
		return  jdbcTemplate.queryForObject(sqlBuff.toString(),Long.class);
	}


	/**
	 * 
	 * 获取用户授权的角色列表
	 * @author: wyc
	 * @createTime: 2018年4月3日 上午10:03:26
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerAuthorizedList(EUIPager ePager, Map<String, Object> param) {
		return null;
	}
}
