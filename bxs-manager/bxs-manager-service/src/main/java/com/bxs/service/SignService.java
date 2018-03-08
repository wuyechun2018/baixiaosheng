package com.bxs.service;
import java.util.List;
import java.util.Map;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;

public interface SignService {

	void save(Sign sign);

	void delete(String id);

	List<SignInfoVo> getSignListByArticleId(String id);

	void deleteSignByArticleId(String keyId);

	List<SignInfoVo> getSignListByArticleIdAndDeptId(String id, String deptId);

	void signArticle(Sign sign);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);
	
	EUIGrid pagerSignArticleList(EUIPager ePager, Map<String, Object> param);

	void submitFeedback(Sign sign);

}
