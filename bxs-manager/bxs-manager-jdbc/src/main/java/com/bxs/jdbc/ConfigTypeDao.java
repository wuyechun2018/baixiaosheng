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

@Repository
public class ConfigTypeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 根据父主键获取配置类型
	 * @author: wyc
	 * @createTime: 2018年3月12日 上午8:57:11
	 * @history:
	 * @param pid
	 * @return List<ConfigType>
	 */
	public List<ConfigType> getListByPid(String pid) {
		String sql="SELECT * FROM t_config_type T WHERE T.DATA_STATE='1' AND T.CONFIG_VALUE_TYPE<>'3' AND T.pid=? ";
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
						"  t_config_type\n" + 
						"SET\n" + 
						"  pid = ?,\n" + 
						"  config_type_code = ?,\n" + 
						"  config_type_name = ?,\n" + 
						"  config_value_type = ?,\n" + 
						"  config_type_desc = ?,\n" + 
						"  data_state = ?,\n" + 
						"  display_order = ?\n" + 
						"WHERE id = ?";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, linkType.getPid());
			         ps.setString(2, linkType.getConfigTypeCode());
			         ps.setString(3, linkType.getConfigTypeName());
			         ps.setString(4, linkType.getConfigValueType());
			         ps.setString(5, linkType.getConfigTypeDesc());
			         ps.setString(6, linkType.getDataState());
			         ps.setInt(7, linkType.getDisplayOrder());
			         ps.setString(8, linkType.getId());
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
		String sql="INSERT INTO t_config_type (\n" +
						"  id,\n" + 
						"  pid,\n" + 
						"  config_type_code,\n" + 
						"  config_type_name,\n" + 
						"  config_value_type,\n" + 
						"  config_type_desc,\n" + 
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
						"    ?,\n" + 
						"    ?\n" + 
						"  )";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, configType.getPid());
			         ps.setString(3, configType.getConfigTypeCode());
			         ps.setString(4, configType.getConfigTypeName());
			         ps.setString(5, configType.getConfigValueType());
			         ps.setString(6, configType.getConfigTypeDesc());
			         ps.setString(7, configType.getDataState());
			         ps.setInt(8, configType.getDisplayOrder());
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
		String sql = "UPDATE t_config_type SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}


	public List<ConfigType> getListByPidAndValueType(String pid, String valueType) {
		String sql="SELECT * FROM t_config_type T WHERE T.DATA_STATE='1' AND T.pid=? AND (t.id=1 OR T.config_value_type= ? )";
		List<ConfigType> list = jdbcTemplate.query(sql,new Object[]{pid,valueType},new BeanPropertyRowMapper(ConfigType.class));
		return list;
	}

}
