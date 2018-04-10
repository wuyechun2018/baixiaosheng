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
import com.bxs.pojo.FloatWin;
import com.bxs.pojo.LinkInfoVo;

@Repository
public class FloatWinDao {
	
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
		String sql="SELECT COUNT(1) FROM t_float_win T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
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
	public List<?> pagerList(EUIPager ePager,Map<String, Object> param) {
		String  querySql="SELECT * FROM t_float_win T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<FloatWin> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(FloatWin.class));
		return list;
	}


	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:33
	 * @history:
	 * @param link void
	 */
	public void update(final FloatWin floatWin) {
		String sql=	"UPDATE\n" +
						"  t_float_win\n" + 
						"SET\n" + 
						"  win_name =  ?,\n" + 
						"  win_desc =  ?,\n" + 
						"  link_url =  ?,\n" + 
						"  link_target_type =  ?,\n" + 
						"  link_image_url =  ?,\n" + 
						"  display_order =  ?,\n" + 
						"  show_state =  ?,\n" + 
						"  data_state =  ?\n" + 
						"WHERE id = ?";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, floatWin.getWinName());
			         ps.setString(2, floatWin.getWinDesc());
			         ps.setString(3, floatWin.getLinkUrl());
			         ps.setString(4, floatWin.getLinkTargetType());
			         ps.setString(5, floatWin.getLinkImageUrl());
			         ps.setInt(6, floatWin.getDisplayOrder());
			         ps.setString(7, floatWin.getShowState());
			         ps.setString(8, floatWin.getDataState());
			         ps.setString(9, floatWin.getId());
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
	 * @param link void
	 */
	public void save(final FloatWin floatWin) {
		String sql="INSERT INTO t_float_win (\n" +
						"  id,\n" + 
						"  win_name,\n" + 
						"  win_desc,\n" + 
						"  link_url,\n" + 
						"  link_target_type,\n" + 
						"  link_image_url,\n" + 
						"  display_order,\n" + 
						"  show_state,\n" + 
						"  data_state\n" + 
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
			         ps.setString(2, floatWin.getWinName());
			         ps.setString(3, floatWin.getWinDesc());
			         ps.setString(4, floatWin.getLinkUrl());
			         ps.setString(5, floatWin.getLinkTargetType());
			         ps.setString(6, floatWin.getLinkImageUrl());
			         ps.setInt(7, floatWin.getDisplayOrder());
			         ps.setString(8, floatWin.getShowState());
			         ps.setString(9, floatWin.getDataState());
			       }
			     }
			 );
	}


	/**
	 * 
	 * 删除
	 * @author: wyc
	 * @createTime: 2018年4月9日 下午6:42:34
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE t_float_win SET DATA_STATE=? WHERE ID=?";
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
		
		//显示状态
		if(param.get("showState")!=null&&StringUtils.isNotBlank(param.get("showState").toString())){
			sqlBuff.append(" AND  T.show_state = '"+param.get("showState").toString()+"' \n");
		}
		
		//链接名称
		if(param.get("winName")!=null&&StringUtils.isNotBlank(param.get("winName").toString())){
			sqlBuff.append(" AND  T.win_name LIKE '%"+param.get("winName").toString()+"%' \n");
		}
		//链接地址
		if(param.get("linkUrl")!=null&&StringUtils.isNotBlank(param.get("linkUrl").toString())){
			sqlBuff.append(" AND  T.link_url LIKE '%"+param.get("linkUrl").toString()+"%' \n");
		}
		sqlBuff.append(" ORDER BY DISPLAY_ORDER");
		
		return sqlBuff.toString();
	}

}
