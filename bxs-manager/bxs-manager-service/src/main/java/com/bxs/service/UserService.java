package com.bxs.service;
import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.UserInfoVo;

public interface UserService {
	public List<SysUser> getUserList();

	public String  save(SysUser user);

	public SysUser getUserById(String id);

	public void delete(String id);

	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public List<UserInfoVo> getUserByLoginName(String username);
	
	public List<SysUser> getUserByEmail(String email);
	
	public List<UserInfoVo> getUserByMobilePhone(String mobilePhone);
	
	public List<UserInfoVo> getUserByLoginNameOrMobilePhone(String username);

	public List<SysUser> getUserListByBirthday(String dayStr);

	public List<SysUser> getUserWhoLoginNameIsNull();

	public void updateUserInfo(SysUser user);

	public void resetPwd(String id, String password);

	public List<EUICombobox> getUserComboboxData();

}
