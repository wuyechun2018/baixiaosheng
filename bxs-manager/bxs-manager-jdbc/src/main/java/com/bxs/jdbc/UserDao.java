package com.bxs.jdbc;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.UserInfoVo;

@Repository
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private  final static String ALL_LIST_SQL = "SELECT * FROM T_USER WHERE DATA_STATE='1'";

	public List<SysUser> getUserList() {
		List<SysUser> list = jdbcTemplate.query(ALL_LIST_SQL,new BeanPropertyRowMapper(SysUser.class));
		return list;
	}

	

	/**
	 * 
	 * 保存用户信息
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午4:52:32
	 * @history:
	 * @param user void
	 */
	public void save(final SysUser user) {
		 /**
		 String insertSQL = "INSERT INTO T_USER (id, login_name, login_password, login_time,data_state) VALUES(?,?,?,?,?)";
		 jdbcTemplate.execute(insertSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, user.getLoginName());
			         ps.setString(3, user.getLoginPassword());
			         ps.setTimestamp(4, new java.sql.Timestamp(user.getLoginTime().getTime()));
			         ps.setString(5, user.getDataState());
			       }
			     }
			 );**/
		
		String sql="INSERT INTO t_user (\n" +
						"  id,\n" + 
						"  login_name,\n" + 
						"  login_password,\n" + 
						"  login_time,\n" + 
						"  data_state,\n" + 
						"  office_telephone,\n" + 
						"  mobile_phone,\n" + 
						"  user_name,\n" + 
						"  birthday,\n" + 
						"  dept_id,\n" + 
						"  post_id,\n" + 
						"  user_desc\n" + 
						")\n" + 
						"VALUES\n" + 
						"  (\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?\n" + 
						"  ) ;";

		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, UUID.randomUUID().toString());
			         ps.setString(2, user.getLoginName());
			         ps.setString(3, user.getLoginPassword());
			         ps.setTimestamp(4, new java.sql.Timestamp(user.getLoginTime().getTime()));
			         ps.setString(5, user.getDataState());
			         ps.setString(6, user.getOfficeTelephone());
			         ps.setString(7, user.getMobilePhone());
			         ps.setString(8, user.getUserName());
			         ps.setDate(9, new java.sql.Date(user.getBirthday().getTime()));
			         ps.setString(10, user.getDeptId());
			         ps.setString(11, user.getPostId());
			         ps.setString(12, user.getUserDesc());
			       }
			     }
			 );
	}
	
	/**
	 * 
	 * 更新系统用户
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午4:52:43
	 * @history:
	 * @param user void
	 */
	public void update(final SysUser user) {
		/**String updateSQL = "UPDATE T_USER SET login_name=?,login_password=?,login_time=?,data_state=? WHERE ID=?";
		 jdbcTemplate.execute(updateSQL,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			    	 ps.setString(1, user.getLoginName());
				     ps.setString(2, user.getLoginPassword());
				     ps.setTimestamp(3, new java.sql.Timestamp(user.getLoginTime().getTime()));
				     ps.setString(4, user.getDataState());
				     ps.setString(5, user.getId());
			       }
			     }
			 );**/
		
		String sql=	"UPDATE\n" +
						"  t_user\n" + 
						"SET\n" + 
						"  login_name = ?,\n" + 
						"  login_password = ?,\n" + 
						"  login_time = ?,\n" + 
						"  data_state = ?,\n" + 
						"  office_telephone = ?,\n" + 
						"  mobile_phone = ?,\n" + 
						"  user_name = ?,\n" + 
						"  birthday = ?,\n" + 
						"  dept_id = ?,\n" + 
						"  post_id = ?,\n" + 
						"  user_desc = ?\n" + 
						"WHERE id = ? ;";
		jdbcTemplate.execute(sql,
			     new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			       protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
			         ps.setString(1, user.getLoginName());
			         ps.setString(2, user.getLoginPassword());
			         ps.setTimestamp(3, new java.sql.Timestamp(user.getLoginTime().getTime()));
			         ps.setString(4, user.getDataState());
			         ps.setString(5, user.getOfficeTelephone());
			         ps.setString(6, user.getMobilePhone());
			         ps.setString(7, user.getUserName());
			         ps.setDate(8, new java.sql.Date(user.getBirthday().getTime()));
			         ps.setString(9, user.getDeptId());
			         ps.setString(10, user.getPostId());
			         ps.setString(11, user.getUserDesc());
			         ps.setString(12, user.getId());
			       }
			     }
			 );
		
		
		
	}



	/**
	 * 
	 * 根据ID查询用户信息
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午5:40:08
	 * @history:
	 * @param id
	 * @return User
	 */
	public SysUser findOne(String id) {
		List<SysUser> list = jdbcTemplate.query("SELECT * FROM T_USER WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(SysUser.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}



	/**
	 * 
	 * 逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午9:55:49
	 * @history:
	 * @param id void
	 */
	public void delete(String id) {
		String sql = "UPDATE T_USER SET DATA_STATE=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{DataState.Delete.getCode(),id});
	}


	/**
	 * 
	 *获取条件筛选后的记录总数
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:57:34
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT COUNT(1) FROM V_USER_INFO T WHERE 1=1 AND T.DATA_STATE='1'\n");
		
		//部门
		if(param.get("deptId")!=null&&StringUtils.isNotBlank(param.get("deptId").toString())&&!"1".equals(param.get("deptId").toString())){
			sqlBuff.append(" AND DEPT_ID = '" + param.get("deptId").toString() + "'\n");
		}
		
		//登录名或者姓名
		if(param.get("loginOrUserName")!=null&&StringUtils.isNotBlank(param.get("loginOrUserName").toString())){
			sqlBuff.append(" AND  (T.login_name LIKE '%"+param.get("loginOrUserName").toString()+"%' OR T.user_name LIKE '%"+param.get("loginOrUserName")+"%')\n");
		}
		
		//职务
		if(param.get("postName")!=null&&StringUtils.isNotBlank(param.get("postName").toString())){
			sqlBuff.append(" AND  T.post_name LIKE '%"+param.get("postName").toString()+"%' \n");
		}
		
		//办公电话或者手机号
		if(param.get("telephone")!=null&&StringUtils.isNotBlank(param.get("telephone").toString())){
			sqlBuff.append(" AND  (T.office_telephone LIKE '%"+param.get("telephone").toString()+"%' OR T.mobile_phone LIKE '%"+param.get("telephone")+"%')\n");
		}
		
		//生日
		if(param.get("birthday")!=null&&StringUtils.isNotBlank(param.get("birthday").toString())){
			sqlBuff.append(" AND  T.birthday LIKE '%"+param.get("birthday").toString()+"%' \n");
		}
		
		
		return  jdbcTemplate.queryForObject(sqlBuff.toString(),Long.class);
	}


	/**
	 * 
	 * 分页、条件 筛选列表
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:57:49
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerUserList(EUIPager ePager,Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer("SELECT * FROM V_USER_INFO T WHERE 1=1 AND T.DATA_STATE='1' \n");
		
		//部门
		if(param.get("deptId")!=null&&StringUtils.isNotBlank(param.get("deptId").toString())&&!"1".equals(param.get("deptId").toString())){
			sqlBuff.append(" AND DEPT_ID = '" + param.get("deptId").toString() + "'\n");
		}
		
		//登录名或者姓名
		if(param.get("loginOrUserName")!=null&&StringUtils.isNotBlank(param.get("loginOrUserName").toString())){
			sqlBuff.append(" AND  (T.login_name LIKE '%"+param.get("loginOrUserName").toString()+"%' OR T.user_name LIKE '%"+param.get("loginOrUserName")+"%')\n");
		}
		
		//职务
		if(param.get("postName")!=null&&StringUtils.isNotBlank(param.get("postName").toString())){
			sqlBuff.append(" AND  T.post_name LIKE '%"+param.get("postName").toString()+"%' \n");
		}
		
		//办公电话或者手机号
		if(param.get("telephone")!=null&&StringUtils.isNotBlank(param.get("telephone").toString())){
			sqlBuff.append(" AND  (T.office_telephone LIKE '%"+param.get("telephone").toString()+"%' OR T.mobile_phone LIKE '%"+param.get("telephone")+"%')\n");
		}
		
		//办公电话
		if(param.get("officeTelephone")!=null&&StringUtils.isNotBlank(param.get("officeTelephone").toString())){
			sqlBuff.append(" AND  T.office_telephone LIKE '%"+param.get("officeTelephone").toString()+"%' \n");
		}
		
		//手机号
		if(param.get("mobilePhone")!=null&&StringUtils.isNotBlank(param.get("mobilePhone").toString())){
			sqlBuff.append(" AND  T.mobile_phone LIKE '%"+param.get("mobilePhone")+"%'\n");
		}
		
		//生日
		if(param.get("birthday")!=null&&StringUtils.isNotBlank(param.get("birthday").toString())){
			sqlBuff.append(" AND  T.birthday LIKE '%"+param.get("birthday").toString()+"%' \n");
		}
		
		//注意MySQL的分页参数
		String sql="SELECT * FROM ("+sqlBuff.toString()+")S limit ?,?";
		List<UserInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(UserInfoVo.class));
		return list;
	}


	/**
	 * 
	 * 根据登录名获取用户信息列表
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午10:57:14
	 * @history:
	 * @param username
	 * @return List<UserInfoVo>
	 */
	public List<UserInfoVo> getUserByLoginName(String username) {
		String sql="SELECT * FROM V_USER_INFO T WHERE 1=1 AND T.DATA_STATE='1' AND T.LOGIN_NAME=?";
		List<UserInfoVo> list = jdbcTemplate.query(sql,new Object[]{username},new BeanPropertyRowMapper(UserInfoVo.class));
		return list;
	}



	public List<SysUser> getUserListByBirthday(String dayStr) {
		String sql="SELECT * FROM T_USER T WHERE T.birthday LIKE ? ";
		List<SysUser> list = jdbcTemplate.query(sql,new Object[]{"%"+dayStr+"%"},new BeanPropertyRowMapper(SysUser.class));
		return list;
	}


	/**
	 * 
	 * 获取登录名为空的用户
	 * @author: wyc
	 * @createTime: 2018年2月10日 上午11:17:48
	 * @history:
	 * @return List<SysUser>
	 */
	public List<SysUser> getUserWhoLoginNameIsNull() {
		String sql="SELECT * FROM t_user T WHERE login_name='' ";
		List<SysUser> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper(SysUser.class));
		return list;
	}



	/**
	 * 
	 * 更新用户信息
	 * @author: wyc
	 * @createTime: 2018年2月10日 上午11:24:32
	 * @history:
	 * @param user void
	 */
	public void updateUserInfo(SysUser user) {
		String sql="UPDATE T_USER T SET T.login_name=? WHERE ID=?";
		jdbcTemplate.update(sql,new Object[]{user.getLoginName(),user.getId()});
	}
	
	
}
