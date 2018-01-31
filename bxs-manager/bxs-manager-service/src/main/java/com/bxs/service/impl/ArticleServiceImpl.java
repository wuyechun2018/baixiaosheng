package com.bxs.service.impl;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.ArticleDao;
import com.bxs.pojo.Article;
import com.bxs.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
    private ArticleDao articleDao;
	
	public void save(Article article){
		//更新操作
		if(StringUtils.isNotBlank(article.getId())){
			articleDao.update(article);
		}else{
			//保存操作	
			articleDao.save(article);
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
		grid.setTotal(articleDao.getTotalCount(param));
		grid.setRows(articleDao.pagerArticleList(ePager,param));
		return grid;
	}
	
	
}
