package com.bxs.service.impl.ierp;
import java.util.Map;

import org.bxs.jpa.ErpRoleRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpRoleDao;
import com.bxs.pojo.jpa.ierp.ErpRole;
import com.bxs.service.ierp.ErpRoleService;

@Service
public class ErpRoleServiceImpl implements ErpRoleService {
	
	@Autowired
	private ErpRoleDao erpRoleDao;
	
	@Autowired
	private  ErpRoleRespository erpRoleRespository;

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpRoleDao.getTotalCount(param));
		grid.setRows(erpRoleDao.getPagerList(ePager,param));
		return grid;
	}

	@Override
	public void save(ErpRole erpRole) {
		erpRoleRespository.save(erpRole);
	}

	@Override
	public void delete(String id) {
		ErpRole erpRole=erpRoleRespository.findOne(id);
		erpRole.setDataState("0");
		erpRoleRespository.save(erpRole);
	}

}
