package com.bxs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.pojo.User;
import com.bxs.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/list")
	@ResponseBody
	public List<User> getUserList() {
		List<User> list = userService.getUserList();
		return list;
	}
	
	@RequestMapping("/listAllUser")
	public ModelAndView listAllUser() {
		ModelAndView mv=new ModelAndView();
		List<User> list = userService.getUserList();
		mv.addObject("userlist",list);
		mv.setViewName("/user/list");
		return mv;
	}

}
