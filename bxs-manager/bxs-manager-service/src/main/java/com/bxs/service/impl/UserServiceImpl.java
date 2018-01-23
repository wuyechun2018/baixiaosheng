package com.bxs.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.jdbc.UserDao;
import com.bxs.pojo.User;
import com.bxs.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public List<User> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public void save(User user) {
		// 更新操作
		if (user.getId() != null) {
			userDao.update(user);
		} else {
			// 保存操作
			userDao.save(user);
		}

	}

	@Override
	public User getUserById(String id) {
		return userDao.findOne(id);
	}

	@Override
	public void delete(String id) {
		userDao.delete(id);		
	}
}
