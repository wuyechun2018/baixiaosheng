package com.bxs.jdbc.ierp;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ierp.ErpUserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpUser;

@Repository
public class ErpUserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<ErpUser> getUserByLoginName(String username) {
		String sql="SELECT * FROM T_erp_user T WHERE 1=1 AND T.DATA_STATE='1' AND T.LOGIN_NAME=?";
		List<ErpUser> list = jdbcTemplate.query(sql,new Object[]{username},new BeanPropertyRowMapper(ErpUser.class));
		return list;
	}


	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_ERP_USER_INFO T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	public List<?> getPagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ERP_USER_INFO T WHERE 1=1  AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpUserInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpUserInfoVo.class));
		return list;
	}
	
	/**
	 * 
	 * 根据条件拼接SQL
	 * @author: wyc
	 * @createTime: 2019年4月28日 上午10:25:08
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		
		if(param.get("Id")!=null&&StringUtils.isNotBlank(param.get("Id").toString())){
			sqlBuff.append(" AND T.ID = '" + param.get("Id").toString() + "'\n");
		}
		
		if(param.get("orgId")!=null&&StringUtils.isNotBlank(param.get("orgId").toString())&&!"1".equals(param.get("orgId").toString())){
			sqlBuff.append(" AND T.BELONG_ORG_ID = '" + param.get("orgId").toString() + "'\n");
		}
		if(param.get("empNo")!=null&&StringUtils.isNotBlank(param.get("empNo").toString())){
			sqlBuff.append(" AND T.EMP_NO LIKE '%" + param.get("empNo").toString() + "%'\n");
		}
		
		if(param.get("loginOrUserName")!=null&&StringUtils.isNotBlank(param.get("loginOrUserName").toString())){
			sqlBuff.append(" AND  (T.EMP_NAME LIKE '%"+param.get("loginOrUserName").toString()+"%' OR T.LOGIN_NAME LIKE '%"+param.get("loginOrUserName")+"%')\n");
		}
		
		if(param.get("mobilePhone")!=null&&StringUtils.isNotBlank(param.get("mobilePhone").toString())){
			sqlBuff.append(" AND T.MOBILE_PHONE LIKE '%" + param.get("mobilePhone").toString() + "%'\n");
		}
		if(param.get("email")!=null&&StringUtils.isNotBlank(param.get("email").toString())){
			sqlBuff.append(" AND T.EMAIL LIKE '%" + param.get("email").toString() + "%'\n");
		}
		return sqlBuff.toString();
	}


	public List<ErpUser> getUserList(Map<String,Object> param) {
		String  querySql="SELECT * FROM T_erp_user T WHERE 1=1  AND T.DATA_STATE='1'\n"+getParamSql(param);
		List<ErpUser> list = jdbcTemplate.query(querySql,new BeanPropertyRowMapper(ErpUser.class));
		return list;
	}
}
