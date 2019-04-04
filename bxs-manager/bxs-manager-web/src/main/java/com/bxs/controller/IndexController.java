package com.bxs.controller;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.service.ConfigService;


@Controller
public class IndexController{
	
	final static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private ConfigService configService;
	
	
	@Value("${login.page.flag}")
	private String LOGIN_PAGE_FLAG;
	
	/**
	 * 
	 * 首页面
	 * @author: wyc
	 * @createTime: 2018年1月9日 下午8:40:59
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	/*@RequestMapping({"/","/welcome","/index"})
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
	}*/
	
	
	/**
	 * 
	 * 系统默认页面
	 * @author: wyc
	 * @createTime: 2018年2月6日 下午9:01:02
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping({"/","/welcome","/index"})
	public ModelAndView index(HttpServletRequest request){
		logger.info("跳转到:{},访问时间是:{}", "login",new DateTime().toString("yyyy/MM/dd HH:mm:ss") );
		ModelAndView mv=new ModelAndView("/portal/index");
		
		//背景图片-轮换图
		if(!configService.getConfigByTypeCode("BJT").isEmpty()){
			mv.addObject("backGroudImgList", configService.getConfigByTypeCode("BJT"));
		}
		
		//专题图1
		if(!configService.getConfigByTypeCode("GGTP").isEmpty()){
			mv.addObject("topicImageUrlF", configService.getConfigByTypeCode("GGTP").get(0));
		}
		//专题图2
		if(!configService.getConfigByTypeCode("ZTT").isEmpty()){
			mv.addObject("topicImageUrlS", configService.getConfigByTypeCode("ZTT").get(0));
		}
		return mv;
	}
	
	@RequestMapping({"/login"})
	public ModelAndView login(HttpServletRequest request){
		logger.info("跳转到:{},访问时间是:{}", "login",new DateTime().toString("yyyy/MM/dd HH:mm:ss") );
		//ModelAndView mv=new ModelAndView("login");
		//ModelAndView mv=new ModelAndView("login-yun");
		
		//为了保证登录页面切换时的方便以及"登录"、"退出"时的
		ModelAndView mv=new ModelAndView(LOGIN_PAGE_FLAG);
		return mv;
	}
	
	
}
