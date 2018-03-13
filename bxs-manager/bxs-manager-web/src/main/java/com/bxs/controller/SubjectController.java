package com.bxs.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * 专题
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年3月13日 上午7:23:19
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/subject")
public class SubjectController {
	
	/**
	 * 
	 * 公用跳转方法
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午3:15:09
	 * @history:
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/{page}")
	public String getDefinedPage(@PathVariable("page") String page) {
		return "/subject/"+page;
	}

}
