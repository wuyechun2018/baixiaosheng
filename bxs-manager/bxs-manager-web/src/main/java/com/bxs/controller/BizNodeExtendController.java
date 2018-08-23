package com.bxs.controller;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.BizNode;
import com.bxs.pojo.jpa.BizNodeExtend;
import com.bxs.service.BizNodeExtendService;
@Controller
@RequestMapping("/bizNodeExtend")
public class BizNodeExtendController {
	
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

}
