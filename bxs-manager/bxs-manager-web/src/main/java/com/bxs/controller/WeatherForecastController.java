package com.bxs.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.WeatherForecast;
import com.bxs.service.WeatherForecastService;

/**
 * 
 * 天气预报
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年2月2日 下午11:14:06
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/weatherForecast")
public class WeatherForecastController extends BaseController{
	
	@Autowired
	private WeatherForecastService weatherForecastService;
	
	
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(WeatherForecast weatherForecast) {
		weatherForecastService.save(weatherForecast);
		return new JsonMsg();
	}
	
	
	
	/**
	 * 
	 * 初始化数据
	 * @author: wyc
	 * @createTime: 2018年2月3日 上午10:09:05
	 * @history:
	 * @return JsonMsg
	 */
	@RequestMapping("/initData")
	@ResponseBody
	public JsonMsg initData() {
		weatherForecastService.initData();
		return new JsonMsg();
	}
	
	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2018年2月3日 上午10:09:19
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return weatherForecastService.pagerList(ePager,param);
	}

}
