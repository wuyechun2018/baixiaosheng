package com.bxs.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.ConfigInfoVo;
import com.bxs.pojo.Topic;
import com.bxs.pojo.TopicArticleVo;
import com.bxs.service.ArticleService;
import com.bxs.service.ConfigService;
import com.bxs.service.TopicService;

/**
 * 
 * 专题
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年3月13日 上午7:23:19
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/subject")
public class SubjectController {
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private ArticleService articleService;
	
	
	
	/**
	 * 
	 * 专题首页
	 * @author: wyc
	 * @createTime: 2018年3月14日 上午7:56:32
	 * @history:
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(String code) {
		ModelAndView mv=new ModelAndView("/subject/index");
		List<ConfigInfoVo> list=configService.getConfigByTypeCode(code);
		if(!list.isEmpty()){
			ConfigInfoVo vo=list.get(0);
			mv.addObject("configInfoVo", vo);
			//展示的专题列表
			List<Topic> topicList=topicService.getListByIds(vo.getConfigValue());
			mv.addObject("topicList", topicList);
			//获取专题下文章
			List<TopicArticleVo> articleList=new ArrayList<TopicArticleVo>();
			for (Topic topic : topicList) {
				Map<String,Object> param=new HashMap<>();
				//首页展示审核通过的文章
				EUIPager ePager=new EUIPager(1,8);
				param.put("checkState", "1");
				param.put("topicCode", topic.getTopicCode());
				//EUIGrid articleGrid=articleService.pagerList(ePager,param);
				EUIGrid articleGrid=articleService.pagerMiniList(ePager,param);
				
				TopicArticleVo topicArticleVo=new TopicArticleVo(topic,articleGrid);
				articleList.add(topicArticleVo);
			}
			mv.addObject("articleList", articleList);
		}
		return mv;
	}
	
	
	/**
	 * 
	 * 文章查看页面
	 * @author: wyc
	 * @createTime: 2018年3月14日 下午2:05:20
	 * @history:
	 * @param id   文章主键ID
	 * @param code 专题编码
	 * @return ModelAndView
	 */
	@RequestMapping("/content")
	public ModelAndView content(String id,String code) {
		ModelAndView mv=new ModelAndView("/subject/content");
		List<ConfigInfoVo> list=configService.getConfigByTypeCode(code);
		if(!list.isEmpty()){
			ConfigInfoVo vo=list.get(0);
			mv.addObject("configInfoVo", vo);
			//展示的专题列表
			List<Topic> topicList=topicService.getListByIds(vo.getConfigValue());
			mv.addObject("topicList", topicList);
		}
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		articleService.addViewCount(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	

	/**
	 * 
	 * 列表页面
	 * @author: wyc
	 * @createTime: 2018年3月14日 下午2:05:20
	 * @history:
	 * @param id   文章主键ID
	 * @param code 专题编码
	 * @return ModelAndView
	 */
	@RequestMapping("/list")
	public ModelAndView list(String topicCode,String code) {
		ModelAndView mv=new ModelAndView("/subject/list");
		List<ConfigInfoVo> list=configService.getConfigByTypeCode(code);
		if(!list.isEmpty()){
			ConfigInfoVo vo=list.get(0);
			mv.addObject("configInfoVo", vo);
			//展示的专题列表
			List<Topic> topicList=topicService.getListByIds(vo.getConfigValue());
			mv.addObject("topicList", topicList);
		}
		//当前所在的栏目
		Topic currentTopic=topicService.getTopicByCode(topicCode);
		mv.addObject("currentTopic", currentTopic);
		return mv;
	}
	
	/**
	 * 
	 * 公用跳转方法
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午3:15:09
	 * @history:
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/{page}")
	public String getDefinedPage(@PathVariable("page") String page) {
		return "/subject/"+page;
	}

}
