package com.bxs.service;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.InfoRank;
import com.bxs.pojo.UserInfoVo;

public interface InfoRankService {

	void initData(String statYear,String statArticleType,UserInfoVo info);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	void save(InfoRank infoRank,UserInfoVo info);

}
