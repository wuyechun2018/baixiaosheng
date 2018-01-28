package com.bxs.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.PostDao;
import com.bxs.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(postDao.getTotalCount(param));
		grid.setRows(postDao.pagerPostList(ePager,param));
		return grid;
	}

}
