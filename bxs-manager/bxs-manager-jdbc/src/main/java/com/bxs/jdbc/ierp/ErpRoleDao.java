package com.bxs.jdbc.ierp;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpRole;

@Repository
public class ErpRoleDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM T_ERP_ROLE T WHERE 1=1 \n"+getParamSql(param);
		//System.out.println("ErpRoleDao-getTotalCount-SQL:"+sql);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	public List<?> getPagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT T.* FROM T_ERP_ROLE T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpRole> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpRole.class));
		return list;
	}
	
	/**
	 * 
	 * 根据参数拼凑条件SQL
	 * @author: wyc
	 * @createTime: 2019年4月17日 上午11:32:30
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("roleName")!=null&&StringUtils.isNotBlank(param.get("roleName").toString())){
			sqlBuff.append(" AND T.ROLE_NAME LIKE '%" + param.get("roleName").toString() + "%'\n");
		}
		if(param.get("roleCode")!=null&&StringUtils.isNotBlank(param.get("roleCode").toString())){
			sqlBuff.append(" AND T.ROLE_CODE LIKE '%" + param.get("roleCode").toString() + "%'\n");
		}
		return sqlBuff.toString();
	}

}
