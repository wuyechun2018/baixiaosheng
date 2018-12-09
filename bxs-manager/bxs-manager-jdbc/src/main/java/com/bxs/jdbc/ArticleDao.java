package com.bxs.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
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

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.ArticleMiniInfoVo;

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
	public String save(final Article article) {
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
						"  update_date,\n" + 
						"  front_slider_state,\n" + 
						"  newsfrom,\n" + 
						"  author,\n" + 
						"  publish_date,\n" + 
						"  top_state,\n" + 
						"  pop_state,\n" +
						"  publish_media,\n" +
						"  title_color,\n" +
						"  res_edtior,\n" +
						"  about_content\n" +
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
		final String keyId= UUID.randomUUID().toString();
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1,keyId);
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
			         ps.setString(16, article.getFrontSliderState());
			         ps.setString(17, article.getNewsfrom());
			         ps.setString(18, article.getAuthor());
			        // ps.setDate(19, new java.sql.Date(article.getPublishDate().getTime()));
			         ps.setTimestamp(19, new java.sql.Timestamp(article.getPublishDate().getTime()));
			         ps.setString(20, article.getTopState());
			         ps.setString(21, article.getPopState());
			         ps.setString(22, article.getPublishMedia());
			         ps.setString(23, article.getTitleColor());
			         ps.setString(24, article.getResEdtior());
			         ps.setString(25, article.getAboutContent());
			       }
			     }
			 );
		return keyId;
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
						"  update_date = ?,\n" + 
						"  front_slider_state = ?,\n" + 
						"  newsfrom = ?,\n" + 
						"  author = ?,\n" + 
						"  publish_date = ?,\n" + 
						"  top_state = ?,\n" + 
						"  pop_state = ?,\n" + 
						"  publish_media = ?,\n" + 
						"  title_color = ?,\n" + 
						"  res_edtior = ?,\n" + 
						"  about_content = ?\n" + 
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
			         ps.setString(15, article.getFrontSliderState());
			         ps.setString(16, article.getNewsfrom());
			         ps.setString(17, article.getAuthor());
			         //ps.setDate(18, new java.sql.Date(article.getPublishDate().getTime()));
			         ps.setTimestamp(18, new java.sql.Timestamp(article.getPublishDate().getTime()));
			         ps.setString(19, article.getTopState());
			         ps.setString(20, article.getPopState());
			         ps.setString(21, article.getPublishMedia());
			         ps.setString(22, article.getTitleColor());
			         ps.setString(23, article.getResEdtior());
			         ps.setString(24, article.getAboutContent());
			         ps.setString(25, article.getId());
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
		//String sql = "UPDATE T_ARTICLE SET DATA_STATE=? WHERE ID=?";
		//jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
		
		//删除历史
		String sql="DELETE FROM T_ARTICLE_HISTORY  WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{id});
		//备份操作
		String insertSql="INSERT INTO T_ARTICLE_HISTORY  SELECT * FROM t_article WHERE id=?";
		jdbcTemplate.update(insertSql,new Object[]{id});
		//删除记录
		String delSql="DELETE FROM T_ARTICLE  WHERE ID=?";
		jdbcTemplate.update(delSql,new Object[]{id});
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
		String sql="SELECT COUNT(1) FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param,true);
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
		String  querySql="SELECT * FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param,false);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
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
	public List<?> pagerArticleListOrderByCreateDate(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSqlOrderByCreateDate(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
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
	public List<?> pagerArticleListForVideo(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ARTICLE_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSqlForVideo(param,false);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}
	
	/**
	 * 
	 * 分页、条件 筛选列表(去除首页不展示的字段，提升首页加载速度)
	 * @author: wyc
	 * @createTime: 2018年2月18日 下午8:54:22
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?>  pagerMiniArticleList(EUIPager ePager, Map<String, Object> param){
		String  querySql="SELECT * FROM V_ARTICLE_MINI_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param,false);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleMiniInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleMiniInfoVo.class));
		return list;
	}
	
	
	/**
	 * 
	 * 分页、条件 筛选列表(去除首页不展示的字段，提升首页加载速度)-优化SQL
	 * @author: wyc
	 * @createTime: 2018年3月16日 上午8:51:35
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?>  pagerMiniArticleListForOpt(EUIPager ePager, Map<String, Object> param){
		String  querySql=getBaseSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleMiniInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleMiniInfoVo.class));
		return list;
	}
	
	
	/**
	 * 
	 * 分页、条件 筛选列表(去除首页不展示的字段，提升首页加载速度)-优化SQL
	 * @author: wyc
	 * @createTime: 2018年3月16日 上午8:51:35
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?>  pagerMiniListByDate(EUIPager ePager, Map<String, Object> param){
		/**String sql=	"SELECT W.*,s.topic_code,s.topic_name FROM(\n" +
						"             SELECT * FROM (\n" + 
						"              SELECT\n" + 
						"                  T.id,\n" + 
						"                  t.article_type,\n" + 
						"                  t.article_title,\n" + 
						"                  t.publish_dept_id,\n" + 
						"                  t.publish_user_id,\n" + 
						"                  t.check_state,\n" + 
						"                  t.front_slider_state,\n" + 
						"                  t.create_date,\n" + 
						"                  t.update_date,\n" + 
						"                  t.top_count,\n" + 
						"                  t.publish_date,\n" + 
						"                  t.data_state,\n" + 
						"                  t.topic_id\n" + 
						"               FROM\n" + 
						//"                  t_article T WHERE  T.DATA_STATE='1' AND T.CHECK_STATE='1'\n" + 
						"                  t_article T WHERE  T.CHECK_STATE='1'\n"+ 
						 				   getTopicParamSql(param)+
						"                 ORDER BY TOP_COUNT DESC,publish_date DESC\n" + 
						"    )W LIMIT ?,?\n" + 
						"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";**/

		
		String sql=	"SELECT W.*,s.topic_code,s.topic_name FROM(\n" +
				"              SELECT\n" + 
				"                  T.id,\n" + 
				"                  t.article_type,\n" + 
				"                  t.article_title,\n" + 
				"                  t.publish_dept_id,\n" + 
				"                  t.publish_user_id,\n" + 
				"                  t.check_state,\n" + 
				"                  t.front_slider_state,\n" + 
				"                  t.create_date,\n" + 
				"                  t.update_date,\n" + 
				"                  t.top_count,\n" + 
				"                  t.publish_date,\n" + 
				"                  t.data_state,\n" + 
				"                  t.topic_id,\n" + 
				"                  t.title_color\n" + 
				"               FROM\n" + 
				"                  t_article T WHERE  T.CHECK_STATE='1'\n"+ 
				 				   getTopicParamSql(param)+
				"                 ORDER BY TOP_COUNT DESC,publish_date DESC LIMIT ?,? \n" + 
				"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";
		
		
		
		List<ArticleMiniInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleMiniInfoVo.class));
		return list;
	}
	
	
	public List<?>  pagerMiniArticleListFast(EUIPager ePager, Map<String, Object> param){
		String sql=	"SELECT W.*,s.topic_code,s.topic_name FROM(\n" +
						"             SELECT * FROM (\n" + 
						"              SELECT\n" + 
						"                  T.id,\n" + 
						"                  t.article_type,\n" + 
						"                  t.article_title,\n" + 
						"                  t.publish_dept_id,\n" + 
						"                  t.publish_user_id,\n" + 
						"                  t.check_state,\n" + 
						"                  t.front_slider_state,\n" + 
						"                  t.create_date,\n" + 
						"                  t.update_date,\n" + 
						"                  t.top_count,\n" + 
						"                  t.publish_date,\n" + 
						"                  t.data_state,\n" + 
						"                  t.topic_id,\n" + 
						"                  t.title_color\n" + 
						"               FROM\n" + 
						//"                  t_article T WHERE T.DATA_STATE='1' AND T.CHECK_STATE='1' \n" + 
						"                  t_article T WHERE T.CHECK_STATE='1' \n" + 
						"                  AND T.topic_id =(\n" + 
						"              SELECT m.ID FROM t_topic m WHERE 1=1 "+getBaseParamSql(param)+"\n" + 
						"                ) ORDER BY TOP_COUNT DESC,publish_date DESC\n" + 
						"    )W LIMIT ?,?\n" + 
						"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";

		List<ArticleMiniInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleMiniInfoVo.class));
		return list;
	}
	
	
	
	public List<?>  searchByKey(EUIPager ePager, Map<String, Object> param,boolean isFullText){
		String sql=	"SELECT W.*,s.topic_code,s.topic_name FROM(\n" +
						"             SELECT * FROM (\n" + 
						"              SELECT\n" + 
						"                  T.id,\n" + 
						"                  t.article_type,\n" + 
						"                  t.article_title,\n" + 
						"                  t.publish_dept_id,\n" + 
						"                  t.publish_user_id,\n" + 
						"                  t.check_state,\n" + 
						"                  t.front_slider_state,\n" + 
						"                  t.create_date,\n" + 
						"                  t.update_date,\n" + 
						"                  t.top_count,\n" + 
						"                  t.publish_date,\n" + 
						"                  t.data_state,\n" + 
						"                  t.topic_id\n" + 
						"               FROM\n" + 
						//"                  t_article T WHERE  T.DATA_STATE='1' AND T.CHECK_STATE='1'\n" +getSearchKeySql(param)+ 
						"                  t_article T WHERE  T.CHECK_STATE='1'\n" +getSearchKeySql(param,isFullText)+ 
						/*"                  AND T.topic_id IN(\n" + 
						"              SELECT m.ID FROM t_topic m WHERE 1=1 "+getBaseParamSql(param)+"\n" + 
						"                )\n"+ */
						getTopicParamSql(param)+
						//" ORDER BY TOP_COUNT DESC,publish_date DESC\n" + 
						"    )W LIMIT ?,?\n" + 
						"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";
		System.out.println("searchByKey:"+sql);
		List<ArticleMiniInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleMiniInfoVo.class));
		return list;
	}
	
	
	
	public int getCountBySearchKeyFromList(Map<String, Object> param,boolean isFullText){
		String sql=	"SELECT W.* FROM(\n" +
						"             SELECT * FROM (\n" + 
						"              SELECT\n" + 
						"                  t.topic_id\n" + 
						"               FROM\n" + 
						"                  t_article T WHERE  T.CHECK_STATE='1'\n" +getSearchKeySql(param,isFullText)+ 
						getTopicParamSql(param)+
						"    )W\n" + 
						"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";
		System.out.println("getCountBySearchKeyFromList"+sql+",isFullText:"+isFullText);
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		return list.size();
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
	public Long getTotalCountForOpt(Map<String, Object> param) {
		//String sql=getBaseSqlForCount(param);
		//return  jdbcTemplate.queryForObject(sql,Long.class);
		
		String sql="SELECT t.article_count FROM t_opt_article_count T WHERE 1=1 \n";
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sql=sql+"AND T.topic_code='" + param.get("topicCode").toString() + "'";
		}
		List<Map<String, Object>>  list=jdbcTemplate.queryForList(sql);
		if(list.isEmpty()){
			return 0L;
		}else{
			Map<String, Object> obj=list.get(0);
			return Long.valueOf(obj.get("ARTICLE_COUNT").toString());
		}
	}
	
	/**
	 * 
	 * 获取基础查询语句
	 * @author: wyc
	 * @createTime: 2018年3月16日 上午9:13:25
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getBaseSql(Map<String, Object> param) {
		String sql="SELECT W.*,s.topic_code,s.topic_name FROM(\n" +
						"  SELECT\n" + 
						"      T.id,\n" + 
						"      t.article_type,\n" + 
						"      t.article_title,\n" + 
						"      t.publish_dept_id,\n" + 
						"      t.publish_user_id,\n" + 
						"      t.check_state,\n" + 
						"      t.front_slider_state,\n" + 
						"      t.create_date,\n" + 
						"      t.update_date,\n" + 
						"      t.top_count,\n" + 
						"      t.publish_date,\n" + 
						"      t.data_state,\n" + 
						"      t.topic_id\n" + 
						"   FROM\n" + 
						"      t_article T WHERE 1=1 AND T.DATA_STATE='1' AND T.CHECK_STATE='1' \n" + 
						"      AND T.topic_id IN(\n" + 
						"  SELECT m.ID FROM t_topic m WHERE 1=1 "+getBaseParamSql(param)+
						"    ) ORDER BY TOP_COUNT DESC,UPDATE_DATE DESC \n" + 
						")W LEFT JOIN t_topic s ON w.topic_id=s.ID";
		return sql;
	}
	
	
	
	
	/**
	 * 
	 * 获取基础查询语句
	 * @author: wyc
	 * @createTime: 2018年3月16日 上午9:13:25
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getBaseSqlForCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM(\n" +
						"  SELECT\n" + 
						"      T.id,\n" + 
						"      t.topic_id\n" + 
						"   FROM\n" + 
						"      t_article T WHERE 1=1 AND T.DATA_STATE='1' \n" + 
						"      AND T.topic_id IN(\n" + 
						"  SELECT m.ID FROM t_topic m WHERE 1=1 "+getBaseParamSql(param)+
						"    ) \n" + 
						")W LEFT JOIN t_topic s ON w.topic_id=s.ID";
		return sql;
	}
	
	
	/**
	 * 
	 * 获取基础SQL
	 * @author: wyc
	 * @createTime: 2018年3月16日 上午9:19:55
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getBaseParamSql(Map<String, Object> param){
		String sql="";
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sql="AND m.TOPIC_CODE ='" + param.get("topicCode").toString() + "'";
		}
		return sql;
	}
	
	
	private String getTopicParamSql(Map<String, Object> param){
		String sql="";
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sql=" AND T.topic_id =(\n" + 
				" SELECT m.ID FROM t_topic m WHERE m.TOPIC_CODE ='" + param.get("topicCode").toString() + "' )\n";
		}
		return sql;
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
		
		if(param.get("articleType")!=null&&StringUtils.isNotBlank(param.get("articleType").toString())){
			sqlBuff.append(" AND ARTICLE_TYPE = '" + param.get("articleType").toString() + "'\n");
		}
		//栏目ID,1代表全部栏目
		if(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND TOPIC_ID = '" + param.get("topicId").toString() + "'\n");
		}
		//首页推荐
		if(param.get("frontSliderState")!=null&&StringUtils.isNotBlank(param.get("frontSliderState").toString())){
			sqlBuff.append(" AND front_slider_state = '" + param.get("frontSliderState").toString() + "'\n");
		}
		
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sqlBuff.append(" AND TOPIC_CODE = '" + param.get("topicCode").toString() + "'\n");
		}
		
		//发布部门,1代表全部部门
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("publishDeptId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		
		//发布人
		if(param.get("publishUserId")!=null&&StringUtils.isNotBlank(param.get("publishUserId").toString())){
			sqlBuff.append(" AND PUBLISH_USER_ID = '" + param.get("publishUserId").toString() + "'\n");
		}
		
		//审核状态,2代表全部状态,0 未审核 1 已审核
		if(param.get("checkState")!=null&&StringUtils.isNotBlank(param.get("checkState").toString())&&!"2".equals(param.get("checkState").toString())){
			sqlBuff.append(" AND CHECK_STATE = '" + param.get("checkState").toString() + "'\n");
		}
		
		//文章标题
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sqlBuff.append(" AND  T.ARTICLE_TITLE LIKE '%"+param.get("articleTitle").toString()+"%' \n");
		}
		
		if(param.get("publishUserName")!=null&&StringUtils.isNotBlank(param.get("publishUserName").toString())){
			sqlBuff.append(" AND  T.PUBLISH_USER_NAME LIKE '%"+param.get("publishUserName").toString()+"%' \n");
		}
		//是否弹窗
		if(param.get("popState")!=null&&StringUtils.isNotBlank(param.get("popState").toString())){
			//sqlBuff.append(" AND  T.POP_STATE = '"+param.get("popState").toString()+"' \n");
			//2018-12-08 调整为只弹出3天内的数据
			sqlBuff.append(" AND  T.POP_STATE = '"+param.get("popState").toString()+"' AND  T.PUBLISH_DATE>DATE_SUB(CURDATE(),INTERVAL 3 DAY) \n");
		}
		
		//性能优化，如果是Count操作，则不加排序字段
		if(!isCount){
			//sqlBuff.append(" ORDER BY top_count DESC,UPDATE_DATE DESC");
			sqlBuff.append(" ORDER BY top_count DESC");
		}
		
		return sqlBuff.toString();
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
	private String getParamSqlOrderByCreateDate(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		
		if(param.get("articleType")!=null&&StringUtils.isNotBlank(param.get("articleType").toString())){
			sqlBuff.append(" AND ARTICLE_TYPE = '" + param.get("articleType").toString() + "'\n");
		}
		//栏目ID,1代表全部栏目
		if(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND TOPIC_ID = '" + param.get("topicId").toString() + "'\n");
		}
		//首页推荐
		if(param.get("frontSliderState")!=null&&StringUtils.isNotBlank(param.get("frontSliderState").toString())){
			sqlBuff.append(" AND front_slider_state = '" + param.get("frontSliderState").toString() + "'\n");
		}
		
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sqlBuff.append(" AND TOPIC_CODE = '" + param.get("topicCode").toString() + "'\n");
		}
		
		//发布部门,1代表全部部门
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("publishDeptId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		
		//发布人
		if(param.get("publishUserId")!=null&&StringUtils.isNotBlank(param.get("publishUserId").toString())){
			sqlBuff.append(" AND PUBLISH_USER_ID = '" + param.get("publishUserId").toString() + "'\n");
		}
		
		//审核状态,2代表全部状态,0 未审核 1 已审核
		if(param.get("checkState")!=null&&StringUtils.isNotBlank(param.get("checkState").toString())&&!"2".equals(param.get("checkState").toString())){
			sqlBuff.append(" AND CHECK_STATE = '" + param.get("checkState").toString() + "'\n");
		}
		
		//文章标题
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sqlBuff.append(" AND  T.ARTICLE_TITLE LIKE '%"+param.get("articleTitle").toString()+"%' \n");
		}
		
		if(param.get("publishUserName")!=null&&StringUtils.isNotBlank(param.get("publishUserName").toString())){
			sqlBuff.append(" AND  T.PUBLISH_USER_NAME LIKE '%"+param.get("publishUserName").toString()+"%' \n");
		}
		//是否弹窗
		if(param.get("popState")!=null&&StringUtils.isNotBlank(param.get("popState").toString())){
			sqlBuff.append(" AND  T.POP_STATE = '"+param.get("popState").toString()+"' \n");
		}
		
		//性能优化，如果是Count操作，则不加排序字段
		sqlBuff.append(" ORDER BY CREATE_DATE DESC");
		
		return sqlBuff.toString();
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
	private String getParamSqlForVideo(Map<String, Object> param,boolean isCount) {
		StringBuffer sqlBuff=new StringBuffer();
		
		if(param.get("articleType")!=null&&StringUtils.isNotBlank(param.get("articleType").toString())){
			sqlBuff.append(" AND ARTICLE_TYPE = '" + param.get("articleType").toString() + "'\n");
		}
		//栏目ID,1代表全部栏目
		if(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND TOPIC_ID = '" + param.get("topicId").toString() + "'\n");
		}
		//首页推荐
		if(param.get("frontSliderState")!=null&&StringUtils.isNotBlank(param.get("frontSliderState").toString())){
			sqlBuff.append(" AND front_slider_state = '" + param.get("frontSliderState").toString() + "'\n");
		}
		
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sqlBuff.append(" AND TOPIC_CODE = '" + param.get("topicCode").toString() + "'\n");
		}
		
		//发布部门,1代表全部部门
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("publishDeptId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		
		//发布人
		if(param.get("publishUserId")!=null&&StringUtils.isNotBlank(param.get("publishUserId").toString())){
			sqlBuff.append(" AND PUBLISH_USER_ID = '" + param.get("publishUserId").toString() + "'\n");
		}
		
		//审核状态,2代表全部状态,0 未审核 1 已审核
		if(param.get("checkState")!=null&&StringUtils.isNotBlank(param.get("checkState").toString())&&!"2".equals(param.get("checkState").toString())){
			sqlBuff.append(" AND CHECK_STATE = '" + param.get("checkState").toString() + "'\n");
		}
		
		//文章标题
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sqlBuff.append(" AND  T.ARTICLE_TITLE LIKE '%"+param.get("articleTitle").toString()+"%' \n");
		}
		
		if(param.get("publishUserName")!=null&&StringUtils.isNotBlank(param.get("publishUserName").toString())){
			sqlBuff.append(" AND  T.PUBLISH_USER_NAME LIKE '%"+param.get("publishUserName").toString()+"%' \n");
		}
		//是否弹窗
		if(param.get("popState")!=null&&StringUtils.isNotBlank(param.get("popState").toString())){
			sqlBuff.append(" AND  T.POP_STATE = '"+param.get("popState").toString()+"' \n");
		}
		
		//性能优化，如果是Count操作，则不加排序字段
		if(!isCount){
			sqlBuff.append(" ORDER BY top_count DESC,UPDATE_DATE DESC");
			//sqlBuff.append(" ORDER BY top_count DESC");
		}
		
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

	/**
	 * 
	 * 设置首页推荐状态
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午3:37:13
	 * @history:
	 * @param article void
	 */
	public void saveFrontSliderState(Article article) {
		String sql = "UPDATE T_ARTICLE SET front_slider_state=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{article.getFrontSliderState(),article.getId()});
	}

	/**
	 * 
	 * 设置审核状态
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午2:32:36
	 * @history:
	 * @param article void
	 */
	public void saveCheckState(Article article) {
		String sql = "UPDATE T_ARTICLE SET check_state=?,res_edtior=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{article.getCheckState(),article.getResEdtior(),article.getId()});
		
	}

	/**
	 * 
	 * 该栏目置顶显示
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午3:38:10
	 * @history:
	 * @param article void
	 */
	public void saveTopCount(Article article) {
		String sql="UPDATE\n" +
						"  t_article\n" + 
						"SET\n" + 
						"  top_count =\n" + 
						"  (\n" + 
						"\n" + 
						"  SELECT M.TOP_COUNT FROM (\n" + 
						"SELECT\n" + 
						"  (MAX(TOP_COUNT) + 10) AS TOP_COUNT\n" + 
						"FROM\n" + 
						"  t_article t\n" + 
						"WHERE T.topic_id =\n" + 
						"  (SELECT\n" + 
						"    topic_id\n" + 
						"  FROM\n" + 
						"    t_article\n" + 
						"  WHERE id =?)\n" + 
						")M)\n" + 
						"WHERE ID = ?";

	  jdbcTemplate.update(sql,new Object[]{article.getId(),article.getId()});
	}

	/**
	 * 
	 * 设置附加消息
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午3:20:56
	 * @history:
	 * @param article void
	 */
	public void savePlusInfo(ArticleInfoVo article) {
		String sql="UPDATE\n" +
						"  t_article T\n" + 
						"SET\n" + 
						"  T.newsfrom =?,\n" + 
						"  T.author = ?,\n" + 
						"  T.publish_date = ?\n" + 
						" WHERE T.id=?";
	   jdbcTemplate.update(sql,new Object[]{article.getNewsfrom(),article.getAuthor(),article.getPublishDate(),article.getId()});
	}

	/**
	 * 
	 * 根据创建时间和文章类型获取文章数量
	 * @author: wyc
	 * @createTime: 2018年3月4日 下午9:58:23
	 * @history:
	 * @param statYear
	 * @param statArticleType
	 * @return int
	 */
	public int getCountByPublishDateAndTopic(String publishDate, String topicCode,String publishDeptId) {
		String topicQueryParam="";
		String[] topciCodeArray=topicCode.split(",");
		for (String tcode : topciCodeArray) {
			topicQueryParam=topicQueryParam+"'"+tcode+"',";
		}
		topicQueryParam=topicQueryParam.substring(0, topicQueryParam.lastIndexOf(","));
		
		String sql="SELECT COUNT(1) FROM v_article_mini_info T WHERE T.data_state='1'\n"+
				"AND T.publish_dept_id=?\n"+
				"AND DATE_FORMAT(T.publish_date,'%Y')=?\n"+
				"AND T.topic_code IN("+topicQueryParam+")";
		return jdbcTemplate.queryForObject(sql,new Object[]{publishDeptId,publishDate},Integer.class);
	}

	/**
	 * 
	 * 设置"置顶"操作
	 * @author: wyc
	 * @createTime: 2018年3月5日 下午7:54:36
	 * @history:
	 * @param article void
	 */
	public void toTop(Article article) {
		if("1".equals(article.getTopState())){
			//置顶，原置顶值保存到“display_order”字段中
			String sql="UPDATE\n" +
					"  t_article\n" + 
					"SET\n" + 
					"TOP_STATE=?,\n"+
					"DISPLAY_ORDER=?,\n"+
					"  top_count =\n" + 
					"  (\n" + 
					"\n" + 
					"  SELECT M.TOP_COUNT FROM (\n" + 
					"SELECT\n" + 
					"  (MAX(TOP_COUNT) + 10) AS TOP_COUNT\n" + 
					"FROM\n" + 
					"  t_article t\n" + 
					"WHERE T.topic_id =\n" + 
					"  (SELECT\n" + 
					"    topic_id\n" + 
					"  FROM\n" + 
					"    t_article\n" + 
					"  WHERE id =?)\n" + 
					")M)\n" + 
					"WHERE ID = ?";
			jdbcTemplate.update(sql,new Object[]{article.getTopState(),article.getTopCount(),article.getId(),article.getId()});
		}else{
			//取消置顶，从“display_order”字段中恢复置顶值
			String sql="UPDATE\n" +
					"  t_article\n" + 
					"SET\n" + 
					"TOP_STATE=?,\n"+
					"top_count =? \n" + 
					"WHERE ID = ?";
			jdbcTemplate.update(sql,new Object[]{article.getTopState(),article.getDisplayOrder(),article.getId()});
		}
		
	}

	public Long getSytjTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_ARTICLE_INFO_SYTJ T" ;
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	public List<?> pagerSytjArticleList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ARTICLE_INFO_SYTJ T" ;
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}

	public Long getTotalCountFast(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM (SELECT J.id\n" +
						"  FROM (SELECT M.*\n" + 
						"          FROM (SELECT T.*\n" + 
						"                  FROM (SELECT id, publish_dept_id, publish_user_id, topic_id\n" + 
						"                          FROM t_article\n" + 
						//"                         WHERE 1 = 1 AND DATA_STATE = '1' \n" +getParamSqlFast(param) +") T\n" + 
						"                         WHERE 1 = 1 \n" +getParamSqlFast(param) +") T\n" + 
						"                  LEFT JOIN (SELECT id FROM t_topic) S\n" + 
						"                    ON T.topic_id = S.id) M\n" + 
						"          LEFT JOIN (SELECT ID FROM T_DEPT) N\n" + 
						"            ON M.PUBLISH_DEPT_ID = N.id) J\n" + 
						"  LEFT JOIN (SELECT id FROM T_USER) K\n" + 
						"    ON J.PUBLISH_USER_ID = K.id)w";
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}
	
	/**
	 * 
	 * 根据参数获取查询语句-优化
	 * @author: wyc
	 * @createTime: 2018年3月20日 下午11:17:44
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSqlFast(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("articleType")!=null&&StringUtils.isNotBlank(param.get("articleType").toString())){
		    String articleType=param.get("articleType").toString();
			if(articleType.indexOf(",")>-1){
				String[] articleTypeArray=articleType.split(",");
				String articleTypeStr="";
				for(int i=0;i<articleTypeArray.length;i++){
					articleTypeStr=articleTypeStr+"'"+articleTypeArray[i]+"',";
				}
				articleTypeStr=articleTypeStr.substring(0, articleTypeStr.lastIndexOf(","));
				sqlBuff.append(" AND ARTICLE_TYPE in (" + articleTypeStr + ")\n");
			}else{
				sqlBuff.append(" AND ARTICLE_TYPE = '" + param.get("articleType").toString() + "'\n");
			}
			
		}
		//栏目ID,1代表全部栏目
		if(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())){
			sqlBuff.append(" AND TOPIC_ID = '" + param.get("topicId").toString() + "'\n");
		}
		//首页推荐
		if(param.get("frontSliderState")!=null&&StringUtils.isNotBlank(param.get("frontSliderState").toString())){
			sqlBuff.append(" AND front_slider_state = '" + param.get("frontSliderState").toString() + "'\n");
		}
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			//sqlBuff.append(" AND TOPIC_CODE = '" + param.get("topicCode").toString() + "'\n");
			sqlBuff.append("AND topic_id =(SELECT id FROM t_topic WHERE topic_code='" + param.get("topicCode").toString() + "')\n");
		}
		//发布部门,1代表全部部门
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("publishDeptId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		//发布人
		if(param.get("publishUserId")!=null&&StringUtils.isNotBlank(param.get("publishUserId").toString())){
			sqlBuff.append(" AND PUBLISH_USER_ID = '" + param.get("publishUserId").toString() + "'\n");
		}
		//审核状态,2代表全部状态,0 未审核 1 已审核
		if(param.get("checkState")!=null&&StringUtils.isNotBlank(param.get("checkState").toString())&&!"2".equals(param.get("checkState").toString())){
			sqlBuff.append(" AND CHECK_STATE = '" + param.get("checkState").toString() + "'\n");
		}
		//文章标题
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sqlBuff.append(" AND  ARTICLE_TITLE LIKE '%"+param.get("articleTitle").toString()+"%' \n");
		}
		if(param.get("publishUserName")!=null&&StringUtils.isNotBlank(param.get("publishUserName").toString())){
			//sqlBuff.append(" AND  T.PUBLISH_USER_NAME LIKE '%"+param.get("publishUserName").toString()+"%' \n");
			sqlBuff.append("AND PUBLISH_USER_ID IN(SELECT id FROM t_user WHERE user_name LIKE '%" +param.get("publishUserName").toString()+ "%')\n");
		}
		//是否弹窗
		if(param.get("popState")!=null&&StringUtils.isNotBlank(param.get("popState").toString())){
			sqlBuff.append(" AND  POP_STATE = '"+param.get("popState").toString()+"' \n");
		}
		return sqlBuff.toString();
	}

	public List<?> pagerArticleListFast(EUIPager ePager, Map<String, Object> param) {
		String  querySql=	"SELECT * FROM(SELECT J.*, K.user_name AS publish_user_name\n" +
						"  FROM (SELECT M.*, N.dept_name AS publish_dept_name\n" + 
						"          FROM (SELECT T.*,\n" + 
						"                       S.topic_name,\n" + 
						"                       S.topic_code,\n" + 
						"                       SUBSTRING(t.article_content,\n" + 
						"                                 LOCATE('src=\"', t.article_content) + 5,\n" + 
						"                                 58) AS content_image_url\n" + 
						"                  FROM (SELECT *\n" + 
						"                          FROM t_article\n" + 
						"                         WHERE 1 = 1\n" + 
						"                           AND DATA_STATE = '1'\n" + 
													 getParamSqlFast(param) +
						"                        ) T\n" + 
						"                  LEFT JOIN (SELECT id, topic_name, topic_code FROM t_topic) S\n" + 
						"                    ON T.topic_id = S.id) M\n" + 
						"          LEFT JOIN (SELECT ID, DEPT_NAME FROM T_DEPT) N\n" + 
						"            ON M.PUBLISH_DEPT_ID = N.id) J\n" + 
						"  LEFT JOIN (SELECT id, user_name FROM T_USER) K\n" + 
						"    ON J.PUBLISH_USER_ID = K.id) ORDER BY top_count DESC, publish_date desc";
		
		String sql="SELECT J.*, K.user_name AS publish_user_name\n" +
						"  FROM (SELECT M.*, N.dept_name AS publish_dept_name\n" + 
						"          FROM (SELECT T.*,\n" + 
						"                       S.topic_name,\n" + 
						"                       S.topic_code,\n" + 
						"                       SUBSTRING(t.article_content,\n" + 
						"                                 LOCATE('src=\"', t.article_content) + 5,\n" + 
						"                                 58) AS content_image_url\n" + 
						"                  FROM (\n" + 
						"\n" + 
						"                        SELECT *\n" + 
						"                          FROM (SELECT *\n" + 
						"                                   FROM t_article\n" + 
						"                                  WHERE 1 = 1\n" + 
						//"                                    AND DATA_STATE = '1'\n" + 
															getParamSqlFast(param) +getOrderBySql(param)+
						"                                  ) U LIMIT ?,\n" + 
						"                                ?) T\n" + 
						"                  LEFT JOIN (SELECT id, topic_name, topic_code FROM t_topic) S\n" + 
						"                    ON T.topic_id = S.id) M\n" + 
						"          LEFT JOIN (SELECT ID, DEPT_NAME FROM T_DEPT) N\n" + 
						"            ON M.PUBLISH_DEPT_ID = N.id) J\n" + 
						"  LEFT JOIN (SELECT id, user_name FROM T_USER) K\n" + 
						"    ON J.PUBLISH_USER_ID = K.id\n " ;
						// "ORDER BY top_count DESC, publish_date desc";

		//String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}
	
	
	
	public List<?> pagerArticleListFastForSois(EUIPager ePager, Map<String, Object> param) {
		String sql="SELECT J.*, K.user_name AS publish_user_name\n" +
						"  FROM (SELECT M.*, N.dept_name AS publish_dept_name\n" + 
						"          FROM (SELECT T.*,\n" + 
						"                       S.topic_name,\n" + 
						"                       S.topic_code,\n" + 
						"                       SUBSTRING(t.article_content,\n" + 
						"                                 LOCATE('src=\"', t.article_content) + 5,\n" + 
						"                                 58) AS content_image_url\n" + 
						"                  FROM (\n" + 
						"\n" + 
						"                        SELECT *\n" + 
						"                          FROM (SELECT *\n" + 
						"                                   FROM t_article\n" + 
						"                                  WHERE 1 = 1\n" + 
						//"                                    AND DATA_STATE = '1'\n" + 
															getParamSqlFast(param) +getOrderBySqlForSois(param)+
						"                                  ) U LIMIT ?,\n" + 
						"                                ?) T\n" + 
						"                  LEFT JOIN (SELECT id, topic_name, topic_code FROM t_topic) S\n" + 
						"                    ON T.topic_id = S.id) M\n" + 
						"          LEFT JOIN (SELECT ID, DEPT_NAME FROM T_DEPT) N\n" + 
						"            ON M.PUBLISH_DEPT_ID = N.id) J\n" + 
						"  LEFT JOIN (SELECT id, user_name FROM T_USER) K\n" + 
						"    ON J.PUBLISH_USER_ID = K.id\n " ;
						// "ORDER BY top_count DESC, publish_date desc";

		//String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}

	/**
	 * 
	 * 排序语句
	 * @author: wyc
	 * @createTime: 2018年4月11日 下午2:32:03
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getOrderBySql(Map<String, Object> param) {
		//String sql="\n ORDER BY top_count DESC, publish_date DESC,create_date DESC";
		String sql="\n ORDER BY top_count DESC, publish_date DESC,update_date DESC";
		//如果有关键字搜索，则不进行排序
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sql="";
		}
		return sql;
	}
	
	
	/**
	 * 
	 * 排序语句-给上报系统用
	 * @author: wyc
	 * @createTime: 2018年4月11日 下午2:32:03
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getOrderBySqlForSois(Map<String, Object> param) {
		//String sql="\n ORDER BY top_count DESC, publish_date DESC,create_date DESC";
		String sql="\n ORDER BY update_date DESC";
		//如果有关键字搜索，则不进行排序
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			sql="";
		}
		return sql;
	}

	/**
	 * 
	 * 根据关键字查询
	 * @author: wyc
	 * @createTime: 2018年3月24日 下午10:02:36
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getCountBySearchKey(Map<String, Object> param,boolean isFullText) {
		String sql=	"SELECT COUNT(1) FROM(\n" +
				"             SELECT * FROM (\n" + 
				"              SELECT\n" + 
				"                  T.id,\n" + 
				"                  t.topic_id\n" + 
				"               FROM\n" + 
				//"                  t_article T WHERE  (T.DATA_STATE||T.CHECK_STATE='11') \n" +getSearchKeySql(param)+ 
				"                  t_article T WHERE  T.CHECK_STATE='1' \n" +getSearchKeySql(param,isFullText)+ getTopicParamSql(param)+
				/*"                  AND T.topic_id IN(\n" + 
				"              SELECT m.ID FROM t_topic m WHERE 1=1 "+getBaseParamSql(param)+"\n" + 
				"                )\n" + */
				"    )W\n" + 
				"            )W LEFT JOIN t_topic s ON w.topic_id=s.ID";
			return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	private String getSearchKeySql(Map<String, Object> param,boolean isFullText) {
		String sql="";
		//栏目编码
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			//sql="AND ARTICLE_TITLE LIKE '%" + param.get("articleTitle").toString() + "%'";
			if(isFullText){
				sql="AND  MATCH(article_title) AGAINST('"+param.get("articleTitle").toString()+"')";
			}else{
				sql="AND ARTICLE_TITLE LIKE '%" + param.get("articleTitle").toString() + "%'";
			}
			
		}
		return sql;
	}


	/**
	 * 
	 * 获取未签收数
	 * @author: wyc
	 * @createTime: 2018年4月16日 下午8:18:51
	 * @history:
	 * @param articleId
	 * @return Long
	 */
	public Long getNoSignedCount(String articleId) {
		String sql="SELECT COUNT(1) FROM t_sign T WHERE T.data_state='1' AND T.sign_state='0' AND t.article_id=?;";
		return  jdbcTemplate.queryForObject(sql,new Object[]{articleId},Long.class);
	}

	/**
	 * 
	 * 获取文章列表，根据浏览数倒序排列
	 * @author: wyc
	 * @createTime: 2018年5月9日 下午7:14:09
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> topPagerList(EUIPager ePager, Map<String, Object> param) {
		String querySql="SELECT t.*,s.topic_name FROM t_article T LEFT JOIN t_topic s ON t.topic_id=s.id ORDER BY T.view_count DESC";
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}

	public Long getArticleListCountByKeyword(Map<String, Object> param,boolean isFullText) {
		String sql="SELECT COUNT(1) FROM t_article T WHERE 1=1\n";
		sql=sql+getSqlByParam(param,isFullText);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}
	
	public List<?> getArticleListRowsByKeyword(EUIPager ePager,Map<String, Object> param,boolean isFullText) {
		String querySql="SELECT T.ID,T.ARTICLE_TITLE,T.PUBLISH_DATE FROM t_article T WHERE 1=1\n";
		querySql=querySql+getSqlByParam(param,isFullText);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		System.out.println("getArticleListRowsByKeyword["+sql+"]");
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ArticleInfoVo.class));
		return list;
	}
	
	private String getSqlByParam(Map<String, Object> param,boolean isFullText) {
		StringBuffer sqlBuff=new StringBuffer();
		
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			if(isFullText){
				sqlBuff.append("AND  MATCH(article_title) AGAINST('"+param.get("articleTitle").toString()+"')");
			}else{
				sqlBuff.append("AND ARTICLE_TITLE LIKE '%" + param.get("articleTitle").toString() + "%'\n");
			}
		}
		//栏目编码
		if(param.get("topicCode")!=null&&StringUtils.isNotBlank(param.get("topicCode").toString())&&!"1".equals(param.get("topicCode").toString())){
			sqlBuff.append("AND topic_id =(SELECT id FROM t_topic WHERE topic_code='" + param.get("topicCode").toString() + "')\n");
		}
		
		//发布部门,1代表全部部门
		if(param.get("publishDeptId")!=null&&StringUtils.isNotBlank(param.get("publishDeptId").toString())&&!"1".equals(param.get("publishDeptId").toString())){
			sqlBuff.append(" AND PUBLISH_DEPT_ID = '" + param.get("publishDeptId").toString() + "'\n");
		}
		
		sqlBuff.append("AND T.check_state='1'\n");
		sqlBuff.append("AND T.data_state='1'\n");
		return sqlBuff.toString();
	}

	
}
