package com.bxs.service.ierp;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpUserRole;

public interface ErpUserRoleService {

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	Object save(ErpUserRole erpUserRole);

	Object delete(String id);

}
