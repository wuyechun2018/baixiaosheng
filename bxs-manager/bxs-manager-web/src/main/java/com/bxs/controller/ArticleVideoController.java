package com.bxs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.pojo.Article;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;

/**
 * 
 * 文章维护控制层-视频类型文章(1:普通 2:图片 3：视频)
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月31日 下午10:05:21
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/articleVideo")
public class ArticleVideoController {
	
	@Autowired
	private ArticleService articleService;
	
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
		return "redirect:/eui/article-video/list";
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
		ModelAndView mv=new ModelAndView("/eui/article-video/edit");
		Article article=articleService.getArticleById(id);
		mv.addObject("article",article);
		return mv;
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
		ModelAndView mv=new ModelAndView("/eui/article-video/show");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	/**
	 * 
	 * 文章审核-视频
	 * @author: wyc
	 * @createTime: 2018年1月17日 下午5:05:37
	 * @history:
	 * @return String
	 */
	@RequestMapping("/check")
	public ModelAndView check(String id) {
		ModelAndView mv=new ModelAndView("/eui/article-video/check");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		mv.addObject("articleInfoVo",articleInfoVo);
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
