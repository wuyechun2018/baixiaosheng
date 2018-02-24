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
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;
import com.bxs.pojo.UserInfoVo;

@Repository
public class SignDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:12:33
	 * @history:
	 * @param sign void
	 */
	public void update(final Sign sign) {
		String sql="UPDATE\n" +
						"  t_sign\n" + 
						"SET\n" + 
						"  article_id = ?,\n" + 
						"  article_type =?,\n" + 
						"  sign_dept_id = ?,\n" + 
						"  sign_user_id = ?,\n" + 
						"  sign_state = ?,\n" + 
						"  sign_content = ?,\n" + 
						"  sign_date = ?,\n" + 
						"  data_state = ?,\n" + 
						"  create_date =?,\n" + 
						"  update_date = ?\n" + 
						"WHERE id = ?";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				         ps.setString(1, sign.getArticleId());
				         ps.setString(2, sign.getArticleType());
				         ps.setString(3, sign.getSignDeptId());
				         ps.setString(4, sign.getSignUserId());
				         ps.setString(5, sign.getSignState());
				         lobCreator.setClobAsString(ps,6,sign.getSignContent());
				         ps.setTimestamp(7, new java.sql.Timestamp(sign.getSignDate().getTime()));
				         ps.setString(8, sign.getDataState());
				         ps.setTimestamp(9, new java.sql.Timestamp(sign.getCreateDate().getTime()));
				         ps.setTimestamp(10, new java.sql.Timestamp(sign.getUpdateDate().getTime()));
				         ps.setString(11,sign.getId());
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
	 * @param sign void
	 */
	public void save(final Sign sign) {
		 String sql = "INSERT INTO t_sign (\n" +
						 "  id,\n" + 
						 "  article_id,\n" + 
						 "  article_type,\n" + 
						 "  sign_dept_id,\n" + 
						 "  sign_user_id,\n" + 
						 "  sign_state,\n" + 
						 "  sign_content,\n" + 
						 "  sign_date,\n" + 
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
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?,\n" + 
						 "    ?\n" + 
						 "  ) ;\n" + 
						 "";

		 jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, sign.getArticleId());
			         ps.setString(3, sign.getArticleType());
			         ps.setString(4, sign.getSignDeptId());
			         ps.setString(5, sign.getSignUserId());
			         ps.setString(6, sign.getSignState());
			         lobCreator.setClobAsString(ps,7,sign.getSignContent());
			         ps.setTimestamp(8, new java.sql.Timestamp(sign.getSignDate().getTime()));
			         ps.setString(9, sign.getDataState());
			         ps.setTimestamp(10, new java.sql.Timestamp(sign.getCreateDate().getTime()));
			         ps.setTimestamp(11, new java.sql.Timestamp(sign.getUpdateDate().getTime()));
			       }
			     }
			 );
	}


	/**
	 * 
	 * 签收-逻辑删除
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午2:31:50
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE t_sign SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}


	/**
	 * 
	 * 根据文章Id获取签收信息
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午3:33:43
	 * @history:
	 * @param id
	 * @return List<Sign>
	 */
	public List<SignInfoVo> getSignListByArticleId(String id) {
		String sql="SELECT * FROM v_sign_info T WHERE T.data_state='1' AND T.article_id=?";
		List<SignInfoVo> list = jdbcTemplate.query(sql,new Object[]{id},new BeanPropertyRowMapper(SignInfoVo.class));
		return list;
	}
	
	/**
	 * 
	 * 根据文章Id和签收部门Id获取签收信息
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午11:05:11
	 * @history:
	 * @param id
	 * @param deptId
	 * @return List<SignInfoVo>
	 */
	public List<SignInfoVo> getSignListByArticleIdAndDeptId(String id, String deptId) {
		String sql="SELECT * FROM v_sign_info T WHERE T.data_state='1' AND T.article_id=? AND t.sign_dept_id=?";
		List<SignInfoVo> list = jdbcTemplate.query(sql,new Object[]{id,deptId},new BeanPropertyRowMapper(SignInfoVo.class));
		return list;
	}


	/**
	 * 
	 * 根据文章ID删除关联的签收信息
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午4:58:38
	 * @history:
	 * @param articleId void
	 */
	public void deleteSignByArticleId(String articleId) {
		String sql = "UPDATE t_sign SET DATA_STATE=? WHERE ARTICLE_ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),articleId});
	}


	/**
	 * 
	 * 文章签收操作
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午11:31:53
	 * @history:
	 * @param articleId
	 * @param info void
	 */
	public void signArticle(final Sign sign) {
		String sql="UPDATE\n" +
				"  t_sign\n" + 
				"SET\n" + 
				"  sign_user_id = ?,\n" + 
				"  sign_state = ?,\n" + 
				"  sign_content = ?,\n" + 
				"  sign_date = ?\n" + 
				"WHERE article_id = ? AND sign_dept_id=?";

		jdbcTemplate.execute(sql,
	     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
	       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
		         ps.setString(1, sign.getSignUserId());
		         ps.setString(2, sign.getSignState());
		         lobCreator.setClobAsString(ps,3,sign.getSignContent());
		         ps.setTimestamp(4, new java.sql.Timestamp(sign.getSignDate().getTime()));
		         ps.setString(5, sign.getArticleId());
		         ps.setString(6, sign.getSignDeptId());
	       }
	     }
	 );
		
	}


	/**
	 * 
	 * 获取条件筛选后的记录总数
	 * @author: wyc
	 * @createTime: 2018年2月24日 下午2:33:53
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM v_sign_info T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	/**
	 * 
	 * 根据查询参数生成查询语句
	 * @author: wyc
	 * @createTime: 2018年2月24日 下午2:33:25
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("articleId")!=null&&StringUtils.isNotBlank(param.get("articleId").toString())){
			sqlBuff.append(" AND ARTICLE_ID = '" + param.get("articleId").toString() + "'\n");
		}
		return sqlBuff.toString();
	}


	/**
	 * 
	 * 分页、条件 筛选列表
	 * @author: wyc
	 * @createTime: 2018年2月24日 下午2:33:41
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerSignList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM v_sign_info T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<SignInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(SignInfoVo.class));
		return list;
	}

}
