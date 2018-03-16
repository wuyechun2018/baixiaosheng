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
import com.bxs.pojo.Link;
import com.bxs.pojo.LinkInfoVo;

@Repository
public class LinkDao {
	
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
		String sql="SELECT COUNT(1) FROM V_LINK_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param,true);
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
	public List<?> pagerLinkList(EUIPager ePager,Map<String, Object> param) {
		String  querySql="SELECT * FROM V_LINK_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param,false);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<LinkInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(LinkInfoVo.class));
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
	public void update(final Link link) {
		String sql=	"UPDATE\n" +
						"  t_link\n" + 
						"SET\n" + 
						"link_type_id = ?,\n" + 
						"  link_name =  ?,\n" + 
						"  link_desc =  ?,\n" + 
						"  link_url =  ?,\n" + 
						"  link_image_url =  ?,\n" + 
						"  link_target_type =  ?,\n" + 
						"  data_state =  ?,\n" + 
						"  display_order =  ?\n" + 
						"WHERE id = ?";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, link.getLinkTypeId());
			         ps.setString(2, link.getLinkName());
			         ps.setString(3, link.getLinkDesc());
			         ps.setString(4, link.getLinkUrl());
			         ps.setString(5, link.getLinkImageUrl());
			         ps.setString(6, link.getLinkTargetType());
			         ps.setString(7, link.getDataState());
			         ps.setInt(8, link.getDisplayOrder());
			         ps.setString(9, link.getId());
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
	public void save(final Link link) {
		String sql="INSERT INTO t_link (\n" +
						"  id,\n" + 
						"  link_type_id,\n" + 
						"  link_name,\n" + 
						"  link_desc,\n" + 
						"  link_url,\n" + 
						"  link_image_url,\n" + 
						"  link_target_type,\n" + 
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
			         ps.setString(2, link.getLinkTypeId());
			         ps.setString(3, link.getLinkName());
			         ps.setString(4, link.getLinkDesc());
			         ps.setString(5, link.getLinkUrl());
			         ps.setString(6, link.getLinkImageUrl());
			         ps.setString(7, link.getLinkTargetType());
			         ps.setString(8, link.getDataState());
			         ps.setInt(9, link.getDisplayOrder());
			       }
			     }
			 );
	}



	public void delete(String id) {
		String sql = "UPDATE t_link SET DATA_STATE=? WHERE ID=?";
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
	private String getParamSql(Map<String, Object> param,boolean isCount) {
		StringBuffer sqlBuff=new StringBuffer();

		//导航类型,1 代表全部
		if(param.get("linkTypeId")!=null&&StringUtils.isNotBlank(param.get("linkTypeId").toString())&&!"1".equals(param.get("linkTypeId").toString())){
			sqlBuff.append(" AND T.LINK_TYPE_ID = '" + param.get("linkTypeId").toString() + "'\n");
		}
		//导航类型Code
		if(param.get("linkTypeCode")!=null&&StringUtils.isNotBlank(param.get("linkTypeCode").toString())){
			sqlBuff.append(" AND  T.link_type_code = '"+param.get("linkTypeCode").toString()+"' \n");
		}
		
		//链接名称
		if(param.get("linkName")!=null&&StringUtils.isNotBlank(param.get("linkName").toString())){
			sqlBuff.append(" AND  T.LINK_NAME LIKE '%"+param.get("linkName").toString()+"%' \n");
		}
		
		//链接地址
		if(param.get("linkUrl")!=null&&StringUtils.isNotBlank(param.get("linkUrl").toString())){
			sqlBuff.append(" AND  T.LINK_URL LIKE '%"+param.get("linkUrl").toString()+"%' \n");
		}
		if(!isCount){
			sqlBuff.append(" ORDER BY DISPLAY_ORDER");
		}
		return sqlBuff.toString();
	}

}
