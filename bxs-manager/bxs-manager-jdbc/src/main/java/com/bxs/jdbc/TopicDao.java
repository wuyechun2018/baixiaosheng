package com.bxs.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.SysUser;
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
		String sql="SELECT * FROM t_topic T WHERE T.pid=? ORDER BY T.DISPLAY_ORDER";
		List<Topic> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(Topic.class));
		return list;
	}
	
	/**
	 * 
	 * 根据父主键获取栏目数据(可签收的栏目)
	 * @author: wyc
	 * @createTime: 2018年2月23日 上午10:20:16
	 * @history:
	 * @param pid
	 * @return List<Topic>
	 */
	public List<Topic> getSignListByPid(String pid) {
		//目前的逻辑是，只要不设置为“不可签收”，都是可签收的栏目
		String sql="SELECT * FROM t_topic T WHERE T.topic_type<>'2'  AND T.pid=?  ORDER BY T.DISPLAY_ORDER";
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

	/**
	 * 
	 * 根据栏目编码获取栏目信息
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:13
	 * @history:
	 * @param topicCode
	 * @return Topic
	 */
	public Topic getTopicByCode(String topicCode) {
		List<Topic> list = jdbcTemplate.query("SELECT * FROM t_topic T WHERE T.TOPIC_CODE=?",new Object[]{topicCode},new BeanPropertyRowMapper(Topic.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 
	 * 根据主键获取栏目
	 * @author: wyc
	 * @createTime: 2018年3月19日 下午9:59:06
	 * @history:
	 * @param id
	 * @return Topic
	 */
	public Topic getTopicById(String id) {
		List<Topic> list = jdbcTemplate.query("SELECT * FROM t_topic T WHERE T.id=?",new Object[]{id},new BeanPropertyRowMapper(Topic.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 
	 * 根据父主键和栏目名称获取栏目数据
	 * @author: wyc
	 * @createTime: 2018年2月25日 上午11:22:09
	 * @history:
	 * @param pid
	 * @param topicName
	 * @return List<Topic>
	 */
	public List<Topic> getListByPidAndTopicName(String pid, String topicName) {
		String sql="SELECT * FROM t_topic T WHERE T.pid=? AND (t.id=1 OR T.topic_name LIKE ? ) ORDER BY T.DISPLAY_ORDER";
		List<Topic> list = jdbcTemplate.query(sql,new Object[]{pid,"%"+topicName+"%"},new BeanPropertyRowMapper(Topic.class));
		return list;
	}

	/**
	 * 
	 * 根据专题Ids查询专题列表,Ids以逗号分隔,
	 * 如 5a04f14f-4d6f-435a-a6ac-393a2f6e8d11,17e4c20a-1e6d-43bd-bc4b-11fa36a81df7
	 * @author: wyc
	 * @createTime: 2018年3月14日 上午8:59:37
	 * @history:
	 * @param Ids
	 * @return List<Topic>
	 */
	public List<Topic> getListByIds(String ids) {
		if (StringUtils.isBlank(ids)) {
			return null;
		} else {
			String[] idArray = ids.split(",");
			String querySql = "";
			for (int i = 0; i < idArray.length; i++) {
				querySql = querySql + "'" + idArray[i] + "',";
			}
			querySql = querySql.substring(0, querySql.lastIndexOf(","));
			String sql = "SELECT * FROM t_topic t WHERE data_state='1' AND t.id in (" + querySql + ") ORDER BY T.DISPLAY_ORDER ";
			List<Topic> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Topic.class));
			return list;
		}
	}

}
