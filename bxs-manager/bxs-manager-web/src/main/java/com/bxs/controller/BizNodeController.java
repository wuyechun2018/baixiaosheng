package com.bxs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String id){
		BizNode existNode=bizNodeService.findNodeById(id);
		existNode.setDataState("0");
		bizNodeService.save(existNode);
		return new JsonMsg(true,"删除节点成功！");
	}
	
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
	public Object save(BizNode bizNode){
		//编辑
		if(StringUtils.isBlank(bizNode.getId())){
			bizNode.setCreateDate(new Date());
		}
		bizNode.setUpdateDate(new Date());
		BizNode existNode=bizNodeService.save(bizNode);
		return new JsonMsg(true,existNode);
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
	public Object getTreeNodeList(String pId){
		String typeCode="stock";
		if(pId==null){
			pId="-1";
		}
		
		List<ZTreeNode> zTreeNodeList=new ArrayList<ZTreeNode>();
		List<BizNode> bizNodeList=bizNodeService.findNodeListByTypeCodeAndPid(typeCode,pId);
		for (BizNode bizNode : bizNodeList) {
			ZTreeNode zTreeNode=new ZTreeNode();
			zTreeNode.setId(bizNode.getId());
			zTreeNode.setpId(bizNode.getPid());
			zTreeNode.setName(bizNode.getBizNodeName());
			zTreeNode.setTitle(bizNode.getBizNodeName()+"["+bizNode.getBizNodeCode()+"]");
			//注意传入当前节点的Id
			zTreeNode.setIsParent(bizNodeService.isParent(typeCode,bizNode.getId()));
			//扩展属性
			Map<String, Object> attr=new HashMap<String, Object>();
			attr.put("nodeCode",bizNode.getBizNodeCode());
			attr.put("nodeDesc",bizNode.getNodeDesc());
			attr.put("typeCode",typeCode);
			attr.put("typeName", bizNode.getTypeName());
			attr.put("dataState", bizNode.getDataState());
			attr.put("createDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(bizNode.getCreateDate()));
			attr.put("updateDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(bizNode.getUpdateDate()));
			zTreeNode.setAttribute(attr);
			zTreeNodeList.add(zTreeNode);
		}
		return zTreeNodeList;
	}
	
	
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
       //DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       binder.registerCustomEditor(Date.class,new CustomDateEditor(format, true)); 
   }
	
}
