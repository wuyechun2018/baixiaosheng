package com.bxs.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.Topic;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.SysUserExtend;
import com.bxs.service.MailService;
import com.bxs.service.SysUserExtendService;
import com.bxs.service.TopicService;
import com.bxs.service.UserService;

/**
 * 
 * Sitaoke.vip 后台页面
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年7月23日 上午10:17:06
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/stk")
public class StkController {
	
	private static final Logger logger =LoggerFactory.getLogger(StkController.class);
	
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private SysUserExtendService userExtendService;
	
	
	@Autowired
	private TopicService topicService;
	

	
	
	//@Value("${mail.smtp.from}")   
    //private String mailSmtpFrom; 
	
	@Autowired
	private MailService mailService;
	
	
	
	
	/**
	 * 
	 * 跳转到主页面
	 * @author: wyc
	 * @createTime: 2018年7月23日 上午10:19:15
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/stk/index");
		return mv;
	}
	
	
	
	/**
	 * 
	 * 忘记密码
	 * @author: wyc
	 * @createTime: 2018年9月11日 下午2:28:28
	 * @history:
	 * @param email
	 * @return JsonMsg
	 */
	@RequestMapping(value = "/forgetPwd")
	@ResponseBody
	public JsonMsg forgetPwd(HttpServletRequest request,String email){
		//根据email查到用户信息
		List<SysUser> userListByEmail=userService.getUserByEmail(email);
		if(!userListByEmail.isEmpty()){
			//生成关键字符串
			String key=RandomStringUtils.randomAlphanumeric(12);
			//将关键字符串存入用户扩展表
			//生成用户确认字符串
			//将字符串发送给用户邮箱
			SysUser user=userListByEmail.get(0);
			String confirmURL=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/stk/resetPwd?id="+user.getId()+"&key="+key;
			String content="您发起了重置SITAOKE.VIP的密码的请求，您的用户名为["+user.getLoginName()+"]请点击以下链接或者复制该地址在浏览器访问以进行确认！</br>"+confirmURL+"";
			SysUserExtend sysUserExtend=userExtendService.findByUserId(user.getId());
			sysUserExtend.setResetMailKey(key);
			userExtendService.save(sysUserExtend);
			mailService.sendMail(email,"[SITAOKE.VIP]请确认重置密码！",content);
		}
		return new JsonMsg();
	}
	
	
	
	
	/**
	 * 
	 * 忘记密码
	 * @author: wyc
	 * @createTime: 2018年9月11日 下午2:28:28
	 * @history:
	 * @param email
	 * @return JsonMsg
	 */
	@RequestMapping(value = "/resetPwd")
	@ResponseBody
	public JsonMsg resetPwd(HttpServletRequest request,String id,String key){
		//根据email查到用户信息
		SysUser user=userService.getUserById(id);
		//产生新密码
		String newPwd="STK"+RandomStringUtils.randomAlphanumeric(5);
		SysUserExtend sysUserExtend=userExtendService.findByUserId(user.getId());
		//关键字相同，才重置密码
		if(key.equals(sysUserExtend.getResetMailKey())){
			//重置密码
			userService.resetPwd(id,EncryptionUtil.getMd5String(newPwd));
			//将密码发送给用户邮箱
			String content="您的账号为【"+user.getLoginName()+"】,重置后的密码为：【"+newPwd+"】,请使用新密码进行登录！";
			mailService.sendMail(sysUserExtend.getEmail(),"[SITAOKE.VIP]您的密码已重置!",content);
			return new JsonMsg(true,"密码重置成功！");
		}else{
			return new JsonMsg(false,"密码重置失败！");
		}
	}
	
	/**
	 * 
	 * 退出
	 * @author: wyc
	 * @createTime: 2018年8月24日 下午4:54:08
	 * @history:
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/loginout")
	public String doLoginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		session.invalidate();
		return "/stk/login";
	}
	
	
	
	/**
	 * 
	 * 用户注册
	 * @author: wyc
	 * @createTime: 2018年8月29日 上午10:56:05
	 * @history:
	 * @param username
	 * @param password
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping("/register")
	@ResponseBody
	public Object register(String mobilePhone,String email,String loginName,String loginPassword,HttpServletRequest request){
		logger.info("IP为{}用户尝试注册，登录名{}，电话为{},时间为{}",new Object[]{CommonUtil.getClientIP(request),loginName,mobilePhone,new DateTime().toString("yyyy-MM-dd HH:mm:ss")});
		JsonMsg msg=new JsonMsg(true,"注册成功,请登录！");
		boolean flag=true;
		//通过电话号码查询
		List<UserInfoVo> userListByPhone=userService.getUserByMobilePhone(mobilePhone);
		if(!userListByPhone.isEmpty()){
			flag=false;
			msg=new JsonMsg(false,"该手机号已被注册,请直接登录或重新填写！");
			logger.info("IP为{}用户注册失败，登录名{}，电话{},时间{},手机号已存在",new Object[]{CommonUtil.getClientIP(request),loginName,mobilePhone,new DateTime().toString("yyyy-MM-dd HH:mm:ss")});
		}
		//通过登录名查询
		List<UserInfoVo> userListByLoginName=userService.getUserByLoginName(loginName);
		if(!userListByLoginName.isEmpty()){
			flag=false;
			msg=new JsonMsg(false,"该登录名已被注册,请直接登录或重新填写！");
			logger.info("IP为{}用户注册失败，登录名{}，电话{},时间{},登录名已存在",new Object[]{CommonUtil.getClientIP(request),loginName,mobilePhone,new DateTime().toString("yyyy-MM-dd HH:mm:ss")});
		}
		//通过邮箱查询
		List<SysUser> userListByEmail=userService.getUserByEmail(email);
		if(!userListByEmail.isEmpty()){
			flag=false;
			msg=new JsonMsg(false,"该邮箱已被注册,请直接登录或重新填写！");
			logger.info("IP为{}用户注册失败，登录名{}，电话{},时间{},邮箱已存在",new Object[]{CommonUtil.getClientIP(request),loginName,mobilePhone,new DateTime().toString("yyyy-MM-dd HH:mm:ss")});
		}
		
		if(flag){
			//保存主表信息
			SysUser user=new SysUser();
			user.setLoginName(loginName);
			//用户名默认和登录名保持一致
			user.setUserName(loginName);
			//Service中将密码进行MD5加密，此处不作加密
			user.setLoginPassword(loginPassword);
			user.setMobilePhone(mobilePhone);
			String userId=userService.save(user);
			//保证用户扩展表信息
			SysUserExtend userExtend=new SysUserExtend();
			userExtend.setUserId(userId);
			userExtend.setEmail(email);
			userExtendService.save(userExtend);
			logger.info("IP为：{}用户于{}注册成功，登录名为{}，电话{}",new Object[]{CommonUtil.getClientIP(request),new DateTime().toString("yyyy-MM-dd HH:mm:ss"),loginName,mobilePhone});
		}
		
		return msg;
	}
	

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
	public ModelAndView doLogin(String username,String password,HttpServletRequest request){
		HttpSession session = request.getSession(); 
		String pageUrl=request.getParameter("pageUrl");
		String loginViewName="/stk/login";
		if(StringUtils.isNotBlank(pageUrl)){
			loginViewName=pageUrl;
		}
		
		ModelAndView mv=new ModelAndView();
		List<UserInfoVo> list=userService.getUserByLoginNameOrMobilePhone(username);
		mv.setViewName(loginViewName);
 		if(!list.isEmpty()){
			UserInfoVo info=list.get(0);
			//密码相等 
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(password))){
				//用户信息存入Session
				session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				//携带用户信息
				mv.addObject(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				logger.info("{}登录[管理系统]成功,时间为{}",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				if(StringUtils.isNotBlank(pageUrl)){
					mv.setViewName(pageUrl);
				}else{
					//跳转到后台管理主页面
					mv.setViewName("/fan/index");
				}
				mv.addObject("userInfoVo", info);
				
			}else{
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
				logger.info("{}登录[管理系统]失败,时间为{},密码错误",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//登录失败，跳转到登录页面
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误！");
				mv.setViewName(loginViewName);
			}
			
			List<Topic> topicList=topicService.getAllTopic();
			mv.addObject("topicList", topicList);
			
			
		}else{
			logger.info("账号{}登录[管理系统]失败,时间为{},系统中无该用户",username,new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
			mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户不存在，请先注册！");
		}
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
		return "/stk/"+page;
	}

}
