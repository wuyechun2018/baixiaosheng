package com.bxs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	/**
	 * 
	 * 显示文章
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/show")
	public String show() {
		return "article/show";
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
	public String list() {
		return "article/list";
	}

}
