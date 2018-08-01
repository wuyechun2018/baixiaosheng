package com.bxs.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * Sitaoke.vip 后台页面
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年7月23日 上午10:17:06
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/stk")
public class StkController {
	
	/**
	 * 
	 * 跳转到主页面
	 * @author: wyc
	 * @createTime: 2018年7月23日 上午10:19:15
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/stk/index");
		return mv;
	}
	
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
	public String getDefinedPage(@PathVariable("page") String page) {
		return "/stk/"+page;
	}

}
