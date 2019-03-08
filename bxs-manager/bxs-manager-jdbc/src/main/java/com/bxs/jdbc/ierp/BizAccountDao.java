package com.bxs.jdbc.ierp;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.FloatWin;
import com.bxs.pojo.jpa.ierp.BizAccount;

@Repository
public class BizAccountDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 获取查询的总数（条件筛选后的）
	 * @author: wyc
	 * @createTime: 2019年3月7日 下午9:15:08
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM T_BIZ_ACCOUNT T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	/**
	 * 
	 * 分页查询
	 * @author: wyc
	 * @createTime: 2019年3月7日 下午9:15:00
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM T_BIZ_ACCOUNT T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<BizAccount> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(BizAccount.class));
		return list;
	}
	
	
	/**
	 * 
	 * 获取查询SQL
	 * @author: wyc
	 * @createTime: 2019年3月7日 下午9:12:36
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		sqlBuff.append(" ORDER BY T.ACCOUNT_DATE DESC,T.UPDATE_DATE DESC");
		return sqlBuff.toString();
	}

}
