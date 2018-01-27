package com.bxs.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

}
