package com.bxs.controller;

import javax.servlet.http.HttpServletRequest;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController{
	
	final static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * 
	 * 首页面
	 * @author: wyc
	 * @createTime: 2018年1月9日 下午8:40:59
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping({"/","/welcome","/index"})
	public ModelAndView index(HttpServletRequest request){
		logger.info("跳转到:{},访问时间是:{}", "index",new DateTime().toString("yyyy/MM/dd HH:mm:ss") );
		ModelAndView mv=new ModelAndView("index");
		return mv;
	}
	
	
	@RequestMapping({"/login"})
	public ModelAndView login(HttpServletRequest request){
		logger.info("跳转到:{},访问时间是:{}", "login",new DateTime().toString("yyyy/MM/dd HH:mm:ss") );
		ModelAndView mv=new ModelAndView("login");
		return mv;
	}
	
	
}
