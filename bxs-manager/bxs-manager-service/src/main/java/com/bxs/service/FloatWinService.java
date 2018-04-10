package com.bxs.service;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.FloatWin;

public interface FloatWinService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(FloatWin floatWin);

	void delete(String id);
}
