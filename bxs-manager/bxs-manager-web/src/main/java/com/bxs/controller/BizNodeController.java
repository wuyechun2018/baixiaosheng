package com.bxs.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.BizNode;
import com.bxs.service.BizNodeService;

@Controller
@RequestMapping("/bizNode")
public class BizNodeController {
	@Autowired
	private BizNodeService bizNodeService;
	
	
	/**
	 * 
	 * 保存方法
	 * @author: wyc
	 * @createTime: 2018年7月16日 下午8:56:23
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(){
		BizNode node=new BizNode();
		node.setTypeName("zhangsan");
		node.setCreateDate(new Date());
		node.setUpdateDate(new Date());
		bizNodeService.save(node);
		return new JsonMsg();
	}
	
	
}
