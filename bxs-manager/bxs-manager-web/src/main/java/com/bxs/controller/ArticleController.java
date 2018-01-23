package com.bxs.controller;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.DataState;
import com.bxs.pojo.Article;
import com.bxs.service.ArticleService;

/***
 * 
 * 文章维护控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月22日 下午4:09:56
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	
	/**
	 * 
	 * 显示文章
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("article/show");
		Article article=articleService.getArticleById(id);
		article.setViewCount(article.getViewCount()+1);
		articleService.save(article);
		mv.addObject("article",article);
		return mv;
	}
	
	
	/**
	 * 
	 * 编辑文章
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("article/edit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
		return mv;
	}
	
	
	/**
	 * 
	 * 删除-逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 上午9:19:39
	 * @history:
	 * @param id
	 * @return String
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable String id) {
		articleService.delete(id);
		return "redirect:/article/manager";
	}
	
	
	/**
	 * 
	 * 文章列表
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView("article/list");
		List<Article> list=articleService.getList();
		mv.addObject("articleList",list);
		return mv;
	}
	
	
	/**
	 * 
	 * 文章管理页面
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/manager")
	public ModelAndView manager() {
		ModelAndView mv=new ModelAndView("article/manager");
		List<Article> list=articleService.getList();
		mv.addObject("articleList",list);
		return mv;
	}
	
	
	/**
	 * 
	 * 跳转到新增文章表单页面
	 * @author: wyc
	 * @createTime: 2018年1月19日 下午5:08:29
	 * @history:
	 * @return String
	 */
	@RequestMapping("/add")
	public String add() {
		return "article/add";
	}
	
	
	/**
	 * 
	 * 保存到数据库
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午4:02:40
	 * @history:
	 * @param article
	 * @return String
	 */
	@RequestMapping("/save")
	public String save(Article article) {
		article.setCreateDate(new Date());
		article.setUpdateDate(new Date());
		//设置为在用
		article.setDataState(DataState.Use.getCode());
		//初始化浏览次数为0
		article.setViewCount(0);
		article.setDisplayOrder(0);
		articleService.save(article);
		return "redirect:/article/manager";
	}

	

}
