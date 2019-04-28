package com.bxs.service.impl.ierp;
import java.util.Map;

import org.bxs.jpa.ErpUserRoleRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpUserRoleDao;
import com.bxs.pojo.jpa.ierp.ErpUserRole;
import com.bxs.service.ierp.ErpUserRoleService;

@Service
public class ErpUserRoleServiceImpl implements ErpUserRoleService{
	
	@Autowired
	private ErpUserRoleDao erpUserRoleDao;
	
	@Autowired
	private ErpUserRoleRespository erpUserRoleRespository;
	

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		return null;
	}

	@Override
	public void save(ErpUserRole erpUserRole) {
		erpUserRoleRespository.save(erpUserRole);
	}


	@Override
	public EUIGrid getUserListByRoleId(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpUserRoleDao.getUserListCountByRoleId(param));
		grid.setRows(erpUserRoleDao.getPagerUserListByRoleId(ePager,param));
		return grid;
	}

	@Override
	public void delete(String userId,String roleId) {
		ErpUserRole erpUserRole=erpUserRoleDao.findByUserIdAndRoleId(userId,roleId);
		erpUserRole.setDataState("0");
		erpUserRoleRespository.save(erpUserRole);
	}

}
