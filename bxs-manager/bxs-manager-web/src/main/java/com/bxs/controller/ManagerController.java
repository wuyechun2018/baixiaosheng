package com.bxs.controller;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	/**
	 * 
	 * 跳转到系统管理主页面
	 * @author: wyc
	 * @createTime: 2018年1月24日 下午4:06:52
	 * @history:
	 * @return String
	 */
	@RequestMapping("/index")
	public String index() {
		return "/manager/index";
	}
	
	
	/**
	 * 
	 * 获取系统运行基本信息
	 * @author: wyc
	 * @createTime: 2018年1月24日 下午4:36:14
	 * @history:
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/sysinfo")
	public ModelAndView getSysInfo(HttpServletRequest request){
        Properties props = System.getProperties();
		long maxMemory = Runtime.getRuntime().maxMemory();
		long totalMemory = Runtime.getRuntime().totalMemory();
		ModelAndView mv = new ModelAndView("/manager/sysinfo");
		//mv.addObject("serverUrl", getServerUrl(request));
		//mv.addObject("host", getHostName());
		//mv.addObject("serverStartTime", getServerStartTime());
		mv.addObject("osName", props.get("os.name"));
		mv.addObject("osVersion", props.get("os.version"));
		mv.addObject("javaHome", props.get("java.home"));
		mv.addObject("javaRuntimeName", props.get("java.runtime.name"));
		mv.addObject("javaVersion", props.get("java.version"));
		mv.addObject("javaVendor", props.get("java.vendor"));
		mv.addObject("javaVmVersion", props.get("java.vm.version"));
		mv.addObject("maxMemory", maxMemory / 1024 / 1024);
		mv.addObject("totalMemory", totalMemory / 1024 / 1024);
		return mv;
	}

}
