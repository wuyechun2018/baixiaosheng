package com.bxs.service;

import java.util.List;

import com.bxs.pojo.jpa.BizNode;

public interface BizNodeService {
	
	public BizNode save(BizNode bizNode);

	public List<BizNode> findNodeListByTypeCodeAndPid(String typeCode, String pid);

	public boolean isParent(String typeCode, String pid);

}
