package com.bxs.common.utils;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import com.bxs.common.vo.EUIPager;

public class BaseController {

	/**
	 * 
	 * 从Http请求中获取EasyUI的Grid提交的参数,封装成分页类
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午8:22:02
	 * @history:
	 * @param request
	 * @return EUIPager
	 */
	public EUIPager getPager(HttpServletRequest request){
		EUIPager pager=new EUIPager();
    	if(StringUtils.isNotBlank(request.getParameter("rows"))){
    		pager.setPage(Integer.valueOf(request.getParameter("page")));
    	}
    	if(StringUtils.isNotBlank(request.getParameter("rows"))){
    		pager.setRows(Integer.valueOf(request.getParameter("rows")));
    	}
    	return pager;
    }
	
	/**
	 * 
	 * 从Http请求中获取参数,封装成Map
	 * @author: wyc
	 * @createTime: 2018年1月28日 上午10:53:50
	 * @history:
	 * @param request
	 * @return Map<String,Object>
	 */
	public Map<String,Object> getParamMap(HttpServletRequest request) {
		Map<String,Object> param = new HashMap<String,Object>();
		Map<String, String[]> pmap = request.getParameterMap();
		if (pmap != null) {
			for (String key : pmap.keySet()) {
				String[] values = pmap.get(key);
				param.put(key, values.length == 1 ? values[0].trim() : values);
			}
		}
		return param;
	}
	
	
	
}
