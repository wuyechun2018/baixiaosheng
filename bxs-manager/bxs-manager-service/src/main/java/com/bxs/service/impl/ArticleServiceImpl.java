package com.bxs.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.jdbc.ArticleDao;
import com.bxs.pojo.Article;
import com.bxs.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
    private ArticleDao articleDao;
	
	public void save(Article article){
		//更新操作
		if(article.getId()!=null){
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
	
	
}
