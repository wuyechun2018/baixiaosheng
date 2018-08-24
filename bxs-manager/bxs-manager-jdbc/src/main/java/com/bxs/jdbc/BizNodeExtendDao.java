package com.bxs.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.jpa.BizNodeExtend;

@Repository
public class BizNodeExtendDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 根据主节点信息获取附属节点信息
	 * @author: wyc
	 * @createTime: 2018年8月23日 下午3:38:48
	 * @history:
	 * @param mainNodeId
	 * @return List<BizNodeExtend>
	 */
	public List<BizNodeExtend> getListByMainNodeId(String mainNodeId) {
		String sql="SELECT * FROM t_biz_node_extend T WHERE DATA_STATE='1' AND T.MAIN_NODE_ID=?";
		List<BizNodeExtend> list = jdbcTemplate.query(sql,new Object[]{mainNodeId},new BeanPropertyRowMapper(BizNodeExtend.class));
		return list;
	}

}
