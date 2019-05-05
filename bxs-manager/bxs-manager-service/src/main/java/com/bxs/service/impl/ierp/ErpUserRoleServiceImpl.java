package com.bxs.service.impl.ierp;
import java.util.List;
import java.util.Map;

import org.bxs.jpa.ErpUserRoleRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpUserRoleDao;
import com.bxs.pojo.jpa.ierp.ErpRole;
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

	/**
	 * 根据用户Id获取已授权/未授权的角色分页列表
	 */
	@Override
	public EUIGrid getRoleListByUserId(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpUserRoleDao.getRoleListCountByUserId(param));
		grid.setRows(erpUserRoleDao.getPagerRoleListByUserId(ePager,param));
		return grid;
	}

	@Override
	public String getRoleCodeStrByUserId(String userId) {
		String roleCodeStr="";
		List<ErpRole> roleCodeList=erpUserRoleDao.getRoleListByUserId(userId);
		for (int i = 0; i < roleCodeList.size(); i++) {
			String code=roleCodeList.get(i).getRoleCode();
			roleCodeStr=roleCodeStr+code+",";
		}
		roleCodeStr=roleCodeStr.substring(0, roleCodeStr.lastIndexOf(","));
		return roleCodeStr;
	}

}
