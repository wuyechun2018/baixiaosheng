package com.bxs.service.ierp;

import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.ierp.ErpUser;

public interface ErpUserService {

	void save(ErpUser erpUser);

	List<ErpUser> getUserByLoginName(String username);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	List<EUICombobox> getUserComboboxData();

}
