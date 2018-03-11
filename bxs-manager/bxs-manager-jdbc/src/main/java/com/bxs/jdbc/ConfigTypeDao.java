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
import com.bxs.pojo.ConfigType;
import com.bxs.pojo.LinkType;

@Repository
public class ConfigTypeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<ConfigType> getListByPid(String pid) {
		String sql="SELECT * FROM t_config_type T WHERE T.DATA_STATE='1' AND T.pid=? ";
		List<ConfigType> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(ConfigType.class));
		return list;
	}

	
	/**
	 * 
	 * 更新链接类型
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午7:58:43
	 * @history:
	 * @param linkType void
	 */
	public void update(final ConfigType linkType) {
		String sql=	"UPDATE\n" +
						" t_link_type\n" + 
						"SET\n" + 
						"  pid = ?,\n" + 
						"  link_type_code = ?,\n" + 
						"  link_type_name =?,\n" + 
						"  link_type_desc = ?,\n" + 
						"  data_state = ?,\n" + 
						"  display_order = ?\n" + 
						"WHERE id = ?";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, linkType.getPid());
			         //ps.setString(2, linkType.getLinkTypeCode());
			         //ps.setString(3, linkType.getLinkTypeName());
			         //ps.setString(4, linkType.getLinkTypeDesc());
			         ps.setString(5, linkType.getDataState());
			         ps.setInt(6, linkType.getDisplayOrder());
			         ps.setString(7, linkType.getId());
			       }
			     }
			 );
		
	}

	/**
	 * 
	 * 保存链接类型
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午7:58:59
	 * @history:
	 * @param linkType void
	 */
	public void save(final ConfigType configType) {
		String sql="INSERT INTO t_link_type (\n" +
						"  id,\n" + 
						"  pid,\n" + 
						"  link_type_code,\n" + 
						"  link_type_name,\n" + 
						"  link_type_desc,\n" + 
						"  data_state,\n" + 
						"  display_order\n" + 
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
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         //ps.setString(2, linkType.getPid());
			         //ps.setString(3, linkType.getLinkTypeCode());
			        // ps.setString(4, linkType.getLinkTypeName());
			        // ps.setString(5, linkType.getLinkTypeDesc());
			        // ps.setString(6, linkType.getDataState());
			        // ps.setInt(7, linkType.getDisplayOrder());
			       }
			     }
			 );
		
	}
	
	/**
	 * 
	 * 删除
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午7:59:14
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE t_link_type SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}

}
