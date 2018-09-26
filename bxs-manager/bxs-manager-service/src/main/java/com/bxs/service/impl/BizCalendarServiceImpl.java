package com.bxs.service.impl;
import java.util.List;

import org.bxs.jpa.BizCalendarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.jdbc.BizCalendarDao;
import com.bxs.pojo.jpa.BizCalendar;
import com.bxs.service.BizCalendarService;

@Service
public class BizCalendarServiceImpl implements BizCalendarService{
	
	@Autowired
    private BizCalendarRepository bizCalendarRepository;
	
	@Autowired
	private BizCalendarDao bizCalendarDao;
	
	
	
	
	@Override
	public BizCalendar save(BizCalendar bizCalendar) {
		return bizCalendarRepository.save(bizCalendar);
	}


	@Override
	public List<BizCalendar> list(String month,String userId) {
		return bizCalendarDao.list(month,userId);
	}


	@Override
	public BizCalendar findById(String id) {
		return bizCalendarRepository.findOne(id);
	}

}
