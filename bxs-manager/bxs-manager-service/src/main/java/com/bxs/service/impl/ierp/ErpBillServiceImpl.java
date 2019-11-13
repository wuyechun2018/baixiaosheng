package com.bxs.service.impl.ierp;
import java.util.Map;

import org.bxs.jpa.ErpBillRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ierp.ErpBillDao;
import com.bxs.pojo.jpa.ierp.ErpBill;
import com.bxs.service.ierp.ErpBillService;

@Service
public class ErpBillServiceImpl implements ErpBillService{

	@Autowired
	private ErpBillRespository erpBillRespository;
	
	@Autowired
	private ErpBillDao erpBillDao;
	
	
	@Override
	public ErpBill save(ErpBill erpBill) {
		return erpBillRespository.save(erpBill);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpBillDao.getTotalCount(param));
		grid.setRows(erpBillDao.pagerList(ePager,param));
		return grid;
	}

	@Override
	public ErpBill getErpBillById(String id) {
		return erpBillRespository.findOne(id);
	}

}
