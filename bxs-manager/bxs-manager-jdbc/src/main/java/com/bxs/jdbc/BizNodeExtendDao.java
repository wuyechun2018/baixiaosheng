package com.bxs.jdbc;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.UserInfoVo;
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

	/**
	 * 
	 * 获取总量
	 * @author: wyc
	 * @createTime: 2018年11月29日 下午5:15:20
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT COUNT(1) FROM t_biz_node_extend T WHERE T.DATA_STATE='1'\n");
		if(param.get("mainNodeId")!=null&&StringUtils.isNotBlank(param.get("mainNodeId").toString())){
			sqlBuff.append(" AND  T.MAIN_NODE_ID = '"+param.get("mainNodeId").toString()+"' \n");
		}
		return  jdbcTemplate.queryForObject(sqlBuff.toString(),Long.class);
	}

	
	public List<?> pagerList(EUIPager ePager, Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT * FROM t_biz_node_extend T WHERE 1=1 AND T.DATA_STATE='1' \n");
		if(param.get("mainNodeId")!=null&&StringUtils.isNotBlank(param.get("mainNodeId").toString())){
			sqlBuff.append(" AND  T.MAIN_NODE_ID = '"+param.get("mainNodeId").toString()+"' \n");
		}
		
		//排序
		if(param.get("ascOrDesc")!=null&&StringUtils.isNotBlank(param.get("ascOrDesc").toString())){
			sqlBuff.append(" ORDER BY UPDATE_DATE "+param.get("ascOrDesc").toString()+"' \n");
		}
		
		//注意MySQL的分页参数
		String sql="SELECT * FROM ("+sqlBuff.toString()+")S limit ?,?";
		List<BizNodeExtend> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(BizNodeExtend.class));
		return list;
	}

}
