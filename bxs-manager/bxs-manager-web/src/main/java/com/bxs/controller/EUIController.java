package com.bxs.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eui")
public class EUIController {
	
	/**
	 * 
	 * 跳转到Easyui的用户管理页面
	 * @author: wyc
	 * @createTime: 2018年1月25日 下午5:25:50
	 * @history:
	 * @return String
	 */
	@RequestMapping("/user/list")
	public String user(){
		return "/eui/user/list";
	}

}
