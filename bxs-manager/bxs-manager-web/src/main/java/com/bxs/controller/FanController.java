package com.bxs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Article;
import com.bxs.pojo.Topic;
import com.bxs.service.ArticleService;
import com.bxs.service.TopicService;

@Controller
@RequestMapping("/fan")
public class FanController {
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private ArticleService articleService;
	
	/**
	 * 
	 * 公用跳转页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:28
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/{page}")
	public String getDefinedPage(@PathVariable("module") String module,@PathVariable("page") String page) {
		return "/fan/"+page;
	}
	
	/**
	 * 
	 * 首页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/index");
		return mv;
	}
	
	
	/**
	 * 
	 * 关于我们
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/about")
	public ModelAndView about(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/about");
		return mv;
	}
	
	/**
	 * 
	 * 联系我们
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/contact")
	public ModelAndView contact(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/contact");
		return mv;
	}
	
	
	/**
	 * 
	 * 法律声明
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/legal")
	public ModelAndView legal(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/legal");
		return mv;
	}
	
	/**
	 * 
	 * 内容页
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping("/content/{id}")
	public ModelAndView content(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("fan/content");
		List<Topic> topicList=topicService.getAllTopic();
		Article article=articleService.getArticleById(id);
		article.setViewCount(article.getViewCount()+1);
		articleService.save(article);
		mv.addObject("topicList", topicList);
		mv.addObject("article",article);
		return mv;
	}
	
	
	/**
	 * 
	 * 栏目列表页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping("/list/{id}")
	public ModelAndView list(@PathVariable String id) {
		List<Topic> topicList=topicService.getAllTopic();
		Topic topic=topicService.getTopicById(id);
		ModelAndView mv=new ModelAndView("/fan/list");
		mv.addObject("topicList", topicList);
		mv.addObject("curTopic", topic);
		return mv;
	}

}
