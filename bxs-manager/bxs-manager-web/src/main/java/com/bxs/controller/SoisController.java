package com.bxs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.DataPipeUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Article;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.ArticleService;

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

}
