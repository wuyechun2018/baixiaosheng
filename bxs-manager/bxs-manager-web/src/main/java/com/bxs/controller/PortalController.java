package com.bxs.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.pojo.ArticleInfoVo;
import com.bxs.service.ArticleService;
@Controller
@RequestMapping("/portal")
public class PortalController {
	
	@Autowired
	private ArticleService articleService;

	/**
	 * 
	 * 公用跳转方法
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午4:53:37
	 * @history:
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/index")
	public String getDefinedPage() {
		return "/portal/index";
	}
	
	
	@RequestMapping("/content")
	public ModelAndView content(String id) {
		ModelAndView mv=new ModelAndView("/portal/content");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		articleService.addViewCount(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
}
