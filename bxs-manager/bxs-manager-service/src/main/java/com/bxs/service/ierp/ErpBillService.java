package com.bxs.service.ierp;
import java.util.Map;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpBill;

public interface ErpBillService {
	void save(ErpBill erpBill);
	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);
}
