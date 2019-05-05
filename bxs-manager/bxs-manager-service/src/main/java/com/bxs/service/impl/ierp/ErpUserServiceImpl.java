package com.bxs.service.impl.ierp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.bxs.jpa.ErpUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpUserDao;
import com.bxs.pojo.PostInfoVo;
import com.bxs.pojo.jpa.ierp.ErpUser;
import com.bxs.service.ierp.ErpUserService;

@Service
public class ErpUserServiceImpl implements ErpUserService{

	@Autowired
	private ErpUserRepository erpUserRepository;
	
	@Autowired
	private ErpUserDao erpUserDao;
	
	
	@Override
	public void save(ErpUser erpUser) {
		erpUserRepository.save(erpUser);
	}


	@Override
	public List<ErpUser> getUserByLoginName(String username) {
		return erpUserDao.getUserByLoginName(username);
	}


	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpUserDao.getTotalCount(param));
		grid.setRows(erpUserDao.getPagerList(ePager,param));
		return grid;
	}


	@Override
	public List<EUICombobox> getUserComboboxData(Map<String,Object> param) {
		List<EUICombobox> result=new ArrayList<EUICombobox>();
		List<ErpUser> list=erpUserDao.getUserList(param);
		for (ErpUser erpUser : list) {
			EUICombobox combo=new EUICombobox();
			combo.setId(erpUser.getId());
			combo.setText(erpUser.getEmpName());
			result.add(combo);
		}
		return result;
	}


	@Override
	public ErpUser getErpUserById(String id) {
		return erpUserRepository.findOne(id);
	}

}
