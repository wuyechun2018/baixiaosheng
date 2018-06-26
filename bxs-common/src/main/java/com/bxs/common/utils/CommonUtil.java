package com.bxs.common.utils;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
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
	
	/**
	 * 
	 * 获取客户端真实的IP地址
	 * @author: wyc
	 * @createTime: 2018年6月26日 下午5:18:16
	 * @history:
	 * @param request
	 * @return String
	 */
	public static String getClientIP(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }
}
