package com.bxs.controller;
import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.DataState;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.HtmlUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;

/***
 * 文章维护控制层-普通类型文章(1:普通 2:图片 3：视频)
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月22日 下午4:09:56
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{
	
	@Autowired
	private ArticleService articleService;
	
	
	/**
	 * 
	 * 根据Id获取文章内容
	 * @author: wyc
	 * @createTime: 2018年10月11日 下午9:28:39
	 * @history:
	 * @param id
	 * @return Object
	 */
	@RequestMapping("/data/{id}")
	@ResponseBody
	public Object getArticleById(@PathVariable String id){
		Article article=articleService.getArticleById(id);
		article.setArticleContent(HtmlUtil.delHTMLTag(article.getArticleContent()));
		return article;
	}
	
	
	
	/**
	 * 
	 * 跳转到后台管理的编辑页面
	 * @author: wyc
	 * @createTime: 2018年1月31日 下午7:13:57
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/euiEdit")
	public ModelAndView euiEdit(String id) {
		ModelAndView mv=new ModelAndView("/eui/article/edit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
		return mv;
	}
	
	
	
	/**
	 * 
	 * 返回文章列表数据
	 * @author: wyc
	 * @createTime: 2018年1月31日 上午11:04:49
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerListNoCache")
	@ResponseBody
	public  EUIGrid pagerListNoCache(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return articleService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 * 返回文章列表数据
	 * @author: wyc
	 * @createTime: 2018年1月31日 上午11:04:49
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerListOrderByCreateDate")
	@ResponseBody
	public  EUIGrid pagerListOrderByCreateDate(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return articleService.pagerListOrderByCreateDate(ePager,param);
	}
	
	
	/**
	 * 
	 * 获取最热门文章
	 * @author: wyc
	 * @createTime: 2018年5月9日 下午7:06:25
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/topPagerList")
	@ResponseBody
	public  EUIGrid topPagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return articleService.topPagerList(ePager,param);
	}
	
	
	
	/**
	 * 
	 * 返回文章列表数据
	 * @author: wyc
	 * @createTime: 2018年1月31日 上午11:04:49
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		//return articleService.pagerList(ePager,param);
		//[page=1, articleTitle=, topicId=, publishDeptId=, checkState=, rows=10]
		if(!param.containsKey("articleType")){
			param.put("articleType", "");
		}
		if(!param.containsKey("articleTitle")){
			param.put("articleTitle", "");
		}
		return articleService.pagerListFast(ePager,param);
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
		ModelAndView mv=new ModelAndView("article/show");
		Article article=articleService.getArticleById(id);
		article.setViewCount(article.getViewCount()+1);
		articleService.save(article);
		mv.addObject("article",article);
		return mv;
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
		ModelAndView mv=new ModelAndView("article/edit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
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
		articleService.delete(id);
		return "redirect:/article/manager";
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
		articleService.delete(id);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * EasyUI 页面批量删除
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午3:19:45
	 * @history:
	 * @param request
	 * @return String
	 */
	@RequestMapping("/batchEuiDelete")
	@ResponseBody
	public Object batchEuiDelete(HttpServletRequest request) {
		String ids=request.getParameter("ids");
		String[] idArray=ids.split(",");
		for(int i=0;i<idArray.length;i++){
			articleService.delete(idArray[i]);
		}
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 文章预览
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/showArticle")
	public ModelAndView showArticle(String id) {
		ModelAndView mv=new ModelAndView("/eui/article/show");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	/**
	 * 
	 * 文章审核
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/check")
	public ModelAndView check(String id) {
		ModelAndView mv=new ModelAndView("/eui/article/check");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	/**
	 * 
	 * 文章列表
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView("article/list");
		List<Article> list=articleService.getList();
		mv.addObject("articleList",list);
		return mv;
	}
	
	
	/**
	 * 
	 * 文章管理页面
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/manager")
	public ModelAndView manager() {
		ModelAndView mv=new ModelAndView("article/manager");
		List<Article> list=articleService.getList();
		mv.addObject("articleList",list);
		return mv;
	}
	
	
	/**
	 * 
	 * 跳转到新增文章表单页面
	 * @author: wyc
	 * @createTime: 2018年1月19日 下午5:08:29
	 * @history:
	 * @return String
	 */
	@RequestMapping("/add")
	public String add() {
		return "article/add";
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
	public String save(Article article) {
		article.setCreateDate(new Date());
		article.setUpdateDate(new Date());
		//设置为在用
		article.setDataState(DataState.Use.getCode());
		//初始化浏览次数为0
		article.setViewCount(0);
		article.setDisplayOrder(0);
		articleService.save(article);
		return "redirect:/article/manager";
	}

	
	/**
	 * 
	 * EasyUI提交过来的表单信息，进行保存
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午5:39:26
	 * @history:
	 * @param article
	 * @return String
	 */
	@RequestMapping("/euiSave")
	public String euiSave(Article article,HttpSession session){
		
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setPublishDeptId(info.getDeptId());
			article.setPublishUserId(info.getId());
		}
		
		articleService.save(article);
		return "redirect:/eui/article/list";
	}
	
	/**
	 * 
	 * 图片预览
	 * @author: wyc
	 * @createTime: 2018年1月29日 下午8:38:57
	 * @history:
	 * @return Object
	 */
	@RequestMapping(value="/preView")
	@ResponseBody
	public Object preView(MultipartFile preimage){
		String fileName=new DateTime().toString("yyyyMMddHHmmss")+"/"+preimage.getOriginalFilename();
		String realPath="/media-data/image/";
		File tarFile = new File(realPath, fileName);
		if (!tarFile.exists()) {
			tarFile.mkdirs();
		}
		try {
			preimage.transferTo(tarFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new JsonMsg(true,realPath+fileName);
	}
	
	
	
	/**
	 * 
	 * 图片预览-另一种写法，解决IE中返回application/json弹出下载框问题
	 * @author: wyc
	 * @createTime: 2018年1月29日 下午8:38:57
	 * @history:
	 * @return Object
	 * @throws IOException 
	 */
	@RequestMapping("/preViewImage")
	public void preViewImage(MultipartFile preimage,HttpServletResponse response) throws IOException{
		String fileName=new DateTime().toString("yyyyMMddHHmmss")+"/"+preimage.getOriginalFilename();
		String realPath="/media-data/image/";
		File tarFile = new File(realPath, fileName);
		if (!tarFile.exists()) {
			tarFile.mkdirs();
		}
		try {
			preimage.transferTo(tarFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		//response.setHeader("content-type", "text/html;charset=UTF-8");
		Writer writer = response.getWriter();
		writer.write("{\"success\": \""+true+"\",\"msg\":\'"+realPath+fileName+"\'}");
	}
	
	/**
	 * 
	 *  Portal页面查询-根据文章类型编码获取文章
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadArticleByTopic")
	@ResponseBody
	public Object loadArticleByTopic(String articleType,String topicCode,String frontSliderState,int page,int rows){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", articleType);
		param.put("topicCode", topicCode);
		param.put("frontSliderState", frontSliderState);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		return articleService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 *  Portal页面查询-根据文章类型编码获取文章
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadArticleByTopicForVideo")
	@ResponseBody
	public Object loadArticleByTopicForVideo(String articleType,String topicCode,String frontSliderState,int page,int rows){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", articleType);
		param.put("topicCode", topicCode);
		param.put("frontSliderState", frontSliderState);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		return articleService.pagerListForVideo(ePager,param);
	}
	
	/**
	 * 
	 *  Portal页面查询-首页推荐
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadSytjArticle")
	@ResponseBody
	public Object loadSytjArticle(String articleType,String topicCode,String frontSliderState,int page,int rows){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", articleType);
		param.put("topicCode", topicCode);
		param.put("frontSliderState", frontSliderState);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		return articleService.loadSytjArticle(ePager,param);
	}
	
	
	
	
	/**
	 * 
	 *  Portal页面查询-根据文章类型编码获取文章(去除首页不展示的字段，提升首页加载速度)
	 *  @Cacheable(value="myCache", key="#topicCode+#frontSliderState+page+''+rows")
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadMiniArticleByTopic")
	@ResponseBody
	public Object loadMiniArticleByTopic(String articleType,String topicCode,String frontSliderState,int page,int rows){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleType", articleType);
		param.put("topicCode", topicCode);
		param.put("frontSliderState", frontSliderState);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		//return articleService.pagerMiniList(ePager,param);
		return articleService.pagerMiniListByDate(ePager,param);
	}
	
	/**
	 * 
	 *  Portal页面查询-根据文章类型编码获取文章
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadArticle")
	@ResponseBody
	public Object loadArticle(int page,int rows,HttpServletRequest request){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=getParamMap(request);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		return articleService.pagerList(ePager,param);
	}
	
	/**
	 * 
	 *  Portal页面查询-根据文章类型编码获取文章
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:52:55
	 * @history:
	 * @param topicCode
	 * @return Object
	 */
	@RequestMapping("/loadArticleForOpt")
	@ResponseBody
	public Object loadArticleForOpt(int page,int rows,HttpServletRequest request){
		EUIPager ePager=new EUIPager(page,rows);
		Map<String,Object> param=getParamMap(request);
		//首页展示审核通过的文章
		param.put("checkState", "1");
		
		
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
		
		if(!param.containsKey("frontSliderState")){
			param.put("frontSliderState", "");
		}
		
		
		//如果有关键字搜索
		if(param.get("articleTitle")!=null&&StringUtils.isNotBlank(param.get("articleTitle").toString())){
			//return articleService.pagerList(ePager,param);
			//return articleService.pagerListFast(ePager,param);
			return articleService.searcheByKey(ePager,param);
		}else{
			if(rows==10000){
				//如果只是列表初始化的时候，用来获取数量的
				EUIGrid grid = new EUIGrid();
				grid.setTotal(articleService.getTotalCountForOpt(param));
				return grid;
			}else{
				
				//#param['topicId'].toString()+#param['articleTitle'].toString()+#param['publishDeptId'].toString()+#param['checkState'].toString()+#ePager.page+''+#ePager.rows
				//防止缓存报错
				/**
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
				}**/
				
				return articleService.pagerMiniList(ePager,param);
				//return articleService.pagerListFast(ePager,param);
			}
		}
	}
	
	
	
	
	/***
	 * 
	 * 设置是否为"首页推荐"
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午3:35:21
	 * @history:
	 * @param id
	 * @param frontSliderState
	 * @return Object
	 */
	@RequestMapping("/saveFrontState")
	@ResponseBody
	public Object saveFrontState(String id,String frontSliderState){
		Article article=articleService.getArticleById(id);
		article.setFrontSliderState(frontSliderState);
		articleService.saveFrontSliderState(article);
		return new JsonMsg();
	}
	
	/***
	 * 
	 * 设置审核状态
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午3:35:21
	 * @history:
	 * @param id
	 * @param frontSliderState
	 * @return Object
	 */
	@RequestMapping("/saveCheckState")
	@ResponseBody
	public Object saveCheckState(String id,String checkState,HttpSession session){
		Article article=articleService.getArticleById(id);
		article.setCheckState(checkState);
		
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			article.setResEdtior(info.getUserName());
		}
		
		articleService.saveCheckState(article);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 置顶操作，该文章置于本栏目第一条
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午3:37:06
	 * @history:
	 * @param id
	 * @return Object
	 */
	@RequestMapping("/saveTopCount")
	@ResponseBody
	public Object saveTopCount(String id){
		Article article=articleService.getArticleById(id);
		articleService.saveTopCount(article);
		return new JsonMsg();
	}
	
	/**
	 * 
	 * 置顶操作，该文章置于本栏目第一条
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午3:37:06
	 * @history:
	 * @param id
	 * @return Object
	 */
	@RequestMapping("/toTop")
	@ResponseBody
	public Object toTop(String id,String topState){
		Article article=articleService.getArticleById(id);
		article.setTopState(topState);
		articleService.toTop(article);
		return new JsonMsg();
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
	
	
	/**
	 * 
	 * 处理数据  xx精神/本站原创/孙xx/2018-1-26
	 * @author: wyc
	 * @createTime: 2018年2月9日 下午2:31:10
	 * @history:
	 * @param id
	 * @return Object
	 * @throws ParseException 
	 */
	@RequestMapping("/handleTheData")
	@ResponseBody
	public Object handleTheData(String id) throws ParseException{
		EUIPager ePager=new EUIPager(1,100);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("articleTitle", "/");
		EUIGrid grid=articleService.pagerList(ePager,param);
		for(int i=0;i<grid.getRows().size();i++){
			ArticleInfoVo article=(ArticleInfoVo) grid.getRows().get(i);
			String[] titleArray=article.getArticleTitle().split("/");
			
			article.setNewsfrom(titleArray[1]);
			article.setAuthor(titleArray[2]);
			article.setPublishDate(new SimpleDateFormat("yyyy-MM-dd").parse(titleArray[3]));
			
			articleService.savePlusInfo(article);
		}
		return new JsonMsg();
	}
	
	

}
