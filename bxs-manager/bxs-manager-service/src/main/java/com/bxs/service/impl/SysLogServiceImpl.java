package com.bxs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.jdbc.SysLogDao;
import com.bxs.pojo.SysLog;
import com.bxs.service.SysLogService;

@Service
public class SysLogServiceImpl implements SysLogService{
	
	@Autowired
    private SysLogDao sysLogDao;
	
	/**
	 * 
	 * 保存操作日志
	 * @author: wyc
	 * @createTime: 2018年6月27日 上午10:59:07
	 * @history:
	 * @param sysLog void
	 */
	public void save(final SysLog sysLog) {
		sysLogDao.save(sysLog);
	}
	
}
