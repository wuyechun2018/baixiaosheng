package com.bxs.controller;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.DataState;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.utils.PinyinUtil;
import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ConfigInfoVo;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.UserRole;
import com.bxs.service.ConfigService;
import com.bxs.service.UserRoleService;
import com.bxs.service.UserService;

/**
 * 
 * 用户管理页面
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月23日 下午2:50:05
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	private static final Logger logger =LoggerFactory.getLogger(UserController.class);
	
	//系统配置
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Value("${login.page.flag}")
	private String LOGIN_PAGE_FLAG;
	
	/**
	 * 
	 * 系统用户登录
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午7:39:47
	 * @history: void
	 */
	@RequestMapping("/doLogin")
	public ModelAndView doLogin(String username,String password,HttpSession session){
		ModelAndView mv=new ModelAndView();
		List<UserInfoVo> list=userService.getUserByLoginName(username);
		mv.setViewName(LOGIN_PAGE_FLAG);
		if(!list.isEmpty()){
			UserInfoVo info=list.get(0);
			//密码相等
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(password))){
				//判断是否为系统管理员
				List<UserRole> userRoleList=userRoleService.findByUserIdAndRoleCode(info.getId(), SystemConstant.ROLE_SYS_ADMIN);
				if(!userRoleList.isEmpty()){
					//用户信息存入Session
					session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO, info);
					//是管理员
					session.setAttribute(SystemConstant.CURRENT_SESSION_IS_ADMIN, true);
					//携带用户信息
					mv.addObject(SystemConstant.CURRENT_SESSION_USER_INFO, info);
					logger.info("{}登录[管理系统]成功,时间为{}",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
					
					//获取基础配置信息
					List<ConfigInfoVo> sysConfigList=configService.getConfigByTypeCode("JCXX");
					for (ConfigInfoVo configInfoVo : sysConfigList) {
						if("XTMC".equals(configInfoVo.getConfigCode())){
							mv.addObject("XTMC",configInfoVo.getConfigValue());
						}
						
						if("LOGO".equals(configInfoVo.getConfigCode())){
							mv.addObject("LOGO",configInfoVo.getConfigValue());
						}
					}
					
					//跳转到后台管理主页面
					mv.setViewName("/manager/index");
				}else{
					logger.info("{}登录[管理系统]失败,时间为{},该用户无[管理员]角色",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
					mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "非管理员,无权登录");
				}
			}else{
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
				logger.info("{}登录[管理系统]失败,时间为{},密码错误",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//登录失败，跳转到登录页面
				mv.setViewName(LOGIN_PAGE_FLAG);
			}
			
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
	public String doLoginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		session.invalidate();
		return "/login-yun";
		//return "/login";
	}
	
	/**
	 * 
	 * 验证密码是否正确
	 * @author: wyc
	 * @createTime: 2018年2月26日 下午7:03:03
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/isPwdCorrect")
	@ResponseBody
	public Object isPwdCorrect(String password,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(password))){
				return new JsonMsg(true,"密码正确");
			}else{
				return new JsonMsg(false,"密码错误，请重新输入！");
			}
		}else{
			return new JsonMsg(false,"请重新登录");
		}
	}
	
	
	
	/**
	 * 
	 * 验证是否已经登录
	 * @author: wyc
	 * @createTime: 2018年2月26日 下午7:03:03
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/isHasLogin")
	@ResponseBody
	public Object isHasLogin(String password,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			return new JsonMsg(true,info);
		}else{
			return new JsonMsg(false,"请重新登录");
		}
	}
	
	
	/**
	 * 
	 * 修改密码
	 * @author: wyc
	 * @createTime: 2018年2月26日 下午7:03:03
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/changePwd")
	@ResponseBody
	public Object changePwd(String oldPwd,String newPwd,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			//判断原密码输入是否正确，需要重新从数据库中加载用户信息
			SysUser user=userService.getUserById(info.getId());
			if(user.getLoginPassword().equals(EncryptionUtil.getMd5String(oldPwd))){
				userService.resetPwd(info.getId(),EncryptionUtil.getMd5String(newPwd));
				info.setLoginPassword(newPwd);
				//session.removeAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
				return new JsonMsg(true,"密码修改成功,请使用新密码重新登录！");
			}else{
				return new JsonMsg(false,"原密码错误，请重新输入！");
			}
		}else{
			return new JsonMsg(false,"请重新登录");
		}
	}
	
	
	/**
	 * 
	 * 跳转到用户管理列表页面
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午2:45:46
	 * @history:
	 * @return ModelAndView
	 */
	@RequestMapping("/manager")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView();
		List<SysUser> list = userService.getUserList();
		mv.addObject("userList",list);
		mv.setViewName("/user/manager");
		return mv;
	}
	
	
	/**
	 * 
	 * 跳转到用户新增页面
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午3:53:33
	 * @history:
	 * @return String
	 */
	@RequestMapping("/add")
	public String add() {
		return "/user/add";
	}
	
	/**
	 * 
	 * 保存到数据库
	 * @author: wyc
	 * @createTime: 2018年1月22日 下午4:02:40
	 * @history:
	 * @param article
	 * @return String
	 */
	@RequestMapping("/save")
	public String save(SysUser user) {
		user.setLoginTime(new Date());
		//设置为在用
		user.setDataState(DataState.Use.getCode());
		userService.save(user);
		return "redirect:/user/manager";
	}
	
	
	/**
	 * 
	 * EasyUI表单提交过来的表单处理
	 * @author: wyc
	 * @createTime: 2018年1月30日 上午11:39:32
	 * @history:
	 * @param user
	 * @return JsonMsg
	 */
	@RequestMapping("/euiSave")
	@ResponseBody
	public JsonMsg euiSave(SysUser user) {
		userService.save(user);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 重置密码
	 * @author: wyc
	 * @createTime: 2018年2月26日 下午4:47:35
	 * @history:
	 * @return JsonMsg
	 */
	@RequestMapping("/resetPwd")
	@ResponseBody
	public JsonMsg resetPwd(String id){
		String password="123456";
		userService.resetPwd(id,EncryptionUtil.getMd5String(password));
		return new JsonMsg(true,"密码已重置，请使用新密码（"+password+"）登录");
	}
	
	
	
	/**
	 * 
	 * 编辑用户
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午9:42:16
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("user/edit");
		SysUser user=userService.getUserById(id);
		mv.addObject("user",user);
		return mv;
	}
	
	
	/**
	 * 
	 * 显示用户详情
	 * @author: wyc
	 * @createTime: 2018年1月23日 下午5:38:49
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("/user/show");
		SysUser user=userService.getUserById(id);
		mv.addObject("user",user);
		return mv;
	}
	
	
	/**
	 * 
	 * 删除-逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 上午9:19:39
	 * @history:
	 * @param id
	 * @return String
	 */
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable String id) {
		userService.delete(id);
		return "redirect:/user/manager";
	}
	
	
	/**
	 * 
	 * EasyUI 页面删除
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午3:19:45
	 * @history:
	 * @param request
	 * @return String
	 */
	@RequestMapping("/euiDelete")
	@ResponseBody
	public Object euiDelete(HttpServletRequest request) {
		String id=request.getParameter("id");
		userService.delete(id);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 返回用户列表数据
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午8:25:08
	 * @history:
	 * @return EUIGrid EasyUI可识别的固定数据集合
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return userService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 * 初始化登录名为用户名的汉语拼音
	 * @author: wyc
	 * @createTime: 2018年2月10日 上午11:04:02
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/initLoginName")
	@ResponseBody
	public Object initLoginName(){
		List<SysUser> list=userService.getUserWhoLoginNameIsNull();
		for (SysUser sysUser : list) {
			String loginName=PinyinUtil.toPinyin(sysUser.getUserName());
			sysUser.setLoginName(loginName);
			userService.updateUserInfo(sysUser);
		}
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 获取用户下拉列表数据
	 * @author: wyc
	 * @createTime: 2019年3月7日 下午6:58:27
	 * @history:
	 * @return List<EUICombobox>
	 */
	@RequestMapping("/getUserComboboxData")
	@ResponseBody
	public List<EUICombobox> getUserComboboxData(){
		return userService.getUserComboboxData();
	}
	
	
	/**
	 * 
	 * 处理"出生日期字段",对于日期字段,前端不传也是可以的，但是，如果传了值，必须进行格式转换
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午1:38:30
	 * @history:
	 * @param binder void
	 */
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
       DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
       binder.registerCustomEditor(Date.class,new CustomDateEditor(format, true)); 
   }

}
