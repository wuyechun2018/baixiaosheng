package com.bxs.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.Topic;
import com.bxs.pojo.WeatherForecast;
import com.bxs.service.ArticleService;
import com.bxs.service.TopicService;
import com.bxs.service.UserService;
import com.bxs.service.WeatherForecastService;
@Controller
@RequestMapping("/portal")
public class PortalController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private WeatherForecastService weatherForecastService;
	
	@Autowired
	private UserService userService;
	
	//栏目
	@Autowired
	private TopicService topicService;

	/**
	 * 
	 * 首页
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午4:53:37
	 * @history:
	 * @param module
	 * @param page
	 * @return String
	 */
	@RequestMapping(value = "/index")
	public String index() {
		return "/portal/index";
	}
	
	
	/**
	 * 
	 * 公告弹出框
	 * @author: wyc
	 * @createTime: 2018年2月6日 下午10:33:59
	 * @history:
	 * @return String
	 */
	@RequestMapping(value = "/pop")
	public String pop() {
		return "/portal/pop";
	}
	
	
	/**
	 * 
	 * 通列表
	 * @author: wyc
	 * @createTime: 2018年2月6日 下午10:33:59
	 * @history:
	 * @return String
	 */
	@RequestMapping(value = "/system-list")
	public String systemList() {
		return "/portal/system-list";
	}
	
	
	/**
	 * 
	 * 文章列表
	 * @author: wyc
	 * @createTime: 2018年2月6日 上午10:01:48
	 * @history:
	 * @return String
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(String topicCode) {
		Topic topic=topicService.getTopicByCode(topicCode);
		ModelAndView mv=new ModelAndView("/portal/list");
		mv.addObject("topic", topic);
		return mv;
	}
	
	/**
	 * 
	 * 图片列表
	 * @author: wyc
	 * @createTime: 2018年2月6日 下午3:44:50
	 * @history:
	 * @param topicCode
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/image-list")
	public ModelAndView imageList(String topicCode) {
		Topic topic=topicService.getTopicByCode(topicCode);
		ModelAndView mv=new ModelAndView("/portal/image-list");
		mv.addObject("topic", topic);
		return mv;
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
	
	/**
	 * 
	 * 获取当天生日的姓名列表
	 * @author: wyc
	 * @createTime: 2018年2月5日 下午11:23:46
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/getBirthdayUserList")
	@ResponseBody
	public Object getBirthdayUserList(){
		DateTime now = new DateTime();
		String dayStr=now.toString("MM-dd");
		List<String> list=new ArrayList<String>();
		List<SysUser> userList=userService.getUserListByBirthday(dayStr);
		for (SysUser sysUser : userList) {
			list.add(sysUser.getUserName());
		}
		return list;
	}
	
}
