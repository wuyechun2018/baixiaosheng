package com.bxs.jdbc;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.SysMenu;

@Repository
public class SysMenuDao {
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<SysMenu> getListByPid(String pid) {
		
		String sql="SELECT * FROM t_menu T WHERE T.pid=? ORDER BY T.DISPLAY_ORDER";
		//经验总结：数据出现错误时，比如display_order字段为空时，解析为对象列表会出现错误，可以先解析成List<Map<String, Object>>,进行排错。
		//List<Map<String, Object>> menuList=jdbcTemplate.queryForList(sql, new Object[]{pid});
		List<SysMenu> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(SysMenu.class));
		return list;
	}

	public List<SysMenu> getListByPidAndUserId(String pid, String userId) {
		String sql="SELECT * FROM T_MENU W WHERE W.DATA_STATE='1' AND W.ID IN(\n" +
						"-- 子节点\n" + 
						"SELECT M.MENU_ID FROM t_erp_role_menu M WHERE M.DATA_STATE='1' AND M.ROLE_ID=(SELECT  ROLE_ID FROM T_USER_ROLE S WHERE S.DATA_STATE='1' AND S.USER_ID=?)\n" + 
						"UNION\n" + 
						"-- 父节点\n" + 
						"SELECT k.PID AS MENU_ID FROM T_MENU K WHERE K.ID IN(\n" + 
						"SELECT M.MENU_ID FROM t_erp_role_menu M WHERE M.DATA_STATE='1' AND M.ROLE_ID=(SELECT  ROLE_ID FROM T_USER_ROLE S WHERE S.DATA_STATE='1' AND S.USER_ID=?)\n" + 
						")\n" + 
						")AND W.PID=? ORDER BY display_order";


		List<SysMenu> list = jdbcTemplate.query(sql,new Object[]{userId,userId,pid},new BeanPropertyRowMapper(SysMenu.class));
		return list;
	}

}
