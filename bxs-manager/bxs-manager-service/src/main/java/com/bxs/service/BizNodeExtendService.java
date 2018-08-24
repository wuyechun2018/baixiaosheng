package com.bxs.service;
import java.util.List;

import com.bxs.pojo.jpa.BizNodeExtend;

public interface BizNodeExtendService {

	BizNodeExtend save(BizNodeExtend bizNodeExtend);

	List<BizNodeExtend> getListByMainNodeId(String mainNodeId);

	BizNodeExtend getNodeExtendById(String id);

}
