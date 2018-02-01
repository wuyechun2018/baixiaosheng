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
import com.bxs.jdbc.LinkTypeDao;
import com.bxs.pojo.LinkType;
import com.bxs.service.LinkTypeService;

@Service
public class LinkTypeServiceImpl implements LinkTypeService {
	
	@Autowired
    private LinkTypeDao linkTypeDao;

	@Override
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<LinkType> linkTypeList=linkTypeDao.getListByPid(pid);
		for (LinkType linkType : linkTypeList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(linkType.getId());
			easyTree.setText(linkType.getLinkTypeName());
			easyTree.setState(hasChild(linkType.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", linkType.getPid());
			attr.put("linkTypeCode", linkType.getLinkTypeCode());
			attr.put("linkTypeDesc", linkType.getLinkTypeDesc());
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

	private boolean hasChild(String id) {
		List<LinkType> list=linkTypeDao.getListByPid(id);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void save(LinkType linkType) {
		linkType.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(linkType.getId())) {
			linkTypeDao.update(linkType);
		} else {
			// 保存操作
			linkTypeDao.save(linkType);
		}

	}

	@Override
	public void delete(String id) {
		linkTypeDao.delete(id);
	}

}
