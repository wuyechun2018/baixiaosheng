package com.bxs.service.ierp;

import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.EUITree;
import com.bxs.pojo.jpa.ierp.ErpOrg;

public interface ErpOrgService {

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	List<EUITree> getListByPid(String pid);

	void save(ErpOrg erpOrg);

	void delete(String id);

}
