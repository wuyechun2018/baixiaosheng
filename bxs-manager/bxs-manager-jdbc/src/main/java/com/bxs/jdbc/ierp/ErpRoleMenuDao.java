package com.bxs.jdbc.ierp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.SysMenu;
import com.bxs.pojo.ierp.SysMenuVo;
import com.bxs.pojo.jpa.ierp.ErpRoleMenu;


@Repository
public class ErpRoleMenuDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<SysMenuVo> getErpMenuListByPid(String roleId, String pid) {
		String sql="SELECT T.*, IFNULL(S.ID, 0) AS checked\n" +
						"  FROM T_MENU T\n" + 
						"  LEFT JOIN (SELECT *\n" + 
						"               FROM T_ERP_ROLE_MENU\n" + 
						"              WHERE DATA_STATE = '1'\n" + 
						"                AND ROLE_ID = ?) S\n" + 
						"    ON T.ID = S.MENU_ID\n" + 
						" WHERE T.DATA_STATE = '1'\n" + 
						"   AND T.PID = ?";
		List<SysMenuVo> list = jdbcTemplate.query(sql,new Object[]{roleId,pid},new BeanPropertyRowMapper(SysMenuVo.class));
		return list;
	}

	public List<SysMenu> getMenuListByPid(String pid) {
		String sql="SELECT * FROM T_MENU T WHERE T.PID=? AND T.DATA_STATE='1'";
		List<SysMenu> list = jdbcTemplate.query(sql,new Object[]{pid},new BeanPropertyRowMapper(SysMenu.class));
		return list;
	}

	/**
	 * 
	 * 获取角色关联的菜单
	 * @author: wyc
	 * @createTime: 2019年4月12日 下午4:07:29
	 * @history:
	 * @param roleId
	 * @return List<ErpRoleMenu>
	 */
	public List<ErpRoleMenu> getErpRoleMenuListByRoleId(String roleId) {
		String sql="SELECT * FROM t_erp_role_menu t WHERE  t.data_state='1' AND t.role_id=?";
		List<ErpRoleMenu> list = jdbcTemplate.query(sql,new Object[]{roleId},new BeanPropertyRowMapper(ErpRoleMenu.class));
		return list;
	}
}
