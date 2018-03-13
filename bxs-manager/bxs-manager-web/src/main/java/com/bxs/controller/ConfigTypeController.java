package com.bxs.controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ConfigType;
import com.bxs.service.ConfigTypeService;

/**
 * 
 * 配置类型 控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年2月1日 下午3:24:39
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/configType")
public class ConfigTypeController {
	
	@Autowired
	private ConfigTypeService configTypeService;
	
	
	/**
	 * 
	 *
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午7:17:44
	 * @history:
	 * @param post
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(ConfigType configType) {
		configTypeService.save(configType);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 根据父主键获取导航类型
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午3:28:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		return configTypeService.getListByPid(pid);
	}
	
	
	/**
	 * 
	 * 根据父主键获取导航类型
	 * @author: wyc
	 * @createTime: 2018年2月1日 下午3:28:08
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPidAndValueType")
	@ResponseBody
	public Object getListByPidAndValueType(String pid,String configValueType){
		return configTypeService.getListByPidAndValueType(pid,configValueType);
	}
	
	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:21:58
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request){
		String id=request.getParameter("id");
		configTypeService.delete(id);
		return new JsonMsg();
	}

}
