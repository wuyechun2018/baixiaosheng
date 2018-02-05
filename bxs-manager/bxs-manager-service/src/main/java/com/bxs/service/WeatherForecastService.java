package com.bxs.service;

import java.util.Map;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.WeatherForecast;

public interface WeatherForecastService {

	void initData();

	EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	void save(WeatherForecast weatherForecast);

	WeatherForecast getWeatherForecastById(String id);

	WeatherForecast getWeatherForecastByWeatherDate(String weatherDateStr);

}
