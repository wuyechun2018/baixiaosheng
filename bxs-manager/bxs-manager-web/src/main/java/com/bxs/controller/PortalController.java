package com.bxs.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.SignInfoVo;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.Topic;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.WeatherForecast;
import com.bxs.service.ArticleService;
import com.bxs.service.SignService;
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
	
	@Autowired
	private SignService signService;

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
	 * 文章列表
	 * @author: wyc
	 * @createTime: 2018年2月6日 上午10:01:48
	 * @history:
	 * @return String
	 */
	@RequestMapping(value = "/searchList")
	public ModelAndView searchList(String keys) {
		ModelAndView mv=new ModelAndView("/portal/list");
		mv.addObject("keys", keys);
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
	 * 信息排名
	 * @author: wyc
	 * @createTime: 2018年2月6日 下午3:44:50
	 * @history:
	 * @param topicCode
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/info-list")
	public ModelAndView infoList(String topicCode) {
		ModelAndView mv=new ModelAndView("/portal/info-list");
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
	public ModelAndView content(String id,HttpSession session) {
		ModelAndView mv=new ModelAndView("/portal/content");
		ArticleInfoVo articleInfoVo=articleService.getArticleInfoById(id);
		articleService.addViewCount(id);
		mv.addObject("articleInfoVo",articleInfoVo);
		String articleType=articleInfoVo.getArticleType();
		//4为信息报送，5为签收信息报送
		if(StringUtils.isNotBlank(articleType)&&("5".equals(articleType)||"6".equals(articleType))){
			List<SignInfoVo> signList=signService.getSignListByArticleId(id);
			mv.addObject("signList",signList);
		}
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			mv.addObject("userInfo",info);
			//判断是否需要签收
			List<SignInfoVo> needSignList=signService.getSignListByArticleIdAndDeptId(id,info.getDeptId());
			if(!needSignList.isEmpty()){
				mv.addObject("needSign",true);
				//判断是否已经签收
				SignInfoVo sInfo=needSignList.get(0);
				//如果已经签收，则加入"已签收标志"，否则不加，前端直接判断是否有该标志即可
				if(sInfo.getSignState()!=null&&"1".equals(sInfo.getSignState())){
					mv.addObject("hasSigned",true);
				}
				mv.addObject("signConent",sInfo.getSignContent()==null?"":sInfo.getSignContent());
			}
		}
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
	 * 通讯录
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午5:26:25
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/contacts")
	@ResponseBody
	public Object contacts() {
		ModelAndView mv=new ModelAndView("/portal/contacts");
		return mv;
	}
	
	
	/**
	 * 
	 * 获取一周的天气字符串
	 * @author: wyc
	 * @createTime: 2018年2月7日 下午4:34:18
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/getWeekDayInfo")
	@ResponseBody
	public Object getWeekDayInfo() {
		List<String> resultList=new ArrayList<String>();
		for(int i=0;i<7;i++){
			DateTime now = new DateTime();
			DateTime tomorrow = now.plusDays(i);
			String dayStr=tomorrow.toString("yyyy-MM-dd");
			String showStr=tomorrow.toString("yyyy年MM月dd日")+" "+tomorrow.dayOfWeek().getAsShortText(Locale.CHINESE);
			WeatherForecast wf=weatherForecastService.getWeatherForecastByWeatherDate(dayStr);
			if(wf!=null){
				if(wf.getWeatherConditions()!=null){
					showStr=showStr+" "+wf.getWeatherConditions();
				}else{
					showStr=showStr+" ";
				}
			}
			resultList.add(showStr);
		}
		return resultList;
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
