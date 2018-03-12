package com.bxs.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ConfigDao;
import com.bxs.pojo.Config;
import com.bxs.pojo.ConfigInfoVo;
import com.bxs.service.ConfigService;

@Service
public class ConfigServiceImpl implements ConfigService {

	@Autowired
	private ConfigDao configDao;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(configDao.getTotalCount(param));
		grid.setRows(configDao.pagerConfigList(ePager,param));
		return grid;
	}


	@Override
	public void save(Config config) {
		config.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(config.getId())) {
			configDao.update(config);
		} else {
		// 保存操作
			configDao.save(config);
		}
		
	}

	@Override
	public void delete(String id) {
		configDao.delete(id);
	}


	@Override
	public List<ConfigInfoVo> getConfigByTypeCode(String configTypeCode) {
		return configDao.getConfigByTypeCode(configTypeCode);
	}
}
