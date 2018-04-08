package com.bxs.service;
import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.UserRole;

public interface UserRoleService {
	
	void save(UserRole userRole);

	void delete(String id);
	
	void delete(String userId,String roleId);
	
	List<UserRole> findByUserIdAndRoleCode(String userId,String roleCode);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

}
