package com.bxs.service;
import java.util.Map;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;

public interface PostService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

}
