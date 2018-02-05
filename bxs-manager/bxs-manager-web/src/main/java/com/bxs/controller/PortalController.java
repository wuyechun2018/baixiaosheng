package com.bxs.controller;
import java.util.Locale;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.Topic;
import com.bxs.pojo.WeatherForecast;
import com.bxs.service.ArticleService;
import com.bxs.service.WeatherForecastService;
@Controller
@RequestMapping("/portal")
public class PortalController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private WeatherForecastService weatherForecastService;

	/**
	 * 
	 * 公用跳转方法
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午4:53:37
	 * @history:
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/index")
	public String getDefinedPage() {
		return "/portal/index";
	}
	
	/**
	 *  
	 * 查看文章内容
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午10:45:56
	 * @history:
	 * @param id
	 * @return ModelAndView
	 */
	@RequestMapping("/content")
	public ModelAndView content(String id) {
		ModelAndView mv=new ModelAndView("/portal/content");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		articleService.addViewCount(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		return mv;
	}
	
	
	
	/**
	 * 
	 * 获取当天信息
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午10:46:45
	 * @history:
	 * @param topic
	 * @return Object
	 */
	@RequestMapping("/getDayInfo")
	@ResponseBody
	public Object getDayInfo() {
		DateTime now = new DateTime();
		String dayStr=now.toString("yyyy-MM-dd");
		String showStr=now.toString("yyyy年MM月dd日")+" "+now.dayOfWeek().getAsShortText(Locale.CHINESE);
		WeatherForecast wf=weatherForecastService.getWeatherForecastByWeatherDate(dayStr);
		if(wf!=null){
			showStr=showStr+" "+wf.getWeatherConditions();
		}
		return new JsonMsg(showStr);
	}
	
	
}
