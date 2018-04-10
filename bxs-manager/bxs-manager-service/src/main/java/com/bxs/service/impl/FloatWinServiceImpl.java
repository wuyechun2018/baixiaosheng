package com.bxs.service.impl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.FloatWinDao;
import com.bxs.pojo.FloatWin;
import com.bxs.service.FloatWinService;

@Service
public class FloatWinServiceImpl implements FloatWinService {

	@Autowired
	private FloatWinDao floatWinDao;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(floatWinDao.getTotalCount(param));
		grid.setRows(floatWinDao.pagerList(ePager,param));
		return grid;
	}


	@Override
	public void save(FloatWin floatWin) {
		floatWin.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(floatWin.getId())) {
			floatWinDao.update(floatWin);
		} else {
		// 保存操作
			floatWinDao.save(floatWin);
		}
	}

	@Override
	public void delete(String id) {
		floatWinDao.delete(id);
	}
}
