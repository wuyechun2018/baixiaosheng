package com.bxs.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eui")
public class EUIController {
	
	/**
	 * 
	 * 跳转到用户管理页面
	 * @author: wyc
	 * @createTime: 2018年1月25日 下午5:25:50
	 * @history:
	 * @return String
	 */
	@RequestMapping("/user/list")
	public String user(){
		return "/eui/user/list";
	}
	
	/**
	 * 
	 * 跳转到"文章管理"页面
	 * @author: wyc
	 * @createTime: 2018年1月25日 下午5:25:50
	 * @history:
	 * @return String
	 */
	@RequestMapping("/article/list")
	public String article(){
		return "/eui/article/list";
	}
	
	
	/**
	 * 
	 * 跳转到"文章栏目"页面
	 * @author: wyc
	 * @createTime: 2018年1月25日 下午5:25:50
	 * @history:
	 * @return String
	 */
	@RequestMapping("/topic/list")
	public String topic(){
		return "/eui/topic/list";
	}

}
