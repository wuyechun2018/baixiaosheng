package com.bxs.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.InfoRank;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.InfoRankService;

/**
 * 
 * 信息排名
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年3月1日 下午4:21:54
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/infoRank")
public class InfoRankController extends BaseController{

	@Autowired
	private InfoRankService infoRankService;
	
	@Value("${stat.article.topic}")
	private String statArticleTopic;
	
	/**
	 * 
	 * 保存
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午4:23:59
	 * @history:
	 * @param weatherForecast
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(InfoRank infoRank,HttpSession session) {
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(userInfo!=null){
			infoRankService.save(infoRank,userInfo);
			return new JsonMsg();
	    }else{
	    	return new JsonMsg(false,"请登录系统");
	    }
	}
	
	/**
	 * 
	 * 初始化数据
	 * @author: wyc
	 * @createTime: 2018年2月3日 上午10:09:05
	 * @history:
	 * @return JsonMsg
	 */
	@RequestMapping("/initData")
	@ResponseBody
	public JsonMsg initData(String statYear,HttpSession session) {
	    UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
	    if(userInfo!=null){
	    	infoRankService.initData(statYear,statArticleTopic,userInfo);
	    	return new JsonMsg();
	    }else{
	    	return new JsonMsg(false,"请登录系统");
	    }
	}
	
	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2018年2月3日 上午10:09:19
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return infoRankService.pagerList(ePager,param);
	}


}
