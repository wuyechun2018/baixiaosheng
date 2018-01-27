package com.bxs.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.UserDao;
import com.bxs.pojo.SysUser;
import com.bxs.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public List<SysUser> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public void save(SysUser user) {
		// 更新操作
		if (user.getId() != null) {
			userDao.update(user);
		} else {
			// 保存操作
			userDao.save(user);
		}

	}

	@Override
	public SysUser getUserById(String id) {
		return userDao.findOne(id);
	}

	@Override
	public void delete(String id) {
		userDao.delete(id);		
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(userDao.getTotalCount(param));
		grid.setRows(userDao.getUserList(ePager,param));
		return grid;
	}
}
