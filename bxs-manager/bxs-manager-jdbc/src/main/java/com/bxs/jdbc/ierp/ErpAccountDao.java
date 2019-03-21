package com.bxs.jdbc.ierp;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ierp.BizAccountVo;

@Repository
public class ErpAccountDao {
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
		String sql="SELECT COUNT(1) FROM t_erp_account T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
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
		String  querySql="SELECT T.*,S.user_name AS ACCOUNT_USER_NAME FROM t_erp_account T LEFT JOIN T_USER S ON T.ACCOUNT_USER_ID=S.ID WHERE 1=1  AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		System.out.println(sql);
		List<BizAccountVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(BizAccountVo.class));
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
		//入账类型
		if(param.get("accountType")!=null&&StringUtils.isNotBlank(param.get("accountType").toString())){
			sqlBuff.append(" AND  T.ACCOUNT_TYPE = '"+param.get("accountType").toString()+"' \n");
		}
		//入账人
		if(param.get("accountUserId")!=null&&StringUtils.isNotBlank(param.get("accountUserId").toString())){
			sqlBuff.append(" AND  T.ACCOUNT_USER_ID = '"+param.get("accountUserId").toString()+"' \n");
		}
		//入账开始时间
		if(param.get("accountDateFrom")!=null&&StringUtils.isNotBlank(param.get("accountDateFrom").toString())){
			sqlBuff.append(" AND  T.ACCOUNT_DATE >= '"+param.get("accountDateFrom").toString()+"' \n");
		}
		//入账结束时间
		if(param.get("accountDateTo")!=null&&StringUtils.isNotBlank(param.get("accountDateTo").toString())){
			sqlBuff.append(" AND  T.ACCOUNT_DATE <= '"+param.get("accountDateTo").toString()+"' \n");
		}

		
		sqlBuff.append(" ORDER BY T.ACCOUNT_DATE DESC,T.UPDATE_DATE DESC");
		return sqlBuff.toString();
	}

}
