package com.bxs.service.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ArticleDao;
import com.bxs.jdbc.DeptDao;
import com.bxs.jdbc.InfoRankDao;
import com.bxs.pojo.Dept;
import com.bxs.pojo.InfoRank;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.InfoRankService;

@Service
public class InfoRankServiceImpl implements InfoRankService {

	@Autowired
	private InfoRankDao infoRankDao;

	@Autowired
	private DeptDao deptDao;
	
	@Autowired
	private ArticleDao articleDao;

	@Override
	public void initData(String statYear,String statArticleType,UserInfoVo info) {
		// 获取部门数据
		List<Dept> deptList = deptDao.getListByPid("1");
		for (Dept dept : deptList) {
			// 不存在
			if (!isRecordExist(statYear, dept.getId())) {
				InfoRank rank = new InfoRank();
				rank.setDeptId(dept.getId());

				// 显示状态
				rank.setShowState("1");
				rank.setDataState(DataState.Use.getCode());
				rank.setCreateUserId(info.getId());
				rank.setUpdateUserId(info.getId());
				rank.setCreateDate(new Date());
				rank.setUpdateDate(new Date());
				rank.setStatYear(statYear);
				// 部门
				rank.setBumen(0);
				// 支队
				rank.setZhidui(articleDao.getCountByPublishDateAndTopic(statYear,statArticleType,dept.getId()));
				// 市局
				rank.setShiju(0);
				// 总队
				rank.setZongdui(0);
				// 省队
				rank.setShengdui(0);
				// 部局
				rank.setBuju(0);
				infoRankDao.save(rank);
			}
		}

	}

	private boolean isRecordExist(String statYear, String deptId) {
		Long count = infoRankDao.getTotalCountByStatYearAndDeptId(statYear, deptId);
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(infoRankDao.getTotalCount(param));
		grid.setRows(infoRankDao.pagerList(ePager, param));
		return grid;
	}

	@Override
	public void save(InfoRank infoRank,UserInfoVo info) {
		// 更新操作
		if (StringUtils.isNotBlank(infoRank.getId())) {
			infoRank.setUpdateUserId(info.getId());
			infoRank.setUpdateDate(new Date());
			infoRankDao.update(infoRank);
		} else {
			// 保存操作
			infoRankDao.save(infoRank);
		}
	}

}
