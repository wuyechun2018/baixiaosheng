package com.bxs.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.jdbc.RoleDao;
import com.bxs.pojo.Role;
import com.bxs.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
	
	/**
	 * 
	 * 根据角色编码
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午8:57:29
	 * @history:
	 * @param roleCode
	 * @return Role
	 */
	public Role getRoleByCode(String roleCode){
		return roleDao.getRoleByCode(roleCode);
	}
	
	
}
