package com.bxs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.DataPipeUtil;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;
import com.bxs.service.UserService;

/**
 * 
 * 信息报送
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年2月7日 下午11:31:24
 * @history:
 * @version: v1.0
 */

@Controller
@RequestMapping("/sois")
public class SoisController {
	
	@Autowired
	private ArticleService articleService;
	
	
	@Autowired
	private UserService userService;
	
	
	
	/**
	 * 
	 * 修改密码
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午10:55:24
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/pwd")
	public Object pwd(HttpSession session) {
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			ModelAndView mv=new ModelAndView("sois/pwd");
			mv.addObject("userinfo",info);
			return mv;
		}else{
			return "redirect:/sois/login";
		}
	}
	
	/**
	 * 
	 * 用户信息
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午11:13:03
	 * @history:
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/userInfo")
	public Object userInfo(HttpSession session) {
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			ModelAndView mv=new ModelAndView("sois/userInfo");
			mv.addObject("userinfo",info);
			return mv;
		}else{
			return "redirect:/sois/login";
		}
	}
	
	
	
	/**
	 * 
	 * 显示文章
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/show");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	/**
	 * 
	 * 删除
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午10:03:27
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		articleService.delete(id);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 编辑文章
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/edit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
		return mv;
	}
	
	
	
	/**
	 * 
	 * 信息上报
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午10:42:01
	 * @history:
	 * @param article
	 * @param session
	 * @return String
	 */
	@RequestMapping("/save")
	public String save(Article article,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setPublishDeptId(info.getDeptId());
			article.setPublishUserId(info.getId());
		}
		articleService.save(article);
		return "redirect:/sois/list";
	}
	
	
	/**
	 * 
	 * 获取文章列表
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:26:01
	 * @history:
	 * @param page
	 * @param limit
	 * @return Object
	 */
	@RequestMapping("/getArticleList")
	@ResponseBody
	public Object getArticleList(int page,int limit){
		EUIPager ePager=new EUIPager(page,limit);
		Map<String,Object> param=new HashMap<String,Object>();
		EUIGrid grid=articleService.pagerList(ePager,param);
		return DataPipeUtil.toLayUIGrid(grid);
	}
	
	/**
	 *  
	 * 首页
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午11:34:34
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/index")
	public Object index() {
		return "/sois/index";
	}
	

	/**
	 * 
	 * 报送系统登录
	 * @author: wyc
	 * @createTime: 2018年2月9日 上午12:02:56
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/login")
	public Object login() {
		return "/sois/login";
	}
	
	
	/**
	 * 
	 * 信息报送列表
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/list")
	public Object list() {
		return "/sois/list";
	}
	
	
	/**
	 * 
	 * 信息报送
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/add")
	public Object add() {
		return "/sois/add";
	}
	
	
	/**
	 * 
	 * 数据上报系统登录页面
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午4:50:59
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
		mv.setViewName("/sois/login");
		if(!list.isEmpty()){
			UserInfoVo info=list.get(0);
			//密码相等
			if(info.getLoginPassword().equals(EncryptionUtil.getMd5String(password))){
				//用户信息存入Session
				session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				//携带用户信息
				mv.addObject(SystemConstant.CURRENT_SESSION_USER_INFO, info);
				//跳转到后台管理主页面
				mv.setViewName("/sois/index");
			}else{
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
				//登录失败，跳转到登录页面
				mv.setViewName("/sois/login");
			}
			
		}
		return mv;
	}
	
	
	/**
	 * 
	 * 处理"发布日期字段",对于日期字段,前端不传也是可以的，但是，如果传了值，必须进行格式转换
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