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
import com.bxs.pojo.Dept;

@Repository
public class DeptDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 
	 * 根据父主键获取部门数据
	 * @author: wyc
	 * @createTime: 2018年1月27日 上午11:05:34
	 * @history:
	 * @param pid
	 * @return List<Topic>
	 */
	public List<Dept> getListByPid(String pid) {
		String sql="SELECT * FROM t_dept T WHERE T.pid=? AND DATA_STATE='1' ORDER BY T.DISPLAY_ORDER";
		List<Dept> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(Dept.class));
		return list;
	}

	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:18:14
	 * @history:
	 * @param topic void
	 */
	public void update(final Dept dept) {
		String sql="UPDATE t_dept t SET t.pid=?,t.dept_name=?,dept_code=?,dept_type=?,dept_desc=?,data_state=?,display_order=? \n"
				+"WHERE  t.id=?";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, dept.getPid());
			         ps.setString(2, dept.getDeptName());
			         ps.setString(3, dept.getDeptCode());
			         ps.setString(4, dept.getDeptType());
			         ps.setString(5, dept.getDeptDesc());
			         ps.setString(6, dept.getDataState());
			         ps.setInt(7, dept.getDisplayOrder());
			         ps.setString(8, dept.getId());
			       }
			     }
			 );
	}

	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:15:42
	 * @history:
	 * @param topic void
	 */
	public void save(final Dept dept) {
		 String insertSQL = "INSERT INTO t_dept(id,pid,dept_name,dept_code,dept_type,dept_desc,data_state,display_order)\n"
				 +"VALUES(?,?,?,?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, dept.getPid());
			         ps.setString(3, dept.getDeptName());
			         ps.setString(4, dept.getDeptCode());
			         ps.setString(5, dept.getDeptType());
			         ps.setString(6, dept.getDeptDesc());
			         ps.setString(7, dept.getDataState());
			         ps.setInt(8, dept.getDisplayOrder());
			       }
			     }
			 );
		
	}

	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:50:26
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE t_dept SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}
}
