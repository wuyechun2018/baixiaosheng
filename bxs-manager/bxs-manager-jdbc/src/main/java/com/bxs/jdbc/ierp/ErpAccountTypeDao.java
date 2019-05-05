package com.bxs.jdbc.ierp;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpAccountType;

@Repository
public class ErpAccountTypeDao {
	
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
		String sql="SELECT COUNT(1) FROM T_ERP_ACCOUNT_TYPE T WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
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
		String  querySql="SSELECT * FROM T_ERP_ACCOUNT_TYPE T WHERE 1=1 AND T.DATA_STATE='1' \n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		System.out.println(sql);
		List<ErpAccountType> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpAccountType.class));
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
		sqlBuff.append(" ORDER BY T.DISPLAY_ORDER ");
		return sqlBuff.toString();
	}
	
	/**
	 * 
	 * 获取子类型列表
	 * @author: wyc
	 * @createTime: 2019年3月28日 下午4:07:55
	 * @history:
	 * @param pid
	 * @return List<ErpAccountType>
	 */
	public List<ErpAccountType> getListByPid(String pid) {
		String sql="SELECT * FROM T_ERP_ACCOUNT_TYPE T WHERE T.ACCOUNT_TYPE_PID=? AND DATA_STATE='1' ORDER BY T.DISPLAY_ORDER";
		List<ErpAccountType> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(ErpAccountType.class));
		return list;
	}

	public List<ErpAccountType> getListByPidAndType(String pid, String type) {
		String sql="SELECT * FROM T_ERP_ACCOUNT_TYPE T WHERE T.ACCOUNT_TYPE_PID=? AND INCOME_EXPENSE=? AND DATA_STATE='1' ORDER BY T.DISPLAY_ORDER";
		List<ErpAccountType> list = jdbcTemplate.query(sql,new Object[]{pid,type},new BeanPropertyRowMapper(ErpAccountType.class));
		return list;
	}

}
