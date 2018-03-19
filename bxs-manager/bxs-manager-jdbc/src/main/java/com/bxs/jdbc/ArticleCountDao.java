package com.bxs.jdbc;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.ArticleCount;

@Repository
public class ArticleCountDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	public List<ArticleCount> getListByTopicCode(String topicCode) {
		String sql="SELECT * FROM t_opt_article_count T WHERE T.topic_code=?";
		List<ArticleCount> list = jdbcTemplate.query(sql,new Object[]{topicCode},new BeanPropertyRowMapper(ArticleCount.class));
		return list;
	}
	
	
	public Long getArticleTotalCount(String topicCode) {
		//String sql="SELECT COUNT(1) FROM v_article_mini_info t WHERE data_state='1' AND check_state='1' AND T.topic_code=?";
		String sql="SELECT COUNT(1) FROM v_article_mini_info t WHERE data_state='1' AND T.topic_code=?";
		return  jdbcTemplate.queryForObject(sql,new Object[]{topicCode},Long.class);
	}
	
	public Long getTotalCount() {
		String sql="SELECT COUNT(1) FROM v_article_mini_info t WHERE data_state='1'";
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年3月16日 下午2:41:42
	 * @history:
	 * @param articleCount void
	 */
	public void save(final ArticleCount articleCount) {
		String sql="INSERT INTO t_opt_article_count (\n" +
						"  id,\n" + 
						"  topic_code,\n" + 
						"  article_count,\n" + 
						"  update_date\n" + 
						")\n" + 
						"VALUES\n" + 
						"  (\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?\n" + 
						"  ) ";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			    	 ps.setString(1, UUID.randomUUID().toString()); 
			    	 ps.setString(2, articleCount.getTopicCode());  
			    	 ps.setInt(3,articleCount.getArticleCount());
			         ps.setTimestamp(4, new java.sql.Timestamp(articleCount.getUpdateDate().getTime()));
			       }
			     }
			 );
		
	}

	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年3月16日 下午2:41:52
	 * @history:
	 * @param articleCount void
	 */
	public void update(final ArticleCount articleCount) {
		String sql="UPDATE\n" +
						" t_opt_article_count\n" + 
						"SET\n" + 
						"  article_count = ?,\n" + 
						"  update_date = ?\n" + 
						"WHERE id = ?";

		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setInt(1,articleCount.getArticleCount());
			         ps.setTimestamp(2, new java.sql.Timestamp(articleCount.getUpdateDate().getTime()));
			         ps.setString(3, articleCount.getId());
			       }
			     }
			 );
	}

}
