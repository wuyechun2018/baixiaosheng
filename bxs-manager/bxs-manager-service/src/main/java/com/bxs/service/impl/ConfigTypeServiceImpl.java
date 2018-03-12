package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.ConfigTypeDao;
import com.bxs.pojo.ConfigType;
import com.bxs.service.ConfigTypeService;

@Service
public class ConfigTypeServiceImpl implements ConfigTypeService {
	
	@Autowired
    private ConfigTypeDao configTypeDao;

	@Override
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<ConfigType> linkTypeList=configTypeDao.getListByPid(pid);
		for (ConfigType configType : linkTypeList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(configType.getId());
			easyTree.setText(configType.getConfigTypeName());
			easyTree.setState(hasChild(configType.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", configType.getPid());
			attr.put("configTypeCode", configType.getConfigTypeCode());
			attr.put("configTypeDesc", configType.getConfigTypeDesc());
			attr.put("configValueType", configType.getConfigValueType());
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

	private boolean hasChild(String id) {
		List<ConfigType> list=configTypeDao.getListByPid(id);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void save(ConfigType configType) {
		configType.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(configType.getId())) {
			configTypeDao.update(configType);
		} else {
			// 保存操作
			configTypeDao.save(configType);
		}

	}

	@Override
	public void delete(String id) {
		configTypeDao.delete(id);
	}

}
