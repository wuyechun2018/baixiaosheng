package com.bxs.service;
import java.util.List;

import com.bxs.pojo.jpa.BizCalendar;

public interface BizCalendarService {

	BizCalendar save(BizCalendar bizCalendar);

	List<BizCalendar> list(String month,String userId);

	BizCalendar findById(String id);

}
