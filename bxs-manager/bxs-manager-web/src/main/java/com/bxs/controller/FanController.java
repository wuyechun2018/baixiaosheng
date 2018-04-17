package com.bxs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/fan")
public class FanController {
	
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
		mv.setViewName("/fan/index");
		return mv;
	}

}
