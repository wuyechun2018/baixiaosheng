package com.bxs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.pojo.Topic;
import com.bxs.service.TopicService;

@Controller
@RequestMapping("/fan")
public class FanController {
	
	@Autowired
	private TopicService topicService;
	
	/**
	 * 
	 * 公用跳转页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:28
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/{module}/{page}")
	public String getDefinedPage(@PathVariable("module") String module,@PathVariable("page") String page) {
		return "/fan/"+module+"/"+page;
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
	public ModelAndView index() {
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/index");
		return mv;
	}

}
