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
import com.bxs.pojo.jpa.ierp.ErpRole;
import com.bxs.pojo.jpa.ierp.ErpUser;
import com.bxs.pojo.jpa.ierp.ErpUserRole;

@Repository
public class ErpUserRoleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM T_ERP_USER_ROLE T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}


	public List<?> getPagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT T.* FROM T_ERP_USER_ROLE WHERE 1=1 AND T.DATA_STATE='1'\n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpUserRole> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpUserRole.class));
		return list;
	}
	
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("queryKey")!=null&&StringUtils.isNotBlank(param.get("queryKey").toString())){
			sqlBuff.append("AND( T.EMP_NO LIKE '%"+param.get("queryKey").toString()+"%' OR EMP_NAME LIKE '%"+param.get("queryKey").toString()+"%' OR LOGIN_NAME LIKE '%"+param.get("queryKey").toString()+"%')");
		}
		return sqlBuff.toString();
	}
	
	
	private String getRoleParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		if(param.get("queryKey")!=null&&StringUtils.isNotBlank(param.get("queryKey").toString())){
			sqlBuff.append("AND (T.ROLE_NAME LIKE '%"+param.get("queryKey").toString()+"%' OR ROLE_CODE LIKE '%"+param.get("queryKey").toString()+"%')");
		}
		return sqlBuff.toString();
	}


	/**
	 * 
	 * 获取筛选
	 * @author: wyc
	 * @createTime: 2019年4月9日 上午10:42:05
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getUserListCountByRoleId(Map<String, Object> param) {
		String sql="";
		//未授权
		if(param.get("isWait")!=null&&StringUtils.isNotBlank(param.get("isWait").toString())&&"0".equals(param.get("isWait").toString())){
			sql="SELECT COUNT(1)\n" +
					"  FROM T_ERP_USER T\n" + 
					" WHERE T.ID NOT IN (SELECT S.USER_ID\n" + 
					"                      FROM T_ERP_USER_ROLE S\n" + 
					"                     WHERE S.DATA_STATE = '1'\n" + 
					"                       AND S.ROLE_ID =?)\n"+getParamSql(param);
		}else{
			sql="SELECT COUNT(1)\n" +
					"  FROM T_ERP_USER T\n" + 
					" WHERE T.ID  IN (SELECT S.USER_ID\n" + 
					"                      FROM T_ERP_USER_ROLE S\n" + 
					"                     WHERE S.DATA_STATE = '1'\n" + 
					"                       AND S.ROLE_ID = ?)\n"+getParamSql(param);
		}
		return  jdbcTemplate.queryForObject(sql,new String[]{param.get("roleId").toString()},Long.class);
	}

	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2019年4月9日 上午10:41:53
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> getPagerUserListByRoleId(EUIPager ePager, Map<String, Object> param) {
		String  querySql="";
		//未授权
		if(param.get("isWait")!=null&&StringUtils.isNotBlank(param.get("isWait").toString())&&"0".equals(param.get("isWait").toString())){
			querySql="SELECT *\n" +
							"  FROM T_ERP_USER T\n" + 
							" WHERE T.DATA_STATE='1' AND T.ID NOT IN (SELECT S.USER_ID\n" + 
							"                      FROM T_ERP_USER_ROLE S\n" + 
							"                     WHERE S.DATA_STATE = '1'\n" + 
							"                       AND S.ROLE_ID = ?)\n"+getParamSql(param);

		}else{
			querySql="SELECT *\n" +
					"  FROM T_ERP_USER T\n" + 
					" WHERE T.DATA_STATE='1' AND T.ID IN (SELECT S.USER_ID\n" + 
					"                      FROM T_ERP_USER_ROLE S\n" + 
					"                     WHERE S.DATA_STATE = '1'\n" + 
					"                       AND S.ROLE_ID = ?)\n"+getParamSql(param);
		}
		
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpUser> list = jdbcTemplate.query(sql,new Object[]{param.get("roleId").toString(),ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpUser.class));
		return list;
	}

	
	public ErpUserRole findByUserIdAndRoleId(String userId, String roleId) {
		String sql="SELECT * FROM t_erp_user_role S WHERE S.USER_ID=? AND S.ROLE_ID=? AND S.DATA_STATE='1'";
		List<ErpUserRole> list = jdbcTemplate.query(sql,new Object[]{userId,roleId},new BeanPropertyRowMapper(ErpUserRole.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}


	public Long getRoleListCountByUserId(Map<String, Object> param) {
		String sql="";
		if(param.get("isWait")!=null&&StringUtils.isNotBlank(param.get("isWait").toString())&&"0".equals(param.get("isWait").toString())){
			sql="SELECT COUNT(1)\n" +
							"  FROM T_ERP_ROLE T\n" + 
							" WHERE T.DATA_STATE = '1'\n" + 
							"   AND T.ID NOT IN (SELECT S.ROLE_ID\n" + 
							"                      FROM T_ERP_USER_ROLE S\n" + 
							"                     WHERE S.DATA_STATE = '1'\n" + 
							"                       AND S.USER_ID = ?)"+getRoleParamSql(param);

		}else{
			sql="SELECT COUNT(1)\n" +
					"  FROM T_ERP_ROLE T\n" + 
					" WHERE T.DATA_STATE = '1'\n" + 
					"   AND T.ID IN (SELECT S.ROLE_ID\n" + 
					"                      FROM T_ERP_USER_ROLE S\n" + 
					"                     WHERE S.DATA_STATE = '1'\n" + 
					"                       AND S.USER_ID = ?)"+getRoleParamSql(param);
		}
		return  jdbcTemplate.queryForObject(sql,new String[]{param.get("userId").toString()},Long.class);
	}


	public List<?> getPagerRoleListByUserId(EUIPager ePager, Map<String, Object> param) {
		String  querySql="";
		//未授权
		if(param.get("isWait")!=null&&StringUtils.isNotBlank(param.get("isWait").toString())&&"0".equals(param.get("isWait").toString())){
			querySql="SELECT *\n" +
							"  FROM T_ERP_ROLE T\n" + 
							" WHERE T.DATA_STATE = '1'\n" + 
							"   AND T.ID NOT IN (SELECT S.ROLE_ID\n" + 
							"                      FROM T_ERP_USER_ROLE S\n" + 
							"                     WHERE S.DATA_STATE = '1'\n" + 
							"                       AND S.USER_ID = ?)"+getRoleParamSql(param);


		}else{
			querySql="SELECT *\n" +
					"  FROM T_ERP_ROLE T\n" + 
					" WHERE T.DATA_STATE = '1'\n" + 
					"   AND T.ID  IN (SELECT S.ROLE_ID\n" + 
					"                      FROM T_ERP_USER_ROLE S\n" + 
					"                     WHERE S.DATA_STATE = '1'\n" + 
					"                       AND S.USER_ID = ?)"+getRoleParamSql(param);
		}
		
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ErpRole> list = jdbcTemplate.query(sql,new Object[]{param.get("userId").toString(),ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(ErpRole.class));
		return list;
	}
}
