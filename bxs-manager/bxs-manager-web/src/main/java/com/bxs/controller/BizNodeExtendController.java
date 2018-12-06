package com.bxs.controller;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.BizNodeExtend;
import com.bxs.service.BizNodeExtendService;


/**
 * 
 * 节点附属信息
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年8月23日 下午3:24:27
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/bizNodeExtend")
public class BizNodeExtendController extends BaseController{
	
	@Autowired
	private BizNodeExtendService bizNodeExtendService;
	
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
	public Object save(BizNodeExtend bizNodeExtend){
		//编辑
		if(StringUtils.isBlank(bizNodeExtend.getId())){
			bizNodeExtend.setCreateDate(new Date());
		}
		bizNodeExtend.setDataState("1");
		bizNodeExtend.setUpdateDate(new Date());
		BizNodeExtend existNode=bizNodeExtendService.save(bizNodeExtend);
		return new JsonMsg(true,existNode);
	}
	
	/**
	 * 
	 * 删除扩展属性
	 * @author: wyc
	 * @createTime: 2018年8月23日 下午5:42:34
	 * @history:
	 * @param id
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String id){
		BizNodeExtend bizNodeExtend=bizNodeExtendService.getNodeExtendById(id);
		//逻辑删除
		bizNodeExtend.setDataState("0");
		bizNodeExtend.setUpdateDate(new Date());
		bizNodeExtendService.save(bizNodeExtend);
		return new JsonMsg(true,"删除成功");
	}
	
	/**
	 * 
	 * 根据主节点Id获取附属节点信息
	 * @author: wyc
	 * @createTime: 2018年8月23日 下午3:28:56
	 * @history:
	 * @param mainNodeId
	 * @return Object
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Object list(String mainNodeId){
		return bizNodeExtendService.getListByMainNodeId(mainNodeId);
	}
	
	/**
	 * 
	 * 分页获取"附属节点信息"列表
	 * @author: wyc
	 * @createTime: 2018年11月29日 下午5:00:30
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return bizNodeExtendService.pagerList(ePager,param);
	}

}
