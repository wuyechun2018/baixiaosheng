package com.bxs.service.impl;
import java.util.List;

import org.bxs.jpa.BizNodeExtendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.jdbc.BizNodeDao;
import com.bxs.jdbc.BizNodeExtendDao;
import com.bxs.pojo.jpa.BizNodeExtend;
import com.bxs.service.BizNodeExtendService;

@Service
public class BizNodeExtendServiceImpl implements BizNodeExtendService {

	@Autowired
    private BizNodeExtendRepository bizNodeRepository;
	
	@Autowired
	private BizNodeExtendDao bizNodeDao;
	
	@Override
	public BizNodeExtend save(BizNodeExtend bizNodeExtend) {
		return bizNodeRepository.save(bizNodeExtend);
	}

	@Override
	public List<BizNodeExtend> getListByMainNodeId(String mainNodeId) {
		return bizNodeDao.getListByMainNodeId(mainNodeId);
	}

	@Override
	public BizNodeExtend getNodeExtendById(String id) {
		return bizNodeRepository.findOne(id);
	}

}
