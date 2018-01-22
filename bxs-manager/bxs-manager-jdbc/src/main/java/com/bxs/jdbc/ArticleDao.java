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
import com.bxs.pojo.Article;

@Repository
public class ArticleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private  final static String ALL_LIST_SQL = "SELECT * FROM T_ARTICLE ORDER BY CREATE_DATE DESC";
	

	/**
	 * 
	 * 保存文章
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午3:53:53
	 * @history:
	 * @param article void
	 */
	public void save(final Article article) {
		 String insertSQL = "INSERT INTO T_ARTICLE (ID, ARTICLE_TITLE, ARTICLE_CONTENT, CREATE_DATE,UPDATE_DATE, DISPLAY_ORDER,VIEW_COUNT) VALUES(?,?,?,?,?,?,?)";
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
			       }
			     }
			 );
		
	}
	
	public void update(final Article article) {
		String insertSQL = "UPDATE T_ARTICLE SET ARTICLE_TITLE=?,ARTICLE_CONTENT=?,CREATE_DATE=?,UPDATE_DATE=?,DISPLAY_ORDER=?,VIEW_COUNT=? WHERE ID=?";
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

	

}
