package com.bxs.service.impl.business;

import org.bxs.jpa.ShopRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.pojo.jpa.business.Shop;
import com.bxs.service.business.ShopService;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopRepository shopRepository;

	@Override
	public void save(Shop shop) {
		shopRepository.save(shop);
	}
}
