package com.bxs.jdbc.ierp;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ierp.ErpBillInfoVo;
import com.bxs.pojo.ierp.ErpUserInfoVo;

@Repository
public class ErpBillDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		//入账类型
		if(param.get("accountType")!=null&&StringUtils.isNotBlank(param.get("accountType").toString())){
			sqlBuff.append(" AND  T.ACCOUNT_TYPE = '"+param.get("accountType").toString()+"' \n");
		}
		//入账人
		if(param.get("accountUserId")!=null&&StringUtils.isNotBlank(param.get("accountUserId").toString())){
			sqlBuff.append(" AND  T.BILL_USER_ID = '"+param.get("accountUserId").toString()+"' \n");
		}
		//入账开始时间
		if(param.get("accountDateFrom")!=null&&StringUtils.isNotBlank(param.get("accountDateFrom").toString())){
			sqlBuff.append(" AND  T.BILL_DATE >= '"+param.get("accountDateFrom").toString()+"' \n");
		}
		//入账结束时间
		if(param.get("accountDateTo")!=null&&StringUtils.isNotBlank(param.get("accountDateTo").toString())){
			sqlBuff.append(" AND  T.BILL_DATE <= '"+param.get("accountDateTo").toString()+"' \n");
		}
		sqlBuff.append(" ORDER BY T.BILL_DATE DESC,T.UPDATE_DATE DESC");
		return sqlBuff.toString();
	}
	
	
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_ERP_BILL_INFO T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}
	

	public List<?> pagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ERP_BILL_INFO T WHERE 1=1  AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpBillInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpBillInfoVo.class));
		return list;
	}
}
