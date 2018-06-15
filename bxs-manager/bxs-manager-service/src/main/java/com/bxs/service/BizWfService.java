package com.bxs.service;

import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;

import com.bxs.pojo.BizWf;

public interface BizWfService {

	ProcessInstance startWorkflow(BizWf wfObj, Map<String, Object> variables);

}
