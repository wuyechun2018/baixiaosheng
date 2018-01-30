package com.bxs.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Dept;
import com.bxs.service.DeptService;

/**
 * 部门维护控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月24日 下午5:02:27
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/dept")
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	
	/**
	 * 
	 * 根据父主键获取下级部门
	 * @author: wyc
	 * @createTime: 2018年1月25日 上午9:06:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		return deptService.getListByPid(pid);
	}
	
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:26:03
	 * @history:
	 * @param dept
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Dept dept) {
		deptService.save(dept);
		return new JsonMsg();
	}
	
	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:50:59
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request){
		String id=request.getParameter("id");
		deptService.delete(id);
		return new JsonMsg();
	}
	

}
