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
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;

@Repository
public class ArticleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private  final static String ALL_LIST_SQL = "SELECT * FROM T_ARTICLE WHERE DATA_STATE='1' ORDER BY CREATE_DATE DESC";
	

	/**
	 * 
	 * 保存文章
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午3:53:53
	 * @history:
	 * @param article void
	 */
	public void save(final Article article) {
		/* String insertSQL = "INSERT INTO T_ARTICLE (ID, ARTICLE_TITLE, ARTICLE_CONTENT, CREATE_DATE,UPDATE_DATE, DISPLAY_ORDER,VIEW_COUNT,DATA_STATE) VALUES(?,?,?,?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, article.getArticleTitle());
			         lobCreator.setClobAsString(ps,3,article.getArticleContent());
			         //注意，需要使用Timestamp,否则只保存到日，不保存时间
			         //ps.setDate(4,new java.sql.Date(article.getCreateDate().getTime()));
			         ps.setTimestamp(4, new java.sql.Timestamp(article.getCreateDate().getTime()));
			         ps.setTimestamp(5, new java.sql.Timestamp(article.getUpdateDate().getTime()));
			         ps.setInt(6, article.getDisplayOrder());
			         ps.setInt(7, article.getViewCount());
			         ps.setString(8, article.getDataState());
			       }
			     }
			 );*/
		String sql="INSERT INTO t_article (\n" +
						"  id,\n" + 
						"  article_type,\n" + 
						"  topic_id,\n" + 
						"  article_title,\n" + 
						"  article_image_url,\n" + 
						"  article_content,\n" + 
						"  publish_dept_id,\n" + 
						"  publish_user_id,\n" + 
						"  check_state,\n" + 
						"  top_count,\n" + 
						"  view_count,\n" + 
						"  display_order,\n" + 
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
			         ps.setString(2, article.getArticleType());
			         ps.setString(3, article.getTopicId());
			         ps.setString(4, article.getArticleTitle());
			         ps.setString(5, article.getArticleImageUrl());
			         lobCreator.setClobAsString(ps,6,article.getArticleContent());
			         ps.setString(7, article.getPublishDeptId());
			         ps.setString(8, article.getPublishUserId());
			         ps.setString(9, article.getCheckState());
			         ps.setInt(10, article.getTopCount());
			         ps.setInt(11, article.getViewCount());
			         ps.setInt(12, article.getDisplayOrder());
			         ps.setString(13, article.getDataState());
			         ps.setTimestamp(14, new java.sql.Timestamp(article.getCreateDate().getTime()));
			         ps.setTimestamp(15, new java.sql.Timestamp(article.getUpdateDate().getTime()));
			       }
			     }
			 );
		
		
	}
	
	public void update(final Article article) {
		/*String insertSQL = "UPDATE T_ARTICLE SET ARTICLE_TITLE=?,ARTICLE_CONTENT=?,CREATE_DATE=?,UPDATE_DATE=?,DISPLAY_ORDER=?,VIEW_COUNT=? WHERE ID=?";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, article.getArticleTitle());
			         lobCreator.setClobAsString(ps,2,article.getArticleContent());
			         ps.setTimestamp(3, new java.sql.Timestamp(article.getCreateDate().getTime()));
			         ps.setTimestamp(4, new java.sql.Timestamp(article.getUpdateDate().getTime()));
			         ps.setInt(5, article.getDisplayOrder());
			         ps.setInt(6, article.getViewCount());
			         ps.setString(7, article.getId());
			       }
			     }
			 );*/
		
		String sql=	"UPDATE\n" +
						"  t_article\n" + 
						"SET\n" + 
						"  article_type = ?,\n" + 
						"  topic_id = ?,\n" + 
						"  article_title = ?,\n" + 
						"  article_image_url = ?,\n" + 
						"  article_content = ?,\n" + 
						"  publish_dept_id = ?,\n" + 
						"  publish_user_id = ?,\n" + 
						"  check_state = ?,\n" + 
						"  top_count = ?,\n" + 
						"  view_count =?,\n" + 
						"  display_order = ?,\n" + 
						"  data_state = ?,\n" + 
						"  create_date = ?,\n" + 
						"  update_date = ?\n" + 
						"WHERE id = ?";

		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, article.getArticleType());
			         ps.setString(2, article.getTopicId());
			         ps.setString(3, article.getArticleTitle());
			         ps.setString(4, article.getArticleImageUrl());
			         lobCreator.setClobAsString(ps,5,article.getArticleContent());
			         ps.setString(6, article.getPublishDeptId());
			         ps.setString(7, article.getPublishUserId());
			         ps.setString(8, article.getCheckState());
			         ps.setInt(9, article.getTopCount());
			         ps.setInt(10, article.getViewCount());
			         ps.setInt(11, article.getDisplayOrder());
			         ps.setString(12, article.getDataState());
			         ps.setTimestamp(13, new java.sql.Timestamp(article.getCreateDate().getTime()));
			         ps.setTimestamp(14, new java.sql.Timestamp(article.getUpdateDate().getTime()));
			         ps.setString(15, article.getId());
			       }
			     }
			 );
		
	}
	

	/**
	 * 
	 * 获取列表，根据创建时间倒序排列
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午3:52:54
	 * @history:
	 * @return List<Article>
	 */
	public List<Article> getList() {
		List<Article> list = jdbcTemplate.query(ALL_LIST_SQL,new BeanPropertyRowMapper(Article.class));
		return list;
	}

	/**
	 * 
	 * 根据主键获取单条记录
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午3:53:06
	 * @history:
	 * @param id
	 * @return Article
	 */
	public Article findOne(String id) {
		List<Article> list = jdbcTemplate.query("SELECT * FROM T_ARTICLE WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(Article.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 
	 * 逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 上午9:20:35
	 * @history:
	 * @param id
	 */
	public void delete(String id) {
		String sql = "UPDATE T_ARTICLE SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}

	/**
	 * 
	 * 获取条件筛选后的记录总数
	 * @author: wyc
	 * @createTime: 2018年1月31日 下午3:03:39
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	
	/**
	 * 
	 * 分页、条件 筛选列表
	 * @author: wyc
	 * @createTime: 2018年1月31日 下午3:03:50
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerArticleList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
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
		
		if(param.get("articleType")!=null&&StringUtils.isNotBlank(param.get("articleType").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND ARTICLE_TYPE = '" + param.get("articleType").toString() + "'\n");
		}
		//栏目ID,1代表全部栏目
		if(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND TOPIC_ID = '" + param.get("topicId").toString() + "'\n");
		}
		//发布部门,1代表全部栏目
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		
		//审核状态,2代表全部状态,0 未审核 1 已审核
		if(param.get("checkState")!=null&&StringUtils.isNotBlank(param.get("checkState").toString())&&!"2".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND CHECK_STATE = '" + param.get("checkState").toString() + "'\n");
		}
		
		//文章标题
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sqlBuff.append(" AND  T.ARTICLE_TITLE LIKE '%"+param.get("articleTitle").toString()+"%' \n");
		}
		
		if(param.get("publishUserName")!=null&&StringUtils.isNotBlank(param.get("publishUserName").toString())){
			sqlBuff.append(" AND  T.PUBLISH_USER_NAME LIKE '%"+param.get("publishUserName").toString()+"%' \n");
		}
		sqlBuff.append(" ORDER BY top_count DESC,UPDATE_DATE DESC");
		
		return sqlBuff.toString();
	}

	/**
	 * 
	 * 获取文章信息
	 * @author: wyc
	 * @createTime: 2018年1月31日 下午6:57:44
	 * @history:
	 * @param id
	 * @return ArticleInfoVo
	 */
	public ArticleInfoVo getArticleInfoById(String id) {
		List<ArticleInfoVo> list = jdbcTemplate.query("SELECT * FROM V_ARTICLE_INFO WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(ArticleInfoVo.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}


}
