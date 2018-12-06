package com.bxs.service.impl;
import java.util.Map;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.jdbc.BizWfDao;
import com.bxs.pojo.BizWf;
import com.bxs.service.BizWfService;

@Service
public class BizWfServiceImpl implements BizWfService {
	
	private static final Logger logger =LoggerFactory.getLogger(BizWfServiceImpl.class);

	//@Autowired
	//private IdentityService identityService;
	
	//@Autowired
    //private RuntimeService runtimeService;
	
	@Autowired
	private BizWfDao bizWfDao;

	
	@Override
	public ProcessInstance startWorkflow(BizWf wfObj, Map<String, Object> variables) {
		//淇濆瓨,杩斿洖涓氬姟Id
		String businessKey =bizWfDao.save(wfObj);
		ProcessInstance processInstance = null;
		try {
			//identityService.setAuthenticatedUserId(wfObj.getUserId());
			//processInstance = runtimeService.startProcessInstanceByKey(wfObj.getBizTypeName(), businessKey, variables);
			String processInstanceId = processInstance.getId();
			wfObj.setProcessInstanceId(processInstanceId);
			logger.debug("start process of {key={}, bkey={}, pid={}, variables={}}",new Object[] { "leave", businessKey, processInstanceId, variables });
		} finally {
			//identityService.setAuthenticatedUserId(null);
		}
		return processInstance;
	}

}
