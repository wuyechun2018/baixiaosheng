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
	
	
	public List<User> getUserList(){
		return userDao.getUserList();
	}
}
