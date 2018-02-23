package com.bxs.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.SignService;

@Controller
@RequestMapping("/sign")
public class SignController extends BaseController {
	
	@Autowired
	private SignService signService;
	
	
	/**
	 * 
	 * 签收
	 * @author: wyc
	 * @createTime: 2018年2月23日 下午11:26:30
	 * @history:
	 * @param post
	 * @return Object
	 */
	@RequestMapping("/signArticle")
	@ResponseBody
	public Object signArticle(String articleId,HttpSession session) {
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			signService.signArticle(articleId,info);
			return new JsonMsg();
		}else{
			return new JsonMsg(false,"请登录");
		}
		
	}
	

}
