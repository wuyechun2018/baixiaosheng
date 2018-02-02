package com.bxs.service.impl;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.WeatherForecastDao;
import com.bxs.pojo.WeatherForecast;
import com.bxs.service.WeatherForecastService;

@Service
public class WeatherForecastServiceImpl implements WeatherForecastService{

	@Autowired
	private WeatherForecastDao weatherForecastDao;
	
	@Override
	public void initData() {
		//获取从今天起7天的日期
		//从数据库中根据日期进行查询，如果有则不操作，没有则插入该日期的数据
		for(int i=0;i<30;i++){
			DateTime now = new DateTime();
			DateTime tomorrow = now.plusDays(i);
			String dataStr=tomorrow.toString("yyyy-MM-dd");
			if(isRecordNotExist(dataStr)){
				insertRecord(dataStr);
			}
		}
		
		
		
	}

	private void insertRecord(String dataStr) {
		WeatherForecast weatherForecast=new WeatherForecast();
		weatherForecast.setWeatherDate(dataStr);
		weatherForecastDao.save(weatherForecast);
	}

	/**
	 * 
	 * 根据日期判断天气记录是否存在
	 * @author: wyc
	 * @createTime: 2018年2月2日 下午11:32:44
	 * @history:
	 * @param dataStr
	 * @return boolean
	 */
	private boolean isRecordNotExist(String dataStr) {
		return false;
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		return null;
	}

}
