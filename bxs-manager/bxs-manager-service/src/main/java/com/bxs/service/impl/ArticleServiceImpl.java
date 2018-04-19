package com.bxs.service.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ArticleCountDao;
import com.bxs.jdbc.ArticleDao;
import com.bxs.jdbc.TopicDao;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.Topic;
import com.bxs.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
    private ArticleDao articleDao;
	@Autowired
	private ArticleCountDao articleCountDao;
	@Autowired
	private TopicDao topicDao;
	
	@CacheEvict(value="myCache", allEntries=true)  
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
	@CacheEvict(value="myCache", allEntries=true)
	public void delete(String id) {
		articleDao.delete(id);
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//为了提升大数据量下的查询速度，做了以下优化调整
		//只有 page 和 rows 两个参数,无其它筛选条件 
		if(CommonUtil.getEffectParamCount(param)==2){
			List<ArticleCount> list=articleCountDao.getListByTopicCode("TOTAL");
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCount(param));
			}
		}else if((CommonUtil.getEffectParamCount(param)==3&&(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())))){
			//或者 只有 page、rows和 topicId 三个参数
			Topic topic=topicDao.getTopicById(param.get("topicId").toString());
			List<ArticleCount> list=articleCountDao.getListByTopicCode(topic.getTopicCode());
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
	public EUIGrid pagerListForVideo(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//为了提升大数据量下的查询速度，做了以下优化调整
		//只有 page 和 rows 两个参数,无其它筛选条件 
		if(CommonUtil.getEffectParamCount(param)==2){
			List<ArticleCount> list=articleCountDao.getListByTopicCode("TOTAL");
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCount(param));
			}
		}else if((CommonUtil.getEffectParamCount(param)==3&&(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())))){
			//或者 只有 page、rows和 topicId 三个参数
			Topic topic=topicDao.getTopicById(param.get("topicId").toString());
			List<ArticleCount> list=articleCountDao.getListByTopicCode(topic.getTopicCode());
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCount(param));
			}
		}else{
			grid.setTotal(articleDao.getTotalCount(param));
		}
		grid.setRows(articleDao.pagerArticleListForVideo(ePager,param));
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
	@Cacheable(value="myCache", key="#param['frontSliderState'].toString()+#param['checkState'].toString()+#param['topicCode'].toString()+#param['articleTitle'].toString()+#ePager.page+''+#ePager.rows")
	//Method call: Attempted to call method toString() on null context object
	//@Cacheable(value="myCache", key="#{param['frontSliderState']!= null?param['frontSliderState'].toString():''}+#{param['checkState']!= null?param['checkState'].toString():''}+#{param['topicCode']!= null?param['topicCode'].toString():''}+#{param['articleTitle']!= null?param['articleTitle'].toString():''}+#ePager.page+''+#ePager.rows")
	public EUIGrid pagerMiniList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//grid.setTotal(articleDao.getTotalCount(param));
		//grid.setRows(articleDao.pagerMiniArticleList(ePager,param));
		grid.setTotal(articleDao.getTotalCountForOpt(param));
		//grid.setRows(articleDao.pagerMiniArticleListForOpt(ePager,param));
		grid.setRows(articleDao.pagerMiniArticleListFast(ePager,param));
		return grid;
	}
	
	
	@Override
	@Cacheable(value="myCache", key="#param['topicCode'].toString()")
	public EUIGrid pagerMiniListByDate(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//grid.setTotal(articleDao.getTotalCountForOpt(param));
		List<?> list=articleDao.pagerMiniListByDate(ePager,param);
		grid.setRows(list);
		grid.setTotal(Long.valueOf(list.size()));
		return grid;
	}
	

	@Override
	public ArticleInfoVo getArticleInfoById(String id) {
		return articleDao.getArticleInfoById(id);
	}

	@Override
	@CacheEvict(value="myCache", allEntries=true)
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
	@CacheEvict(value="myCache", allEntries=true)
	public void saveCheckState(Article article) {
		articleDao.saveCheckState(article);
	}

	@Override
	@CacheEvict(value="myCache", allEntries=true)
	public void saveTopCount(Article article) {
		articleDao.saveTopCount(article);
	}

	@Override
	public void savePlusInfo(ArticleInfoVo article) {
		articleDao.savePlusInfo(article);
	}

	@Override
	@CacheEvict(value="myCache", allEntries=true)
	public void toTop(Article article) {
		articleDao.toTop(article);
	}

	@Override
	public Long getTotalCountForOpt(Map<String, Object> param) {
		return articleDao.getTotalCountForOpt(param);
	}

	
	@Override
	@Cacheable(value="myCache", key="#param['articleTitle'].toString()+#param['articleType'].toString()+#param['topicId'].toString()+#param['articleTitle'].toString()+#param['publishDeptId'].toString()+#param['checkState'].toString()+#ePager.page+''+#ePager.rows")
	//@Cacheable(value="myCache", key="#{param['topicId']!= null?param['topicId'].toString():''}+#{param['frontSliderState']!= null?param['frontSliderState'].toString():''}+#{param['checkState']!= null?param['checkState'].toString():''}+#{param['topicCode']!= null?param['topicCode'].toString():''}+#{param['articleTitle']!= null?param['articleTitle'].toString():''}+#ePager.page+''+#ePager.rows")
	//@Cacheable(value="myCache", key="#{param['topicId']!= null?param['topicId'].toString():''}")
	//@Cacheable(value="myCache", key="#param['topicId'].toString()")
	public EUIGrid pagerListFast(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		//Date start=new Date();
		//grid.setTotal(articleDao.getTotalCountFast(param));
		if(CommonUtil.getEffectParamCount(param)==2){
			List<ArticleCount> list=articleCountDao.getListByTopicCode("TOTAL");
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCountFast(param));
			}
		}else if((CommonUtil.getEffectParamCount(param)==3&&(param.get("topicId")!=null&&StringUtils.isNotBlank(param.get("topicId").toString())&&!"1".equals(param.get("topicId").toString())))){
			//或者 只有 page、rows和 topicId 三个参数
			Topic topic=topicDao.getTopicById(param.get("topicId").toString());
			List<ArticleCount> list=articleCountDao.getListByTopicCode(topic.getTopicCode());
			if(!list.isEmpty()){
				ArticleCount articleCount=list.get(0);
				grid.setTotal(Long.valueOf(articleCount.getArticleCount()));
			}else{
				grid.setTotal(articleDao.getTotalCountFast(param));
			}
		}else{
			grid.setTotal(articleDao.getTotalCountFast(param));
		}
		//Date center=new Date();
		grid.setRows(articleDao.pagerArticleListFast(ePager,param));
		//Date end=new Date();
		//System.out.println("count--time:"+(center.getTime()-start.getTime())/1000);
		//System.out.println("list--time:"+(end.getTime()-center.getTime())/1000);
		return grid;
	}

	@Override
	@Cacheable(value="myCache", key="#param['topicId'].toString()+#param['articleTitle'].toString()+#param['publishDeptId'].toString()+#param['checkState'].toString()+#ePager.page+''+#ePager.rows")
	public EUIGrid searcheByKey(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		if(articleDao.getCountBySearchKey(param,true)>0){
			grid.setTotal(articleDao.getCountBySearchKey(param,true));
			grid.setRows(articleDao.searchByKey(ePager,param,true));
		}else{
			Date start=new Date();
			//grid.setTotal(articleDao.getCountBySearchKey(param,false));
			if(ePager.getRows()!=18){
				grid.setTotal(Long.valueOf(articleDao.getCountBySearchKeyFromList(param,false)));
			}
			Date center=new Date();
			System.out.println("getCountBySearchKey--time:"+(center.getTime()-start.getTime())/1000);
			if(ePager.getRows()!=10000){
				grid.setRows(articleDao.searchByKey(ePager,param,false));
			}
			Date end=new Date();
			System.out.println("searchByKey--time:"+(end.getTime()-center.getTime())/1000);
			
		}
		return grid;
	}

	
	
	public EUIGrid pagerListForSois(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(articleDao.getTotalCountFast(param));
		grid.setRows(articleDao.pagerArticleListFast(ePager,param));
		return grid;
	}

	@Override
	public boolean isAllSigned(String articleId) {
		Long count = articleDao.getNoSignedCount(articleId);
		if (count > 0) {
			return false;
		} else {
			return true;
		}
	}


	
	
}
