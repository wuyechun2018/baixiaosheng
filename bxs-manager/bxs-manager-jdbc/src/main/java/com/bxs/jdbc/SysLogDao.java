package com.bxs.jdbc;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.SysLog;

/**
 * 
 * 
 * @desc: bxs-manager-jdbc
 * @author: wyc
 * @createTime: 2018年6月26日 下午5:29:20
 * @history:
 * @version: v1.0
 */
@Repository
public class SysLogDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 
	 * 保存操作日志
	 * @author: wyc
	 * @createTime: 2018年6月27日 上午10:46:23
	 * @history:
	 * @param sysLog void
	 */
	public void save(final SysLog sysLog) {
		String sql="INSERT INTO t_sys_log(id,op_user_id,biz_id,model_name,op_type,op_time,client_IP,op_desc)VALUES(?,?,?,?,?,?,?,?)";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, sysLog.getOpUserId());
			         ps.setString(3, sysLog.getBizId());
			         ps.setString(4, sysLog.getModelName());
			         ps.setString(5, sysLog.getOpType());
			         ps.setTimestamp(6, new java.sql.Timestamp(sysLog.getOpTime().getTime()));
			         ps.setString(7, sysLog.getClientIp());
			         ps.setString(8, sysLog.getOpDesc());
			       }
			     }
			 );
		
	}
	
	

}
