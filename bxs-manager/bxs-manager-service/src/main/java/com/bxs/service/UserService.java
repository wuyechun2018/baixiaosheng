package com.bxs.service;
import java.util.List;
import com.bxs.pojo.User;

public interface UserService {
	public List<User> getUserList();

	public void save(User user);

	public User getUserById(String id);

	public void delete(String id);

}
