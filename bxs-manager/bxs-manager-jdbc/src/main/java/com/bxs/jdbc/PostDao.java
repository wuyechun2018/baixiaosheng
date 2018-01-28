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
import com.bxs.pojo.Post;
import com.bxs.pojo.PostInfoVo;
import com.bxs.pojo.UserInfoVo;

@Repository
public class PostDao {
	
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
		StringBuffer sqlBuff=new StringBuffer("SELECT COUNT(1) FROM V_POST_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n");
		//单位ID，其中"1"为根节点，不做筛选，查询全部
		if(param.get("deptId")!=null&&StringUtils.isNotBlank(param.get("deptId").toString())&&!"1".equals(param.get("deptId").toString())){
			sqlBuff.append(" AND DEPT_ID = '" + param.get("deptId").toString() + "'\n");
		}
		//职务名称
		if(param.get("postName")!=null&&StringUtils.isNotBlank(param.get("postName").toString())){
			sqlBuff.append(" AND  T.post_name LIKE '%"+param.get("postName").toString()+"%' \n");
		}
		//职务编码
		if(param.get("postCode")!=null&&StringUtils.isNotBlank(param.get("postCode").toString())){
			sqlBuff.append(" AND  T.post_code LIKE '%"+param.get("postCode").toString()+"%' \n");
		}
		return  jdbcTemplate.queryForObject(sqlBuff.toString(),Long.class);
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
	public List<?> pagerPostList(EUIPager ePager,Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT * FROM V_POST_INFO T WHERE 1=1 AND T.DATA_STATE='1' \n");
		
		//单位ID，其中"1"为根节点，不做筛选，查询全部
		if(param.get("deptId")!=null&&StringUtils.isNotBlank(param.get("deptId").toString())&&!"1".equals(param.get("deptId").toString())){
			sqlBuff.append(" AND DEPT_ID = '" + param.get("deptId").toString() + "'\n");
		}
		
		//职务名称
		if(param.get("postName")!=null&&StringUtils.isNotBlank(param.get("postName").toString())){
			sqlBuff.append(" AND  T.post_name LIKE '%"+param.get("postName").toString()+"%' \n");
		}
		
		//职务编码
		if(param.get("postCode")!=null&&StringUtils.isNotBlank(param.get("postCode").toString())){
			sqlBuff.append(" AND  T.post_code LIKE '%"+param.get("postCode").toString()+"%' \n");
		}
		
		//注意MySQL的分页参数
		String sql="SELECT * FROM ("+sqlBuff.toString()+")S limit ?,?";
		List<UserInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(PostInfoVo.class));
		return list;
	}


	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:33
	 * @history:
	 * @param post void
	 */
	public void update(final Post post) {
		String sql="UPDATE t_post t SET t.pid=?,t.dept_id=?,post_code=?,post_name=?,post_desc=?,data_state=?,display_order=? \n"
				+"WHERE  t.id=?";
		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, post.getPid());
			         ps.setString(2, post.getDeptId());
			         ps.setString(3, post.getPostCode());
			         ps.setString(4, post.getPostName());
			         ps.setString(5, post.getPostDesc());
			         ps.setString(6, post.getDataState());
			         ps.setInt(7, post.getDisplayOrder());
			         ps.setString(8, post.getId());
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
	 * @param post void
	 */
	public void save(final Post post) {
		 String insertSQL = "INSERT INTO t_post(id,pid,dept_id,post_code,post_name,post_desc,data_state,display_order)\n"
				 +"VALUES(?,?,?,?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, post.getPid());
			         ps.setString(3, post.getDeptId());
			         ps.setString(4, post.getPostCode());
			         ps.setString(5, post.getPostName());
			         ps.setString(6, post.getPostDesc());
			         ps.setString(7, post.getDataState());
			         ps.setInt(8, post.getDisplayOrder());
			       }
			     }
			 );
	}



	public void delete(String id) {
		String sql = "UPDATE t_post SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}

}
