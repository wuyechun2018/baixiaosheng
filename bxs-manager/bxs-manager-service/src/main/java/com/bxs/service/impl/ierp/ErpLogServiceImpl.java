package com.bxs.service.impl.ierp;
import java.util.Map;

import org.bxs.jpa.ErpLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpLogDao;
import com.bxs.pojo.jpa.ierp.ErpLog;
import com.bxs.service.ierp.ErpLogService;

@Service
public class ErpLogServiceImpl implements ErpLogService {
	
	@Autowired
	private ErpLogRepository erpLogRepository;
	
	@Autowired
	private ErpLogDao erpLogDao;
	
	@Override
	public void save(ErpLog erpLog) {
		erpLogRepository.save(erpLog);
	}

	@Override
	public void delete(String id) {
		erpLogRepository.delete(id);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpLogDao.getTotalCount(param));
		grid.setRows(erpLogDao.getPagerList(ePager,param));
		return grid;
	}

}
