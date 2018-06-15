package com.bxs.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.pojo.Article;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.Topic;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;
import com.bxs.service.TopicService;
import com.bxs.service.UserService;

@Controller
@RequestMapping("/fan")
public class FanController {
	
	private static final Logger logger =LoggerFactory.getLogger(FanController.class);

	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	
	/**
	 * 
	 * 登录
	 * @author: wyc
	 * @createTime: 2018年6月7日 下午5:29:37
	 * @history:
	 * @param username
	 * @param password
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping("/doLogin")
	public ModelAndView doLogin(String username,String password,HttpSession session){
		ModelAndView mv=new ModelAndView();
		List<UserInfoVo> list=userService.getUserByLoginName(username);
		mv.setViewName("/fan/login");
		if(!list.isEmpty()){
			UserInfoVo info=list.get(0);
			//密码相等
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(password))){
				//用户信息存入Session
				session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				//携带用户信息
				mv.addObject(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				logger.info("{}登录[管理系统]成功,时间为{}",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//跳转到后台管理主页面
				mv.setViewName("/fan/index");
				mv.addObject("userInfoVo", info);
			}else{
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
				logger.info("{}登录[管理系统]失败,时间为{},密码错误",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//登录失败，跳转到登录页面
				mv.setViewName("/fan/login");
			}
			
			List<Topic> topicList=topicService.getAllTopic();
			mv.addObject("topicList", topicList);
			
			
		}else{
			logger.info("账号{}登录[管理系统]失败,时间为{},系统中无该用户",username,new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
			mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
		}
		return mv;
	}
	
	
	
	/**
	 * 
	 * 系统用户退出
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午8:46:06
	 * @history:
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/loginout")
	public ModelAndView doLoginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		session.invalidate();
		ModelAndView mv=new ModelAndView();
		//获取栏目信息
		List<Topic> topicList=topicService.getAllTopic();
		mv.setViewName("/fan/index");
		mv.addObject("topicList", topicList);
		return mv;
	}
	
	
	/**
	 * 
	 * 用户注册
	 * @author: wyc
	 * @createTime: 2018年6月8日 上午11:41:55
	 * @history:
	 * @param loginName
	 * @param loginPassword
	 * @param mobilePhone
	 * @return String
	 */
	@RequestMapping("/doRegister")
	public ModelAndView doRegister(String loginName,String loginPassword,String mobilePhone){
		logger.info("用户注册，登录名为{},时间为{}",loginName+"["+mobilePhone+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
		ModelAndView mv=new ModelAndView();
		boolean successFlag=true;
		//通过用户名查询
		List<UserInfoVo> userListByUser=userService.getUserByLoginName(loginName);
		if(!userListByUser.isEmpty()){
			mv.setViewName("/fan/register");
			mv.addObject("infoMsg", "用户名已存在请重新填写！");
			successFlag=false;
		}
		//通过电话号码查询
		List<UserInfoVo> userListByPhone=userService.getUserByMobilePhone(mobilePhone);
		if(!userListByPhone.isEmpty()){
			mv.setViewName("/fan/register");
			mv.addObject("infoMsg", "该手机号已被注册,请直接登录或重新填写！");
			successFlag=false;
		}
		//正常注册
		if(successFlag){
			//正常注册
			mv.setViewName("/fan/register");
			SysUser user=new SysUser();
			user.setLoginName(loginName);
			//用户名默认和登录名保持一致
			user.setUserName(loginName);
			user.setLoginPassword(loginPassword);
			user.setMobilePhone(mobilePhone);
			userService.save(user);
			
			logger.info("用户注册成功，登录名为{},时间为{}",loginName+"["+mobilePhone+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
			mv.addObject("infoMsg", "注册成功，请到<a href='./login'> 登录 </a>页面进行登录！");
		}
		mv.addObject("rLoginName", loginName);
		mv.addObject("rLoginPassword", loginPassword);
		mv.addObject("rMobilePhone", mobilePhone);
		return mv;
	}
	
	
	
	/**
	 * 
	 * 公用跳转页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:28
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/{page}")
	public String getDefinedPage(@PathVariable("page") String page) {
		return "/fan/"+page;
	}
	
	/**
	 * 
	 * 首页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/index");
		return mv;
	}
	
	
	/**
	 * 
	 * 关于我们
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/about")
	public ModelAndView about(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/about");
		return mv;
	}
	
	/**
	 * 
	 * 联系我们
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/contact")
	public ModelAndView contact(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/contact");
		return mv;
	}
	
	
	/**
	 * 
	 * 法律声明
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/legal")
	public ModelAndView legal(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		List<Topic> topicList=topicService.getAllTopic();
		mv.addObject("topicList", topicList);
		mv.setViewName("/fan/legal");
		return mv;
	}
	
	/**
	 * 
	 * 内容页
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping("/content/{id}")
	public ModelAndView content(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("fan/content");
		List<Topic> topicList=topicService.getAllTopic();
		Article article=articleService.getArticleById(id);
		article.setViewCount(article.getViewCount()+1);
		articleService.save(article);
		mv.addObject("topicList", topicList);
		mv.addObject("article",article);
		return mv;
	}
	
	
	/**
	 * 
	 * 栏目列表页面
	 * @author: wyc
	 * @createTime: 2018年4月12日 下午4:10:44
	 * @param module
	 * @param page
	 * @return ModelAndView
	 */
	@RequestMapping("/list/{id}")
	public ModelAndView list(@PathVariable String id) {
		List<Topic> topicList=topicService.getAllTopic();
		Topic topic=topicService.getTopicById(id);
		ModelAndView mv=new ModelAndView("/fan/list");
		mv.addObject("topicList", topicList);
		mv.addObject("curTopic", topic);
		return mv;
	}

}
