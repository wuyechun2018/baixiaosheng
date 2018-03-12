package com.bxs.service;
import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Config;
import com.bxs.pojo.ConfigInfoVo;

public interface ConfigService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(Config config);

	void delete(String id);

	public List<ConfigInfoVo> getConfigByTypeCode(String configTypeCode);
}
