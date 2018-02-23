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
	
	EUIGrid pagerMiniList(EUIPager ePager, Map<String, Object> param);

	ArticleInfoVo getArticleInfoById(String id);

	void saveFrontSliderState(Article article);

	void addViewCount(String id);

	void saveCheckState(Article article);

	void saveTopCount(Article article);

	void savePlusInfo(ArticleInfoVo article);
}
