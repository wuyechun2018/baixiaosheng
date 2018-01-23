package com.bxs.service;

import java.util.List;

import com.bxs.pojo.Article;

public interface ArticleService {

	void save(Article article);

	List<Article> getList();

	Article getArticleById(String id);

	void delete(String id);
	
	
}
