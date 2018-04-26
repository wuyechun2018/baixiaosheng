package com.bxs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;
import com.bxs.service.SignService;
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
	
	private static final Logger logger =LoggerFactory.getLogger(SoisController.class);
	
	@Autowired
	private ArticleService articleService;
	
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private SignService signService;
	
	
	/**
	 * 
	 * 信息上报主页面,点击"退出系统"按钮
	 * @author: wyc
	 * @createTime: 2018年2月11日 上午11:41:16
	 * @history:
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/loginout")
	public String doLoginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		session.invalidate();
		return "/sois/login";
	}
	
	
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
	 * 查看签收信息
	 * @author: wyc
	 * @createTime: 2018年2月24日 上午11:51:21
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/showSign/{id}")
	public ModelAndView showSign(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/showSign");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	
	/**
	 * 
	 * 查看反馈信息
	 * @author: wyc
	 * @createTime: 2018年2月24日 上午11:51:21
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/showFeedback/{id}")
	public ModelAndView showFeedback(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/showFeedback");
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
			//如果，作者没有填写，则默认为上报人
			if(StringUtils.isBlank(article.getAuthor())){
				article.setAuthor(info.getUserName());
			}
			//消息来源
			//article.setNewsfrom(info.getDeptName()+"上报");
			article.setNewsfrom(info.getDeptName());
		}
		articleService.save(article);
		return "redirect:/sois/list";
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
	@RequestMapping("/videoSave")
	public String videoSave(Article article,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setPublishDeptId(info.getDeptId());
			article.setPublishUserId(info.getId());
			//如果，作者没有填写，则默认为上报人
			if(StringUtils.isBlank(article.getAuthor())){
				article.setAuthor(info.getUserName());
			}
			//消息来源
			//article.setNewsfrom(info.getDeptName()+"上报");
			article.setNewsfrom(info.getDeptName());
		}
		articleService.save(article);
		return "redirect:/sois/videoList";
	}
	
	
	/**
	 * 
	 * 信息上报-签收信息报送
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午10:42:01
	 * @history:
	 * @param article
	 * @param session
	 * @return String
	 */
	@RequestMapping("/signSave")
	public String signSave(Article article,@RequestParam(value = "signDept", required = false)String[] signDeptArray,HttpSession session,HttpServletRequest request){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setPublishDeptId(info.getDeptId());
			article.setPublishUserId(info.getId());
			//如果，作者没有填写，则默认为上报人
			if(StringUtils.isBlank(article.getAuthor())){
				article.setAuthor(info.getUserName());
			}
			//消息来源
			//article.setNewsfrom(info.getDeptName()+"上报");
			article.setNewsfrom(info.getDeptName());
		}
		//文章主键Id
		String keyId=articleService.save(article);
		
		//根据文章主键,删除原有的签收信息
		signService.deleteSignByArticleId(keyId);
		
		//发送新的签收信息
		if(signDeptArray!=null){
			for (String sDept : signDeptArray) {
				//签收信息
				Sign sign=new Sign();
				sign.setArticleId(keyId);
				sign.setArticleType(article.getArticleType());
				//签收部门ID
				sign.setSignDeptId(sDept);
				//签收人ID,签收操作的时候记录
				sign.setSignUserId("");
				//签收状态(0 未签收 1已签收)
				sign.setSignState("0");
				sign.setSignContent("");
				sign.setSignDate(new Date());
				signService.save(sign);
			}
		}
		return "redirect:/sois/signList";
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
	@RequestMapping("/feedbackSave")
	public String feedbackSave(Article article,@RequestParam(value = "signDept", required = false)String[] signDeptArray,HttpSession session,HttpServletRequest request){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setPublishDeptId(info.getDeptId());
			article.setPublishUserId(info.getId());
			//如果，作者没有填写，则默认为上报人
			if(StringUtils.isBlank(article.getAuthor())){
				article.setAuthor(info.getUserName());
			}
			//消息来源
			//article.setNewsfrom(info.getDeptName()+"上报");
			article.setNewsfrom(info.getDeptName());
		}
		//文章主键Id
		String keyId=articleService.save(article);
		
		//根据文章主键,删除原有的签收信息
		signService.deleteSignByArticleId(keyId);
		
		//发送新的签收信息
		if(signDeptArray!=null){
			for (String sDept : signDeptArray) {
				//签收信息
				Sign sign=new Sign();
				sign.setArticleId(keyId);
				sign.setArticleType(article.getArticleType());
				//签收部门ID
				sign.setSignDeptId(sDept);
				//签收人ID,签收操作的时候记录
				sign.setSignUserId("");
				//签收状态(0 未签收 1已签收)
				sign.setSignState("0");
				sign.setSignContent("");
				sign.setSignDate(new Date());
				signService.save(sign);
			}
		}
		return "redirect:/sois/feedbackList";
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
	public Object getArticleList(int page,int limit,String articleType,String articleTitle,HttpSession session){
		EUIPager ePager=new EUIPager(page,limit);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", articleType);
		param.put("articleTitle", articleTitle);
		param.put("page", page);
		param.put("limit", limit);
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			//此处需要注意，如果能要看到部门上报，则只加publishDeptId参数，不加publishUserId
			//param.put("publishUserId", info.getId());
			param.put("publishDeptId", info.getDeptId());
		}
		//防止缓存报错
		if(!param.containsKey("topicId")){
			param.put("topicId", "");
		}
		if(!param.containsKey("articleTitle")){
			param.put("articleTitle", "");
		}
		
		if(!param.containsKey("publishDeptId")){
			param.put("publishDeptId", "");
		}
		if(!param.containsKey("checkState")){
			param.put("checkState", "");
		}
		
		EUIGrid grid=articleService.pagerListForSois(ePager,param);
		return DataPipeUtil.toLayUIGrid(grid);
	}
	
	
	/**
	 * 
	 * 获取签收信息列表
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:26:01
	 * @history:
	 * @param page
	 * @param limit
	 * @return Object
	 */
	@RequestMapping("/getSignList")
	@ResponseBody
	public Object getSignList(int page,int limit,String articleId,HttpSession session){
		EUIPager ePager=new EUIPager(page,limit);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleId", articleId);
		EUIGrid grid=signService.pagerList(ePager,param);
		return DataPipeUtil.toLayUIGrid(grid);
	}
	
	/**
	 * 
	 * 我的反馈列表
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:26:01
	 * @history:
	 * @param page
	 * @param limit
	 * @return Object
	 */
	@RequestMapping("/getMyFeedBackList")
	@ResponseBody
	public Object getMyFeedBackList(int page,int limit,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		EUIPager ePager=new EUIPager(page,limit);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", "6");
		param.put("signUserId", info.getId());
		EUIGrid grid=signService.pagerSignArticleList(ePager,param);
		return DataPipeUtil.toLayUIGrid(grid);
	}
	
	
	
	/**
	 * 
	 * 我的签收列表
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:26:01
	 * @history:
	 * @param page
	 * @param limit
	 * @return Object
	 */
	@RequestMapping("/getMySignList")
	@ResponseBody
	public Object getMySignList(int page,int limit,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		EUIPager ePager=new EUIPager(page,limit);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", "5");
		param.put("signUserId", info.getId());
		EUIGrid grid=signService.pagerSignArticleList(ePager,param);
		return DataPipeUtil.toLayUIGrid(grid);
	}
	
	/**
	 * 
	 * 跳转到反馈列表
	 * @author: wyc
	 * @createTime: 2018年3月8日 下午7:49:09
	 * @history:
	 * @param page
	 * @param limit
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/showFeedbackList")
	public Object showFeedbackList(){
		return "/sois/showFeedbackList";
	}
	
	
	/**
	 * 
	 * 跳转到签收列表
	 * @author: wyc
	 * @createTime: 2018年3月8日 下午7:49:09
	 * @history:
	 * @param page
	 * @param limit
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/showSignList")
	public Object showSignList(){
		return "/sois/showSignList";
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
	 * 首页-采用EasyUI作为主框架,解决IE8兼容问题
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午11:34:34
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/indexs")
	public Object indexs() {
		return "/sois/indexs";
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
	 * 信息报送列表-签收信息
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/signList")
	public Object signList() {
		return "/sois/signList";
	}
	
	
	/**
	 * 
	 * 信息报送-签收信息
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/signAdd")
	public Object signAdd() {
		return "/sois/signAdd";
	}
	
	
	/**
	 * 
	 * 编辑文章-签收信息
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/signEdit/{id}")
	public ModelAndView signEdit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/signEdit");
		Article article=articleService.getArticleById(id);
		List<SignInfoVo> signList=signService.getSignListByArticleId(id);
		mv.addObject("article",article);
		mv.addObject("signList",signList);
		return mv;
	}
	
	/**
	 * 
	 * 信息报送列表-反馈信息
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/feedbackList")
	public Object feedbackList() {
		return "/sois/feedbackList";
	}
	
	
	/**
	 * 
	 * 信息报送列表-警务视频
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/videoList")
	public Object videoList() {
		return "/sois/videoList";
	}
	
	
	/**
	 * 
	 * 信息报送列表-添加警务视频
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/videoAdd")
	public Object videoAdd() {
		return "/sois/videoAdd";
	}
	
	
	/**
	 * 
	 * 信息报送列表-警务视频编辑页面
	 * @author: wyc
	 * @createTime: 2018年2月25日 上午10:33:30
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/videoEdit/{id}")
	public ModelAndView videoEdit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/videoEdit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
		return mv;
	}
	
	
	/**
	 * 
	 * 信息报送-反馈信息
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:05:54
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/feedbackAdd")
	public Object feedbackAdd() {
		return "/sois/feedbackAdd";
	}
	
	
	/**
	 * 
	 * 编辑文章-反馈信息
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/feedbackEdit/{id}")
	public ModelAndView feedbackEdit(@PathVariable String id) {
		ModelAndView mv=new ModelAndView("sois/feedbackEdit");
		Article article=articleService.getArticleById(id);
		List<SignInfoVo> signList=signService.getSignListByArticleId(id);
		mv.addObject("article",article);
		mv.addObject("signList",signList);
		return mv;
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
				logger.info("{}登录[报送系统]成功,时间为{}",info.getUserName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//跳转到后台管理主页面
				mv.setViewName("/sois/indexs");
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
       //DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       binder.registerCustomEditor(Date.class,new CustomDateEditor(format, true)); 
   }

}
