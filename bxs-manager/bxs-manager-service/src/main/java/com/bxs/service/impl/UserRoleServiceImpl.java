package com.bxs.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.UserRoleDao;
import com.bxs.pojo.UserRole;
import com.bxs.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService  {

	@Autowired
	private UserRoleDao userRoleDao;
	
	@Override
	public void save(UserRole userRole) {
		// 更新操作
		if (StringUtils.isNotBlank(userRole.getId())) {
			userRoleDao.update(userRole);
		} else {
		// 保存操作
			userRoleDao.save(userRole);
		}
		
	}

	@Override
	public void delete(String id) {
		userRoleDao.delete(id);
	}

	@Override
	public List<UserRole> findByUserIdAndRoleCode(String userId, String roleCode) {
		return userRoleDao.findByUserIdAndRoleCode(userId,roleCode);
	}

	@Override
	public void delete(String userId, String roleId) {
		userRoleDao.delete(userId, roleId);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(userRoleDao.getAuthorizedTotalCount(param));
		grid.setRows(userRoleDao.pagerAuthorizedList(ePager,param));
		return grid;
	}

}
