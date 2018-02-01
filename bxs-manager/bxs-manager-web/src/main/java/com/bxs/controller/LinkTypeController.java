package com.bxs.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.LinkType;
import com.bxs.service.LinkTypeService;

/**
 * 
 * 导航类型
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年2月1日 下午3:24:39
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/linkType")
public class LinkTypeController {
	
	@Autowired
	private LinkTypeService linkTypeService;
	
	
	/**
	 * 
	 *
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午7:17:44
	 * @history:
	 * @param post
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(LinkType linkType) {
		linkTypeService.save(linkType);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 根据父主键获取导航类型
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午3:28:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		return linkTypeService.getListByPid(pid);
	}
	
	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:21:58
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request){
		String id=request.getParameter("id");
		linkTypeService.delete(id);
		return new JsonMsg();
	}

}
