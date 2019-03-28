package com.bxs.service.ierp;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpLog;

public interface ErpLogService {

	void save(ErpLog erpLog);

	void delete(String id);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

}
