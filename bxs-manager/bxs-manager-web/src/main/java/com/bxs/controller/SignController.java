package com.bxs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.SignService;
import com.bxs.service.UserService;

@Controller
@RequestMapping("/sign")
public class SignController extends BaseController {
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private UserService userService;
	
	
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
	public Object signArticle(String articleId,String signContent,HttpSession session) {
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			Sign sign=new Sign();
			sign.setArticleId(articleId);
			sign.setSignState("1");
			sign.setSignContent(signContent);
			sign.setSignDeptId(info.getDeptId());
			sign.setSignUserId(info.getId());
			sign.setSignDate(new Date());
			signService.signArticle(sign);
			return new JsonMsg(true,"签收成功！");
		}else{
			return new JsonMsg(false,"请登录！");
		}
		
	}
	
	/**
	 * 
	 * 提交反馈信息
	 * @author: wyc
	 * @createTime: 2018年2月24日 下午10:19:58
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/submitFeedback")
	@ResponseBody
	public Object submitFeedback(String articleId,String signContent,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			Sign sign=new Sign();
			sign.setArticleId(articleId);
			sign.setSignDeptId(info.getDeptId());
			sign.setSignContent(signContent);
			signService.submitFeedback(sign);
			return new JsonMsg(true,"反馈信息已提交！");
		}else{
			return new JsonMsg(false,"请登录！");
		}
	}
	
	
	/**
	 * 
	 * 系统登录并签收
	 * @author: wyc
	 * @createTime: 2018年2月24日 上午10:43:45
	 * @history:
	 * @param articleId
	 * @param signContent
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/loginAndSign")
	@ResponseBody
	public Object loginAndSign(String loginName,String loginPassword,String articleId,String signContent,HttpSession session) {
		JsonMsg jsonMsg=new JsonMsg();
		List<UserInfoVo> list=userService.getUserByLoginName(loginName);
		if(!list.isEmpty()){
			UserInfoVo info=list.get(0);
			//密码相等,登录成功
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(loginPassword))){
				//用户信息存入Session
				session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				//登录成功后，判断是否需要签收
				List<SignInfoVo> needSignList=signService.getSignListByArticleIdAndDeptId(articleId,info.getDeptId());
				if(!needSignList.isEmpty()){
					//判断是否已经签收
					SignInfoVo sInfo=needSignList.get(0);
					if(sInfo.getSignState()!=null&&"1".equals(sInfo.getSignState())){
						//已签收
						jsonMsg.setSuccess(true);
						jsonMsg.setMsg("已签收！");
					}else{
						//未签收，则进行签收
						Sign sign=new Sign();
						sign.setArticleId(articleId);
						sign.setSignState("1");
						sign.setSignContent(signContent);
						sign.setSignDeptId(info.getDeptId());
						sign.setSignUserId(info.getId());
						sign.setSignDate(new Date());
						signService.signArticle(sign);
						
						jsonMsg.setSuccess(true);
						jsonMsg.setMsg("签收成功！");
					}
				}else{
					jsonMsg.setSuccess(true);
					jsonMsg.setMsg("无需签收！");
				}
			}else{
				jsonMsg.setSuccess(false);
				jsonMsg.setMsg("登录失败，用户名或密码错误！");
			}
		}
		return jsonMsg;
	 }

}
