package com.bxs.service;
import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.jpa.BizNodeExtend;

public interface BizNodeExtendService {

	BizNodeExtend save(BizNodeExtend bizNodeExtend);

	List<BizNodeExtend> getListByMainNodeId(String mainNodeId);

	BizNodeExtend getNodeExtendById(String id);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

}
