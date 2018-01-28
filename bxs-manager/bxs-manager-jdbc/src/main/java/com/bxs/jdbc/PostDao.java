package com.bxs.jdbc;

import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.common.vo.EUIPager;
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
		String sql="SELECT COUNT(1) FROM V_POST_INFO T";
		return  jdbcTemplate.queryForObject(sql,Long.class);
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
		StringBuffer sqlBuff=new StringBuffer("SELECT * FROM V_POST_INFO T WHERE 1=1 \n");
		
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

}
