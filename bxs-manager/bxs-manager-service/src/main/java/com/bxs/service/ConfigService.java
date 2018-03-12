package com.bxs.service;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Config;

public interface ConfigService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(Config config);

	void delete(String id);
}
