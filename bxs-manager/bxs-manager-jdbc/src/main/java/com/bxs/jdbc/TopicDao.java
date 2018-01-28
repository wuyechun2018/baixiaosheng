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
import com.bxs.pojo.Topic;

@Repository
public class TopicDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 
	 * 根据父主键获取栏目数据
	 * @author: wyc
	 * @createTime: 2018年1月27日 上午11:05:34
	 * @history:
	 * @param pid
	 * @return List<Topic>
	 */
	public List<Topic> getListByPid(String pid) {
		String sql="SELECT * FROM t_topic T WHERE T.pid=?";
		List<Topic> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(Topic.class));
		return list;
	}

	/**
	 * 
	 * 更新操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:18:14
	 * @history:
	 * @param topic void
	 */
	public void update(final Topic topic) {
		String sql="UPDATE t_topic t SET t.pid=?,t.topic_name=?,topic_code=?,topic_type=?,topic_desc=?,data_state=?,display_order=? \n"
				+"WHERE  t.id=?";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, topic.getPid());
			         ps.setString(2, topic.getTopicName());
			         ps.setString(3, topic.getTopicCode());
			         ps.setString(4, topic.getTopicType());
			         ps.setString(5, topic.getTopicDesc());
			         ps.setString(6, topic.getDataState());
			         ps.setInt(7, topic.getDisplayOrder());
			         ps.setString(8, topic.getId());
			       }
			     }
			 );
	}

	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:15:42
	 * @history:
	 * @param topic void
	 */
	public void save(final Topic topic) {
		 String insertSQL = "INSERT INTO t_topic(id,pid,topic_name,topic_code,topic_type,topic_desc,data_state,display_order)\n"
				 +"VALUES(?,?,?,?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, topic.getPid());
			         ps.setString(3, topic.getTopicName());
			         ps.setString(4, topic.getTopicCode());
			         ps.setString(5, topic.getTopicType());
			         ps.setString(6, topic.getTopicDesc());
			         ps.setString(7, topic.getDataState());
			         ps.setInt(8, topic.getDisplayOrder());
			       }
			     }
			 );
		
	}

	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:50:26
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql="DELETE FROM t_topic WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{id});
	}

}