package com.bxs.service.impl.ierp;

import java.util.Map;

import org.bxs.jpa.BizAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpAccountDao;
import com.bxs.pojo.jpa.ierp.ErpAccount;
import com.bxs.service.ierp.ErpAccountService;

@Service
public class ErpAccountServiceImpl implements ErpAccountService{

	@Autowired
	private BizAccountRepository bizAccountRepository;
	
	@Autowired
	private ErpAccountDao bizAccountDao;
	
	@Override
	public void save(ErpAccount bizAccount) {
		bizAccountRepository.save(bizAccount);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(bizAccountDao.getTotalCount(param));
		grid.setRows(bizAccountDao.pagerList(ePager,param));
		return grid;
	}

	@Override
	public void delete(String id) {
		//逻辑删除
		ErpAccount bizAccount=bizAccountRepository.findOne(id);
		bizAccount.setDataState("0");
		bizAccountRepository.save(bizAccount);
	}

}
