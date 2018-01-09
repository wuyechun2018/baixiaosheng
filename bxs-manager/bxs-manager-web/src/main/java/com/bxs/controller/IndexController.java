package com.bxs.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController{
	
	@RequestMapping({"/","/welcome","/index"})
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("index");
		return mv;
	}
}
