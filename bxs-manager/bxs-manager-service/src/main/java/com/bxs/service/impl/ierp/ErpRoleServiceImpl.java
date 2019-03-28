package com.bxs.service.impl.ierp;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpRole;
import com.bxs.service.ierp.ErpRoleService;

@Service
public class ErpRoleServiceImpl implements ErpRoleService {

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		return null;
	}

	@Override
	public Object save(ErpRole erpRole) {
		return null;
	}

	@Override
	public Object delete(String id) {
		return null;
	}

}
