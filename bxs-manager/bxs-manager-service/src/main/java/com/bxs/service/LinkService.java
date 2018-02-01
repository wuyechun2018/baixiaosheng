package com.bxs.service;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Link;

public interface LinkService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(Link link);

	void delete(String id);
}
