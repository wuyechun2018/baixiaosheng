package com.bxs.controller;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.DataState;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;

/***
 * 
 * 文章维护控制层
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
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return articleService.pagerList(ePager,param);
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
	@RequestMapping("/preView")
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
	

}
