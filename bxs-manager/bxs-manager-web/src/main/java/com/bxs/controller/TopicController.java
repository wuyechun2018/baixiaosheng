package com.bxs.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Topic;
import com.bxs.service.TopicService;

/**
 * 系统目录控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月24日 下午5:02:27
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Autowired
	private TopicService topicService;
	
	
	/**
	 * 
	 * 根据父主键获取文章栏目
	 * @author: wyc
	 * @createTime: 2018年1月25日 上午9:06:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		return topicService.getListByPid(pid);
	}
	
	
	/**
	 * 
	 * 根据父主键获取文章栏目(可签收的栏目)
	 * @author: wyc
	 * @createTime: 2018年1月25日 上午9:06:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getSignListByPid")
	@ResponseBody
	public Object getSignListByPid(String pid){
		return topicService.getSignListByPid(pid);
	}
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:26:03
	 * @history:
	 * @param topic
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Topic topic) {
		topicService.save(topic);
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
		topicService.delete(id);
		return new JsonMsg();
	}
	

}
