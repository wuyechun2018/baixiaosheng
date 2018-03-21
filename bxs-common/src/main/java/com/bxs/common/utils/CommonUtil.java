package com.bxs.common.utils;

import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;

public class CommonUtil {

	/**
	 * 
	 * 获取有效的筛选参数个数
	 * @author: wyc
	 * @createTime: 2018年3月19日 下午9:12:12
	 * @history:
	 * @param param
	 * @return int
	 */
	public static int getEffectParamCount(Map<String,Object> param){
		int count=0;
		for (Entry<String, Object> entry : param.entrySet()) {
			if(entry.getValue()!=null&&StringUtils.isNotBlank(entry.getValue().toString())){
				count++;
			}
		}
		return count;
	}
}
