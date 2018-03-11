package com.bxs.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Config;

@Repository
public class ConfigDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 
	 * 获取条件筛选后的记录总数
	 * @author: wyc
	 * @createTime: 2018年1月28日 上午10:13:36
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_config_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}



	/**
	 * 
	 * 分页、条件 筛选列表
 	 * @author: wyc
	 * @createTime: 2018年1月28日 上午10:14:01
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerconfigList(EUIPager ePager,Map<String, Object> param) {
		String  querySql="SELECT * FROM V_config_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<Config> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(Config.class));
		return list;
	}


	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:33
	 * @history:
	 * @param config void
	 */
	public void update(final Config config) {
		String sql=	"UPDATE\n" +
						"  t_config\n" + 
						"SET\n" + 
						"config_type_id = ?,\n" + 
						"  config_name =  ?,\n" + 
						"  config_desc =  ?,\n" + 
						"  config_url =  ?,\n" + 
						"  config_image_url =  ?,\n" + 
						"  config_target_type =  ?,\n" + 
						"  data_state =  ?,\n" + 
						"  display_order =  ?\n" + 
						"WHERE id = ?";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         /*ps.setString(1, config.getconfigTypeId());
			         ps.setString(2, config.getconfigName());
			         ps.setString(3, config.getconfigDesc());
			         ps.setString(4, config.getconfigUrl());
			         ps.setString(5, config.getconfigImageUrl());
			         ps.setString(6, config.getconfigTargetType());*/
			         ps.setString(7, config.getDataState());
			         ps.setInt(8, config.getDisplayOrder());
			         ps.setString(9, config.getId());
			       }
			     }
			 );
	}


	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:44
	 * @history:
	 * @param config void
	 */
	public void save(final Config config) {
		String sql="INSERT INTO t_config (\n" +
						"  id,\n" + 
						"  config_type_id,\n" + 
						"  config_name,\n" + 
						"  config_desc,\n" + 
						"  config_url,\n" + 
						"  config_image_url,\n" + 
						"  config_target_type,\n" + 
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
						"    ?,\n" + 
						"    ?\n" + 
						"  )";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, config.getConfigTypeId());
			         ps.setString(3, config.getConfigName());
			        // ps.setString(4, config.getConfigDesc());
			        // ps.setString(5, config.getConfigUrl());
			       //  ps.setString(6, config.getConfigImageUrl());
			       //  ps.setString(7, config.getConfigTargetType());
			         ps.setString(8, config.getDataState());
			         ps.setInt(9, config.getDisplayOrder());
			       }
			     }
			 );
	}



	public void delete(String id) {
		String sql = "UPDATE t_config SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}
	
	

	/**
	 * 
	 * 根据查询参数生成查询语句
	 * @author: wyc
	 * @createTime: 2018年1月31日 下午4:35:08
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();

		//导航类型,1 代表全部
		if(param.get("configTypeId")!=null&&StringUtils.isNotBlank(param.get("configTypeId").toString())&&!"1".equals(param.get("configTypeId").toString())){
			sqlBuff.append(" AND T.config_TYPE_ID = '" + param.get("configTypeId").toString() + "'\n");
		}
		//导航类型Code
		if(param.get("configTypeCode")!=null&&StringUtils.isNotBlank(param.get("configTypeCode").toString())){
			sqlBuff.append(" AND  T.config_type_code = '"+param.get("configTypeCode").toString()+"' \n");
		}
		
		//链接名称
		if(param.get("configName")!=null&&StringUtils.isNotBlank(param.get("configName").toString())){
			sqlBuff.append(" AND  T.config_NAME LIKE '%"+param.get("configName").toString()+"%' \n");
		}
		
		//链接地址
		if(param.get("configUrl")!=null&&StringUtils.isNotBlank(param.get("configUrl").toString())){
			sqlBuff.append(" AND  T.config_URL LIKE '%"+param.get("configUrl").toString()+"%' \n");
		}
		sqlBuff.append(" ORDER BY DISPLAY_ORDER");
		
		return sqlBuff.toString();
	}

}
