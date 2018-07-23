package com.bxs.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.common.vo.ZTreeNode;
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
	
	/**
	 * 
	 * 获取树节点列表
	 * @author: wyc
	 * @createTime: 2018年7月23日 下午9:15:33
	 * @history: void
	 */
	@RequestMapping("/getTreeNodeList")
	@ResponseBody
	public Object getTreeNodeList(){
		List<ZTreeNode> nodeList=new ArrayList<ZTreeNode>();
		nodeList.add(new ZTreeNode("1","-1","节点1",false));
		nodeList.add(new ZTreeNode("2","1","节点2",true));
		nodeList.add(new ZTreeNode("3","1","节点3",true));
		nodeList.add(new ZTreeNode("4","-1","节点4",true));
		return nodeList;
	}
	
	
}
