package com.bxs.service.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ArticleCountDao;
import com.bxs.jdbc.ArticleDao;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
    private ArticleDao articleDao;
	@Autowired
	private ArticleCountDao articleCountDao;
	
	public String save(Article article){
		//设置为在用
		article.setDataState(DataState.Use.getCode());
		article.setDisplayOrder(0);
		//更新操作
		if(StringUtils.isNotBlank(article.getId())){
			//更新时间
			article.setUpdateDate(new Date());
			//一些原有属性要保存
			Article existArticle=getArticleById(article.getId());
			//文章类型
			article.setArticleType(existArticle.getArticleType());
			//创建时间
			article.setCreateDate(existArticle.getCreateDate());
			//查看次数
			article.setViewCount(existArticle.getViewCount());
			//推荐值
			article.setTopCount(existArticle.getTopCount());
			//发布部门ID
			article.setPublishDeptId(existArticle.getPublishDeptId());
			//发布人ID
			article.setPublishUserId(existArticle.getPublishUserId());
			//首页推荐
			article.setFrontSliderState(existArticle.getFrontSliderState());
			//文章审核状态(0:未审核 1:审核通过),修改后需要重新审核。
			article.setCheckState("0");
			articleDao.update(article);
			return article.getId();
		}else{
			//保存操作	
			//初始化浏览次数为0
			article.setViewCount(0);
			//推荐值 
			article.setTopCount(0);
			//创建时间
			article.setCreateDate(new Date());
			//更新时间
			article.setUpdateDate(new Date());
			//文章审核状态(0:未审核 1:审核通过),默认未审核
			article.setCheckState("0");
			//首页推荐,默认不推荐
			article.setFrontSliderState("0");
			return articleDao.save(article);
		}
		
	}

	@Override
	public List<Article> getList() {
		return articleDao.getList();
	}

	@Override
	public Article getArticleById(String id) {
		return articleDao.findOne(id);
	}

	@Override
	public void delete(String id) {
		articleDao.delete(id);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//只有 page 和 rows 两个参数,无其它筛选条件
		if(CommonUtil.getEffectParamCount(param)==2){
			List<ArticleCount> list=articleCountDao.getListByTopicCode("TOTAL");
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCount(param));
			}
		}else{
			grid.setTotal(articleDao.getTotalCount(param));
		}
		grid.setRows(articleDao.pagerArticleList(ePager,param));
		return grid;
	}
	
	@Override
	public EUIGrid loadSytjArticle(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(articleDao.getSytjTotalCount(param));
		grid.setRows(articleDao.pagerSytjArticleList(ePager,param));
		return grid;
	}
	
	
	@Override
	public EUIGrid pagerMiniList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//grid.setTotal(articleDao.getTotalCount(param));
		//grid.setRows(articleDao.pagerMiniArticleList(ePager,param));
		grid.setTotal(articleDao.getTotalCountForOpt(param));
		grid.setRows(articleDao.pagerMiniArticleListForOpt(ePager,param));
		return grid;
	}
	

	@Override
	public ArticleInfoVo getArticleInfoById(String id) {
		return articleDao.getArticleInfoById(id);
	}

	@Override
	public void saveFrontSliderState(Article article) {
		articleDao.saveFrontSliderState(article);
	}

	@Override
	public void addViewCount(String id) {
		Article article=articleDao.findOne(id);
		article.setViewCount(article.getViewCount()+1);
		articleDao.update(article);
	}

	@Override
	public void saveCheckState(Article article) {
		articleDao.saveCheckState(article);
	}

	@Override
	public void saveTopCount(Article article) {
		articleDao.saveTopCount(article);
	}

	@Override
	public void savePlusInfo(ArticleInfoVo article) {
		articleDao.savePlusInfo(article);
	}

	@Override
	public void toTop(Article article) {
		articleDao.toTop(article);
	}

	@Override
	public Long getTotalCountForOpt(Map<String, Object> param) {
		return articleDao.getTotalCountForOpt(param);
	}

	
	
}
