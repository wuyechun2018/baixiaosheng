package com.bxs.jdbc.ierp;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ierp.ErpLogInfoVo;
import com.bxs.pojo.jpa.ierp.ErpLog;

@Repository
public class ErpLogDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 筛选后数据总量
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:50:27
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_ERP_LOG_INFO T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:50:18
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> getPagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_ERP_LOG_INFO T WHERE 1=1 \n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpLogInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpLogInfoVo.class));
		return list;
	}

	/**
	 * 
	 * 拼接条件筛选SQL
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:50:39
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("loginClientIp")!=null&&StringUtils.isNotBlank(param.get("loginClientIp").toString())){
			sqlBuff.append(" AND T.LOGIN_CLIENT_IP = '" + param.get("loginClientIp").toString() + "'\n");
		}
		if(param.get("bizId")!=null&&StringUtils.isNotBlank(param.get("bizId").toString())){
			sqlBuff.append(" AND T.BIZ_ID = '" + param.get("bizId").toString() + "'\n");
		}
		sqlBuff.append(" ORDER BY OPERATE_TIME DESC");
		return sqlBuff.toString();
	}
}
