package com.bxs.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.UserDao;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.UserInfoVo;
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
		//设置为有效
		user.setDataState(DataState.Use.getCode());
		user.setLoginTime(new Date());
		//将密码进行MD5加密保存到数据库中
		user.setLoginPassword(EncryptionUtil.getMd5String(user.getLoginPassword()));
		
		// 更新操作
		if (StringUtils.isNotBlank(user.getId())) {
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
		grid.setRows(userDao.pagerUserList(ePager,param));
		return grid;
	}

	@Override
	public List<UserInfoVo> getUserByLoginName(String username) {
		return userDao.getUserByLoginName(username);
	}
}
