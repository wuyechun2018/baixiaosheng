package com.bxs.service.impl.ierp;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpUserRole;
import com.bxs.service.ierp.ErpUserRoleService;

@Service
public class ErpUserRoleServiceImpl implements ErpUserRoleService{

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		return null;
	}

	@Override
	public Object save(ErpUserRole erpUserRole) {
		return null;
	}

	@Override
	public Object delete(String id) {
		return null;
	}

}
