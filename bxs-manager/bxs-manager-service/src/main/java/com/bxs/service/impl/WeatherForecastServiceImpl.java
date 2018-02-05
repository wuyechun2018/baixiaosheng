package com.bxs.service.impl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.WeatherForecastDao;
import com.bxs.pojo.SysUser;
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
			if(!isRecordExist(dataStr)){
				insertRecord(dataStr);
			}
		}
		
		
		
	}

	/**
	 * 
	 * 插入数据,天气状况 为空
	 * @author: wyc
	 * @createTime: 2018年2月3日 上午10:21:26
	 * @history:
	 * @param dataStr void
	 */
	private void insertRecord(String dataStr) {
		WeatherForecast weatherForecast=new WeatherForecast();
		try {
			weatherForecast.setWeatherDate(new SimpleDateFormat("yyyy-MM-dd").parse(dataStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	private boolean isRecordExist(String dataStr) {
		Long count=weatherForecastDao.getTotalCountByDataStr(dataStr);
		if(count>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(weatherForecastDao.getTotalCount(param));
		grid.setRows(weatherForecastDao.pagerList(ePager,param));
		return grid;
	}

	@Override
	public void save(WeatherForecast weatherForecast) {
		// 更新操作
		if (StringUtils.isNotBlank(weatherForecast.getId())) {
			WeatherForecast existWeatherForecast=getWeatherForecastById(weatherForecast.getId());
			weatherForecast.setWeatherDate(existWeatherForecast.getWeatherDate());
			weatherForecastDao.update(weatherForecast);
		} else {
			// 保存操作
			weatherForecastDao.save(weatherForecast);
		}

	}
	
	@Override
	public WeatherForecast getWeatherForecastById(String id) {
		return weatherForecastDao.getWeatherForecastById(id);
	}

	@Override
	public WeatherForecast getWeatherForecastByWeatherDate(String weatherDateStr) {
		return weatherForecastDao.getWeatherForecastByWeatherDate(weatherDateStr);
	}

}
