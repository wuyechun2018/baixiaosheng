package com.bxs.service.impl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.LinkDao;
import com.bxs.pojo.Link;
import com.bxs.service.LinkService;

@Service
public class LinkServiceImpl implements LinkService {

	@Autowired
	private LinkDao linkDao;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(linkDao.getTotalCount(param));
		grid.setRows(linkDao.pagerLinkList(ePager,param));
		return grid;
	}


	@Override
	public void save(Link link) {
		link.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(link.getId())) {
			linkDao.update(link);
		} else {
		// 保存操作
			linkDao.save(link);
		}
		
	}

	@Override
	public void delete(String id) {
		linkDao.delete(id);
	}
}
