package com.bxs.service.impl.ierp;

import org.bxs.jpa.BizAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.pojo.jpa.ierp.BizAccount;
import com.bxs.service.ierp.BizAccountService;

@Service
public class BizAccountServiceImpl implements BizAccountService{

	@Autowired
	private BizAccountRepository bizAccountRepository;
	
	@Override
	public void save(BizAccount bizAccount) {
		bizAccountRepository.save(bizAccount);
	}

}
