package com.bxs.service.impl;
import org.bxs.jpa.SysUserExtendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.pojo.jpa.SysUserExtend;
import com.bxs.service.SysUserExtendService;

@Service
public class SysUserExtendServiceImpl implements SysUserExtendService{
	
	@Autowired
    private SysUserExtendRepository sysUserExtendRepository;

	@Override
	public void save(SysUserExtend userExtend) {
		sysUserExtendRepository.save(userExtend);
	}
}
