package com.bxs.service.impl;

import java.util.List;

import org.bxs.jpa.BizNodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.jdbc.BizNodeDao;
import com.bxs.pojo.jpa.BizNode;
import com.bxs.service.BizNodeService;

@Service
public class BizNodeServiceImpl implements BizNodeService{
	
	@Autowired
    private BizNodeRepository bizNodeRepository;
	
	@Autowired
	private BizNodeDao bizNodeDao;
	
	
	//@Transactional
	public BizNode save(BizNode bizNode){
 		return bizNodeRepository.save(bizNode);
	}


	@Override
	public List<BizNode> findNodeListByTypeCodeAndPid(String typeCode, String pid) {
		return bizNodeRepository.findNodeListByTypeCodeAndPid(typeCode,pid);
	}


	@Override
	public boolean isParent(String typeCode, String pid) {
		return bizNodeDao.isParent(typeCode,pid);
	}


	@Override
	public BizNode findNodeById(String id) {
		return bizNodeRepository.findOne(id);
	}
	
	
}
