package com.bxs.service.ierp;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpRole;

public interface ErpRoleService {

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	Object save(ErpRole erpRole);

	Object delete(String id);

}
