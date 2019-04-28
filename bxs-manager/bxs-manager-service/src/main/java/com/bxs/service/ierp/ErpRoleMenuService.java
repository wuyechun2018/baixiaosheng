package com.bxs.service.ierp;

import java.util.List;

import com.bxs.common.vo.EUITree;
import com.bxs.pojo.jpa.ierp.ErpRoleMenu;

public interface ErpRoleMenuService {

	List<EUITree> getErpMenuListByPid(String roleId, String pid);

	List<ErpRoleMenu> getErpRoleMenuListByRoleId(String roleId);

	void save(ErpRoleMenu erpRoleMenu);

}
