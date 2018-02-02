package com.bxs.pojo;

/**
 * 
 * 天气预报实体类
 * 
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年2月2日 下午11:09:09
 * @history:
 * @version: v1.0
 */
public class WeatherForecast {
	// 主键
	private String id;
	// 时间
	private String weatherDate;
	// 天气情况
	private String weatherConditions;
	// 描述信息
	private String weatherDesc;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWeatherDate() {
		return weatherDate;
	}

	public void setWeatherDate(String weatherDate) {
		this.weatherDate = weatherDate;
	}

	public String getWeatherConditions() {
		return weatherConditions;
	}

	public void setWeatherConditions(String weatherConditions) {
		this.weatherConditions = weatherConditions;
	}

	public String getWeatherDesc() {
		return weatherDesc;
	}

	public void setWeatherDesc(String weatherDesc) {
		this.weatherDesc = weatherDesc;
	}

}
