package com.bxs.service.impl;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.jdbc.SignDao;
import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;
import com.bxs.service.SignService;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	private SignDao signDao;
	
	
	@Override
	public void save(Sign sign) {
		//设置为有效
		sign.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(sign.getId())) {
			sign.setUpdateDate(new Date());
			signDao.update(sign);
		} else {
			// 保存操作
			sign.setCreateDate(new Date());
			sign.setUpdateDate(new Date());
			signDao.save(sign);
		}
		
	}

	@Override
	public void delete(String id) {
		signDao.delete(id);
	}

	@Override
	public List<SignInfoVo> getSignListByArticleId(String id) {
		return signDao.getSignListByArticleId(id);
	}

	@Override
	public void deleteSignByArticleId(String articleId) {
		signDao.deleteSignByArticleId(articleId);
	}
	
}
