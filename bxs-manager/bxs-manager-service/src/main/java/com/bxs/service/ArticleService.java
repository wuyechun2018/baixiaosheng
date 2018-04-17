package com.bxs.service;

import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;

public interface ArticleService {

	String save(Article article);

	List<Article> getList();

	Article getArticleById(String id);

	void delete(String id);

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);
	
	/**
	 * 
	 * 分页列表，用于多处，是对"pagerList"方法的优化
	 * @author: wyc
	 * @createTime: 2018年3月20日 下午8:45:54
	 * @history:
	 * @param ePager
	 * @param param
	 * @return EUIGrid
	 */
	EUIGrid pagerListFast(EUIPager ePager, Map<String, Object> param);
	
	EUIGrid loadSytjArticle(EUIPager ePager, Map<String, Object> param);
	
	EUIGrid pagerMiniList(EUIPager ePager, Map<String, Object> param);
	
	EUIGrid pagerMiniListByDate(EUIPager ePager, Map<String, Object> param);

	ArticleInfoVo getArticleInfoById(String id);

	void saveFrontSliderState(Article article);

	void addViewCount(String id);

	void saveCheckState(Article article);

	void saveTopCount(Article article);

	void savePlusInfo(ArticleInfoVo article);

	void toTop(Article article);
	
	Long getTotalCountForOpt(Map<String, Object> param);

	EUIGrid searcheByKey(EUIPager ePager, Map<String, Object> param);
	
	public EUIGrid pagerListForSois(EUIPager ePager, Map<String, Object> param);

	boolean isAllSigned(String articleId);
}
