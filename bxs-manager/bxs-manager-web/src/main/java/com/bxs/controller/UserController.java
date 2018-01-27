package com.bxs.controller;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.DataState;
import com.bxs.pojo.Article;
import com.bxs.pojo.SysUser;
import com.bxs.service.UserService;

/**
 * 
 * 用户管理页面
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月23日 下午2:50:05
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	
	/**
	 * 
	 * 跳转到用户管理列表页面
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午2:45:46
	 * @history:
	 * @return ModelAndView
	 */
	@RequestMapping("/manager")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView();
		List<SysUser> list = userService.getUserList();
		mv.addObject("userList",list);
		mv.setViewName("/user/manager");
		return mv;
	}
	
	
	/**
	 * 
	 * 跳转到用户新增页面
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午3:53:33
	 * @history:
	 * @return String
	 */
	@RequestMapping("/add")
	public String add() {
		return "/user/add";
	}
	
	/**
	 * 
	 * 保存到数据库
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午4:02:40
	 * @history:
	 * @param article
	 * @return String
	 */
	@RequestMapping("/save")
	public String save(SysUser user) {
		user.setLoginTime(new Date());
		//设置为在用
		user.setDataState(DataState.Use.getCode());
		userService.save(user);
		return "redirect:/user/manager";
	}
	
	
	/**
	 * 
	 * 编辑用户
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午9:42:16
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("user/edit");
		SysUser user=userService.getUserById(id);
		mv.addObject("user",user);
		return mv;
	}
	
	
	/**
	 * 
	 * 显示用户详情
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午5:38:49
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("/user/show");
		SysUser user=userService.getUserById(id);
		mv.addObject("user",user);
		return mv;
	}
	
	
	/**
	 * 
	 * 删除-逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 上午9:19:39
	 * @history:
	 * @param id
	 * @return String
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable String id) {
		userService.delete(id);
		return "redirect:/user/manager";
	}

}
