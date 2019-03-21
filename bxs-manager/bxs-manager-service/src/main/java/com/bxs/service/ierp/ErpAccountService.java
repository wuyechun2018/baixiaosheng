package com.bxs.service.ierp;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpAccount;

public interface ErpAccountService {

	void save(ErpAccount bizAccount);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	void delete(String id);
	
}
