package com.bxs.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.SystemConstant;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;
import com.bxs.service.SysMenuService;

/**
 * 
 * 系统目录控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月24日 下午5:02:27
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/sysmenu")
public class SysMenuController {
	
	@Autowired
	private SysMenuService sysMenuService;
	
	
	/**
	 * 
	 * 根据父主键获取菜单
	 * @author: wyc
	 * @createTime: 2018年1月25日 上午9:06:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		return sysMenuService.getListByPid(pid);
	}
	
	
	
	/**
	 * 
	 * 根据父主键获取菜单
	 * @author: wyc
	 * @createTime: 2019年4月17日 下午4:17:55
	 * @param pid 
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/getListByPidAndUserId")
	@ResponseBody
	public Object getListByPidAndUserId(String pid,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		return sysMenuService.getListByPidAndUserId(pid,info.getId());
	}
	

}
