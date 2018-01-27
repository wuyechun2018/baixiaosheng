package com.bxs.service;
import java.util.List;
import com.bxs.pojo.SysUser;

public interface UserService {
	public List<SysUser> getUserList();

	public void save(SysUser user);

	public SysUser getUserById(String id);

	public void delete(String id);

}
