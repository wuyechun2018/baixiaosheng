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
public class ErpRoleDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM T_ERP_ROLE T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	public List<?> getPagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT T.* FROM T_ERP_ROLE WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<BizAccountVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(BizAccountVo.class));
		return list;
	}
	
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("loginClientIp")!=null&&StringUtils.isNotBlank(param.get("loginClientIp").toString())){
			sqlBuff.append(" AND T.LOGIN_CLIENT_IP = '" + param.get("loginClientIp").toString() + "'\n");
		}
		return sqlBuff.toString();
	}

}
