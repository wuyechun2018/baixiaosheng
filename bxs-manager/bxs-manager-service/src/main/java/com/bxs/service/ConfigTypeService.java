package com.bxs.service;

import java.util.List;

import com.bxs.common.vo.EUITree;
import com.bxs.pojo.ConfigType;

public interface ConfigTypeService {

	List<EUITree> getListByPid(String pid);

	void save(ConfigType configType);

	void delete(String id);

}
