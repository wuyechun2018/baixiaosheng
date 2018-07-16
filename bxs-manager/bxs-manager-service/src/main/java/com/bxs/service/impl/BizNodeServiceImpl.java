package com.bxs.service.impl;

import org.bxs.jpa.BizNodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bxs.pojo.jpa.BizNode;
import com.bxs.service.BizNodeService;

@Service
public class BizNodeServiceImpl implements BizNodeService{
	
	@Autowired
    private BizNodeRepository bizNodeRepository;
	
	
	//@Transactional
	public void save(BizNode bizNode){
 		bizNodeRepository.save(bizNode);
	}
	
	
}
